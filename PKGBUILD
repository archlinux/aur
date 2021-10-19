# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-git
pkgver=1.0.0.r0.g9d18f40c
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt6-base
         sqlite3 udisks2 dbus alsa-lib libcdio fftw
         libpulse libimobiledevice libplist libusbmuxd libgpod libmtp)
makedepends=(git cmake boost qt6-tools gtest gmock)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  install -d strawberry-build
}

build() {
  cd "${pkgname%-git}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF

  make
}

package() {
  cd "${pkgname%-git}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
