# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
pkgver=0.7.0.r0.ge16e8d5e
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64 i686)
url="https://github.com/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(wxsqlite3 wxwidgets-gtk3 taglib gst-plugins-base gst-plugins-good jsoncpp

         # namcap implicit depends
         wxwidgets-common gstreamer curl glibc gcc-libs gst-plugins-base-libs dbus glib2 icu

         libicuuc.so libicui18n.so)
makedepends=(cmake git)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(guayadeque)
conflicts=(guayadeque)
source=("git+https://github.com/thothix/guayadeque.git")
sha512sums=('SKIP')

pkgver() {
  cd "guayadeque"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # buildtype None introduce problems

  local _flags=(
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
    -D_GUREVISION_:STRING="${pkgrel}"
  )

  cmake -B build -S "guayadeque" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
