# Maintainer: sinbud2004 <sinbud2004@gmail.com>
pkgname=xlsxtomysql
pkgver=2.2.0
pkgrel=1
pkgdesc="Excel to MySQL: convert .xlsx/.xls spreadsheets into CREATE TABLE + INSERT statements (zero-dependency single-file Rust CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Paul-sinbud2004/xlsxtomysql"
license=('MIT')
depends=('python' 'python-openpyxl')
optdepends=('python-xlrd: read Excel 2003 (.xls) spreadsheets')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz")
sha256sums=('8b59e1aa1257a54201f14837e1c8eeabfd57456210bd4073f8a7d8c545a34018')

build() {
    cd "$pkgname-$pkgver"

    # 单文件实现：一句 rustc 即可，不需要 cargo、没有任何 crate 依赖。
    # 参数与上游 build.sh --release 保持一致；RUSTFLAGS 放最后，尊重打包环境。
    rustc --edition 2021 \
          -C opt-level=3 -C lto -C codegen-units=1 -C strip=symbols \
          ${RUSTFLAGS:-} \
          xlsxtomysql.rs -o xlsxtomysql
}

check() {
    cd "$pkgname-$pkgver"

    ./xlsxtomysql --version
    ./xlsxtomysql --help  >/dev/null
    ./xlsxtomysql --man   >/dev/null
    ./xlsxtomysql --lang en --help >/dev/null

    # 英文模式不应残留中文
    if ./xlsxtomysql --lang en --help | grep -qP '[\x{4e00}-\x{9fff}]'; then
        echo "error: English --help still contains CJK characters" >&2
        return 1
    fi

    # 真实转换：仓库自带一张示例表（文本日期 / 手机号 / 百分比）
    ./xlsxtomysql examples/students.xlsx 学生信息 students 1 2 --lang en \
        --out "$srcdir/check.sql" --progress off --no-color >/dev/null

    grep -q 'CREATE TABLE IF NOT EXISTS `students`' "$srcdir/check.sql"
    grep -q '`手机号` varchar(32)'  "$srcdir/check.sql"
    grep -q '`出生日期` date'       "$srcdir/check.sql"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 xlsxtomysql "$pkgdir/usr/bin/xlsxtomysql"

    install -Dm644 docs/xlsxtomysql.1    "$pkgdir/usr/share/man/man1/xlsxtomysql.1"
    install -Dm644 docs/xlsxtomysql.zh.1 "$pkgdir/usr/share/man/zh_CN/man1/xlsxtomysql.1"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
