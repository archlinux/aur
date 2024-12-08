# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-git
pkgver=1.2.3.r1.g8604a39d9
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base gst-plugins-good qt6-base
         sqlite udisks2 dbus alsa-lib libcdio fftw libebur128 kdsingleapplication
         libpulse libimobiledevice libplist libusbmuxd libgpod libmtp

         # namcap implicit depends
         glibc gcc-libs glib2 icu hicolor-icon-theme libx11 gstreamer
         taglib gst-plugins-base-libs gdk-pixbuf2

         libicuuc.so libicui18n.so libgpod.so)
makedepends=(git cmake boost qt6-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd strawberry
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd strawberry
  install -d strawberry-build
}

build() {
  cd strawberry/strawberry-build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
  make
}

package() {
  cd strawberry/strawberry-build
  make DESTDIR="${pkgdir}" install
}
