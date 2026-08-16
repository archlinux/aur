# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=esphamclock-git
_pkgname=esphamclock
pkgver=4.29.r8.gae6f8e4
pkgrel=1
pkgdesc="Space weather, VOACAP propagation, satellite tracker and telemetry dashboard for radio amateurs (OHB Edition)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://hamclock.hamradio.my"
license=('custom')
depends=('libx11' 'libgpiod' 'gcc-libs' 'glibc')
makedepends=('git' 'gcc' 'make')
provides=('esphamclock' 'hamclock')
conflicts=('esphamclock' 'hamclock')
source=("git+https://github.com/9M2PJU/9M2PJU-ESPHamClock-Installer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/9M2PJU-ESPHamClock-Installer"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "4.29.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/9M2PJU-ESPHamClock-Installer"
  mkdir -p build-bin
  for target in hamclock-800x480 hamclock-1600x960 hamclock-2400x1440 hamclock-3200x1920 hamclock-web-800x480 hamclock-web-1600x960; do
    make clean
    make "$target" -j$(nproc)
    cp "$target" build-bin/
  done
}

package() {
  cd "$srcdir/9M2PJU-ESPHamClock-Installer"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/hamclock"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -d "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  install -m755 packaging/hamclock-launcher.sh "$pkgdir/usr/bin/hamclock"
  ln -sf /usr/bin/hamclock "$pkgdir/usr/bin/hamclock-800x480"
  ln -sf /usr/bin/hamclock "$pkgdir/usr/bin/hamclock-1600x960"

  for bin in build-bin/*; do
    install -m755 "$bin" "$pkgdir/usr/lib/hamclock/"
  done

  install -m644 deploy/hamclock.desktop "$pkgdir/usr/share/applications/"
  install -m644 deploy/hamclock.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -m644 deploy/hamclock.1 "$pkgdir/usr/share/man/man1/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
