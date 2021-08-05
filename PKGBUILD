# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=uxplay-git
_gitname=UxPlay
pkgver=r71.5a9d101
pkgrel=1
pkgdesc="AirPlay Unix mirroring server"
arch=('any')
url="https://github.com/FDH2/$_gitname"
license=('GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-libav' 'gstreamer-vaapi' 'avahi')
makedepends=('cmake' 'git')
conflicts=('uxplay')
provides=('uxplay')
source=("git+$url.git" "uxplay.desktop")
sha256sums=('SKIP' '6b43385942508d8c360e8360be52719cbf3899868f3560b245731d866fb245a3')

pkgver() {
  cd "$srcdir/$_gitname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake .. -DZOOMFIX=1
  cmake --build . --config Release
}

package() {
  # install binary
  install -Dm 755 "$srcdir/$_gitname/build/uxplay" "$pkgdir/usr/bin/uxplay"
  # install desktop file
  install -Dm 644 "$srcdir/uxplay.desktop" "$pkgdir/usr/share/applications/uxplay.desktop"

  printf "%b" "\e[1;33m==> WARNING: \e[0mIn order for UxPlay to work, the avahi systemd service has to be running. Enable it with: systemctl enable --now avahi-daemon\n"
}
