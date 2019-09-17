# Maintainer: Nicola Mori <nicolamori (at) aol (dot) com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok-scripting
pkgver=2.9.0.r376.457fbda25a
pkgrel=1
pkgdesc="The powerful music player for KDE (with Qt bindings for scripting)"
arch=("x86_64")
url="http://amarok.kde.org/"
license=("FDL" "GPL2" "LGPL2.1")
depends=("kcmutils" "kdnssd" "kirigami2" "knewstuff" "ktexteditor" "libgpod" "liblastfm-qt5" "libmtp" "libmygpo-qt5" "libofa" "mariadb" "phonon-qt5" "qt5-webengine" "taglib-extras" "threadweaver" "qtscriptbindings")
makedepends=("extra-cmake-modules" "gdk-pixbuf2" "git" "knotifyconfig" "libgpod" "libmtp" "libmygpo-qt5" "loudmouth")
optdepends=(
  "ifuse: support for Apple iPod Touch and iPhone"
  "loudmouth: backend needed by mp3tunes for syncing"
)
conflicts=("amarok" "amarok-git")
_commit="457fbda25a85a102bfda92aa7137e7ef5e4c8b00"
source=(
  "amarok-${pkgver}.tar.gz::https://github.com/KDE/amarok/archive/${_commit}.tar.gz"
  "amarok_mariadb.patch"
  "amarok_restoreqtbindingsload.patch"
)
sha256sums=(
  "9d5f46b344cc93277cc5159a499adbb2873e4ebe22cc4f8912dfb2be79b30e38"
  "029937d925993fa0b3cbe460f6d0c8f9fd624fc8dffff22acbbd3da600720dab"
  "25f3281e3a1bf0d254c5bf40d6416cc8af5755fe6d53ab85d23599c62efcee0f"
)

#git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g"
#source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.xz"{,.sig})
#validpgpkeys=("D81C0CB38EB725EF6691C385BB463350D6EF31EF") # Heiko Becker <heirecka@exherbo.org>

prepare() {
  cd "${srcdir}/amarok-${_commit}"
  patch -Np1 -i "${srcdir}/amarok_mariadb.patch"
  patch -Np0 -i "${srcdir}/amarok_restoreqtbindingsload.patch"

  mkdir -p "${srcdir}/amarok-${_commit}/build"
}

build() {
  cd "${srcdir}/amarok-${_commit}/build"
  cmake "${srcdir}/amarok-${_commit}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/amarok-${_commit}/build"
  make DESTDIR="${pkgdir}" install
}
