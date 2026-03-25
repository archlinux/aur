pkgname=ww-manager
pkgver=2.1.8
pkgrel=1
pkgdesc="ww-manager (A Wuthering Waves CLI Manager)"
arch=('any')
url="https://github.com/timetetng/wutheringwaves-cli-manager"
license=('MIT')
depends=(
  'python'
  'python-typer'
  'python-rich'
  'python-certifi'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timetetng/wutheringwaves-cli-manager/archive/refs/tags/v2.1.8.tar.gz")
sha256sums=('23e5eb339390261f0931350b1b356902f89fcb5c3ac3c0326eeb5b3df1ee5cff')

build() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"

  # 1. 安装 Python 包
  python -m installer --destdir="$pkgdir" dist/*.whl

  # 2. 安装 License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 3. 配置自动补全
  # 创建 Zsh、Bash 和 Fish 的系统级补全脚本目录
  install -dm755 "$pkgdir/usr/share/zsh/site-functions"
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

  # 调用刚安装到 pkgdir 下的 ww 命令来生成补全脚本，并输出到对应系统目录
  _WW_COMPLETE=zsh_source "$pkgdir/usr/bin/ww" > "$pkgdir/usr/share/zsh/site-functions/_ww"
  _WW_COMPLETE=bash_source "$pkgdir/usr/bin/ww" > "$pkgdir/usr/share/bash-completion/completions/ww"
  _WW_COMPLETE=fish_source "$pkgdir/usr/bin/ww" > "$pkgdir/usr/share/fish/vendor_completions.d/ww.fish"
}
