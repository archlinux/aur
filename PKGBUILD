# Maintainer: Jake Steinman <j@metarealtyinc.ca>
pkgname=kshot-git
pkgver=0.4.0
pkgrel=1
pkgdesc="Screenshot tool for KDE Plasma Wayland that skips the XDG portal"
arch=('x86_64')
url="https://github.com/jibsta210/kshot"
license=('MIT')
# Qt6 exports protected symbols (QObject's typeinfo) that LTO cannot emit copy
# relocations against: "copy relocation against non-copyable protected symbol
# _ZTI7QObject@@Qt_6". makepkg enables -flto=auto by default, so this must be
# off or the package fails to build on a stock Arch system.
options=('!lto')
depends=('qt6-base' 'wl-clipboard')
makedepends=('git' 'gcc')
provides=('kshot')
conflicts=('kshot')
source=("git+https://github.com/jibsta210/kshot.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kshot"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kshot"
  make
}

package() {
  cd "$srcdir/kshot"
  # PREFIX must match the Exec= line in kshot.desktop: KWin authorizes
  # ScreenShot2 by matching /proc/PID/exe against an installed desktop file.
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
