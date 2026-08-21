# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
pkgver=0.7.6.r0.gec6e9209
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64 i686)
url="https://codeberg.org/thothix/guayadeque"
license=(GPL-3.0-only)
depends=(
    curl
    dbus
    glib2
    glibc
    gst-plugins-base
    gst-plugins-base-libs
    gstreamer
    hicolor-icon-theme
    icu libicuuc.so
    jsoncpp
    libgcc
    libstdc++
    taglib
    wxsqlite3
    wxwidgets-common
    wxwidgets-gtk3
    )
makedepends=(
    cmake
    git
    )
optdepends=(
    'gst-libav: additional codecs'
    'gst-plugins-bad: additional codecs'
    'gst-plugins-good: additional codecs'
    'gst-plugins-ugly: additional codecs'
    )
provides=(guayadeque)
conflicts=(guayadeque)
source=("git+https://codeberg.org/thothix/guayadeque.git")
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
    -DENABLE_IPOD=OFF
  )

  cmake -B build -S "guayadeque" -Wno-author \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
