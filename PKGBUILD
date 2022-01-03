# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=uxplay
_gitname=UxPlay
pkgver=1.44f
pkgrel=1
pkgdesc="AirPlay Unix mirroring server"
arch=('any')
url="https://github.com/FDH2/$_gitname"
license=('GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-libav' 'gstreamer-vaapi' 'avahi' 'libplist')
makedepends=('cmake')
conflicts=('uxplay')
provides=('uxplay')
source=("$_gitname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "uxplay.desktop")
sha256sums=('bcd5181b44ed2f4cbfe8cde83b5a9ae2278ddc43824541a5d4baf7ff786fcc46' '6b43385942508d8c360e8360be52719cbf3899868f3560b245731d866fb245a3')

build() {
  cd "$srcdir/$_gitname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DZOOMFIX=1
  cmake --build . --config Release
}

package() {
  # install binary
  install -Dm 755 "$srcdir/$_gitname-$pkgver/build/uxplay" "$pkgdir/usr/bin/uxplay"
  # install desktop file
  install -Dm 644 "$srcdir/uxplay.desktop" "$pkgdir/usr/share/applications/uxplay.desktop"

  printf "%b" "\e[1;33m==> WARNING: \e[0mIn order for UxPlay to work, the avahi systemd service has to be running. Enable it with: systemctl enable --now avahi-daemon\n"
  # install manpage
  install -Dm 644 "$srcdir/$_gitname-$pkgver/uxplay.1" "$pkgdir/usr/share/man/man1/uxplay.1"
  # install doc
  install -d "$pkgdir/usr/share/doc/uxplay"
  install -Dm 644 "$srcdir/$_gitname-$pkgver"/README.* "$pkgdir/usr/share/doc/uxplay"
  # install license
  install -Dm 644 "$srcdir/$_gitname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/uxplay/LICENSE"
}
