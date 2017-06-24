# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Andy Kluger <andykluger@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
pkgver=5.6.0
pkgrel=1
pkgdesc="minimized build of Digikam for non-KDE users, without Plasma/KDE integration"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('liblqr' 'libkipi' 'libksane' 'lensfun' 'opencv' 'knotifyconfig'
         'marble-common' 'threadweaver' 'kcalcore' 'exiv2')
optdepends=('kipi-plugins: export to various online services'
            'hugin: panorama tool')
makedepends=('extra-cmake-modules' 'boost' 'doxygen' 'eigen' 'kdoctools' 'kdesignerplugin')
conflicts=('digikam' 'digikam-git')
provides=('digikam')
source=("http://download.kde.org/stable/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('65bdd3f15668e314b852d523a0bf95da32450f31fcfda60da62e57d4622a663c')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # sv docs fail to build
  sed -e '/sv/d' -i doc-translated/CMakeLists.txt
}

build() {
  cd "${_pkgname}-${pkgver}"

  cmake "${srcdir}/${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DDIGIKAMSC_COMPILE_KIPIPLUGINS=OFF \
    -DDIGIKAMSC_COMPILE_PO=ON \
    -DENABLE_KFILEMETADATASUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_OPENCV3=ON \
    -Wno-dev
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{kipiplugin*,libkvkontakte}.mo
}
