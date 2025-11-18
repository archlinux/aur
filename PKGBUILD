# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=gambas-git
pkgver=3.18.0.r2690.g712d5a3
pkgrel=1
pkgdesc="A free development environment based on a Basic interpreter. (git version)"
arch=('x86_64')
url="http://gambas.sourceforge.net/"
license=('GPL2')
depends=('intltool' 'postgresql' 'libffi' 'bzip2' 'glib2' 'v4l-utils'
         'zlib' 'mesa' 'glew' 'xdg-utils' 'imlib2' 'gdk-pixbuf2' 'gtk3' 'webkit2gtk-4.1'
         'postgresql-libs' 'mariadb-libs' 'unixodbc' 'sqlite' 'mongo-c-driver' 'librsvg'
         'curl' 'poppler-glib' 'sdl_mixer' 'sdl_ttf' 'sdl2' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'libxtst'
         'pcre2' 'qt5-x11extras' 'qt5-svg' 'qt6-webengine' 'qt6-svg' 'qt6-wayland' 'libxcursor'
         'libsm' 'dbus' 'libxml2' 'libxslt' 'libgnome-keyring' 'gsl' 'gst-plugins-base-libs' 'alure' 'ncurses'
         'gmime3' 'libxcrypt' 'mongo-c-driver')
makedepends+=('git')
options=('!emptydirs' 'libtool')
source=("gambas-git::git+https://gitlab.com/gambas/gambas.git"
        "gambasgit"
        "gambas3-git.desktop"
        "gambas3-git.png")
sha512sums=('SKIP'
            'd00ef8f06e6d4713c39027db467904e29e39bcbf94fc587b975e38e667ac331a8477da6b0e54bc7654c4cf2c3fb8a80a3c4b1e7966eeaa3cdf23418ef0da7aef'
            '9b8bcd8a69ebfc152b9810ca0a3ae0c795b9d18ed2e481c745aabb4473ff63db2797e979095b3c545d55b6f8bb7e59a577404b23088b9310c96d2ff6d84c4ad9'
            '6884f874a3b562e658ccd75ec052a51b2ead3c6f1342e73a773a34704d757f1580a66c5db721a626b35f3ae26ed8627cd3d3600529f5a6130140a926abafebd8')
install=gambas-git.install

pkgver() {
  cd ${srcdir}/gambas-git

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/gambas-git

  ./reconf-all
}

build() {
  cd ${srcdir}/gambas-git

  export CFLAGS="$CFLAGS -ggdb -O0" CXXFLAGS="$CXXFLAGS -ggdb -O0"

  GAMBAS_CONFIG_FAILURE=1 ./configure --prefix=/usr/share/gambas-git \
    --disable-sqlite2 \
    --disable-qt4  \
    --disable-gtk \
    --disable-pdf \
    --disable-qt5webkit \
    --disable-qt5webview \
    --enable-debug --enable-optimization=no

  make bindir=${pkgdir}/usr/share/gambas-git/bin
}

package() {
  cd ${srcdir}/gambas-git

  make -j1 XDG_UTILS='' DESTDIR=${pkgdir} install

  install -dm755 ${pkgdir}/usr/bin
  install -m755 ${srcdir}/gambasgit ${pkgdir}/usr/bin/

  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/gambas3-git.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/gambas3-git.png ${pkgdir}/usr/share/pixmaps/
}
