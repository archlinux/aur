# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-git
pkgver=0.8.4.r84.ge78bb1b2
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib libcdio fftw
         libpulse libimobiledevice libplist libusbmuxd libgpod libmtp)
makedepends=(git cmake boost qt5-tools gtest)
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
    -DUSE_SYSTEM_TAGLIB=OFF \
    -DENABLE_PHONON=OFF \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF \
    -DENABLE_XINE=OFF
  make
}

package() {
  cd "${pkgname%-git}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
