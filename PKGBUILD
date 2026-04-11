# Maintainer: see upstream https://github.com/andycmaj/tilt-tui

pkgname=tilt-tui-git
pkgver=r110.6f9578a
pkgrel=1
pkgdesc="Terminal UI for Tilt (OpenTUI / Solid)"
arch=('x86_64' 'aarch64')
url="https://github.com/andycmaj/tilt-tui"
license=('MIT')
depends=('glibc')
makedepends=('bun')
optdepends=('tilt-bin: Tilt CLI (expected on PATH for full functionality)')
provides=('tilt-tui')
conflicts=('tilt-tui')
options=('!strip' '!debug')
_srcname=tilt-tui
source=("$_srcname::git+https://github.com/andycmaj/tilt-tui.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_srcname"
  bun install --frozen-lockfile
  bun run build:binary:single
}

package() {
  cd "$srcdir/$_srcname"
  case "$CARCH" in
    x86_64) _suffix=x64 ;;
    aarch64) _suffix=arm64 ;;
    *)
      echo "unsupported architecture: $CARCH"
      return 1
      ;;
  esac
  install -Dm755 "dist/tilt-tui-linux-${_suffix}/bin/tilt-tui" "$pkgdir/usr/bin/tilt-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
