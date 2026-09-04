# Maintainer: nth233 <mrnothing233@gmail.com>
#
# 中国农历命令行工具（date_nongli / cal_nongli）
# 依据 Arch Wiki 的 Rust 打包规范编写：
#   https://wiki.archlinux.org/title/Rust_package_guidelines
#
# AUR 只提交 PKGBUILD 与 .SRCINFO 两个文件即可。
# 每次发版：改 pkgver/pkgrel，重算 sha256sums，重新生成 .SRCINFO。

pkgname=cal_nongli
pkgver=0.1.1
pkgrel=1
pkgdesc="Chinese lunar calendar CLI: inspect a day or a month with lunar days, ganzhi, solar terms and traditional festivals"
arch=('x86_64')
url="https://github.com/fpg2012/cal_nongli"
license=('MIT')
makedepends=('cargo')
depends=()                       # 纯 Rust，无额外运行库（glibc 为隐式依赖）
source=("https://github.com/fpg2012/cal_nongli/archive/v${pkgver}.tar.gz")
sha256sums=('b091b2afa4ca2dbdb08370bdbbb97d0d38e2b6b38f1a20204aaf0e5c22bbfb45')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # 非 git 源码目录下，build.rs 会自动回退使用 Cargo 版本号，不会失败。
  # --frozen 锁定 Cargo.lock 以获得可复现构建。
  cargo build --release --frozen
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo test --release --frozen
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm755 "target/release/date_nongli" "$pkgdir/usr/bin/date_nongli"
  install -Dm755 "target/release/cal_nongli" "$pkgdir/usr/bin/cal_nongli"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
