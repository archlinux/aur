# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer
pkgver=1.1.0
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux"
arch=('x86_64')
url="https://github.com/yuzujr/coomer"
license=('MIT')

depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxrandr'
  'wayland'
  'libxkbcommon'
  'dbus'
)
optdepends=(
  'xdg-desktop-portal: portal screenshot backend'
)
makedepends=(
  'xmake'
  'gcc'
  'pkgconf'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e40bd5e00a87edfded2f198a8f235ee9a4d5346f92e9d616b3194d06b483772')

_xmake_env() {
  export XMAKE_GLOBALDIR="$srcdir/.xmake-global"
  export XMAKE_PKG_CACHEDIR="$srcdir/.xmake-cache"
  export XMAKE_PKG_INSTALLDIR="$srcdir/.xmake-packages"
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  _xmake_env

  xmake f -m release -y --x11=y --wayland=y --portal=y

  xmake require -y stb
  xmake require -y --extra='{configs={api="gl=3.3",profile="core"}}' glad
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  _xmake_env
  xmake -y
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  local binpath="build/linux/x86_64/release/coomer"

  install -Dm755 "$binpath" "$pkgdir/usr/bin/coomer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
