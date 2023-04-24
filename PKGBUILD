# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=uxplay
_gitname=UxPlay
pkgver=1.64
epoch=1
pkgrel=1
pkgdesc="AirPlay Unix mirroring server"
arch=('any')
url="https://github.com/FDH2/$_gitname"
license=('GPL3')
depends=('openssl' 'libplist' 'avahi' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('gstreamer-vaapi: GStreamer plugin required for certain GPUs')
makedepends=('cmake')
source=("$_gitname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "uxplay.desktop")
sha256sums=('4cae991a9549c50c9a05cd7023ec8d9701ad90ed616dd70eb1eea33b313390be'
            '6b43385942508d8c360e8360be52719cbf3899868f3560b245731d866fb245a3')

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
