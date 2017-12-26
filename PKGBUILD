# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Andy Kluger <andykluger@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
pkgver=5.7.0
pkgrel=3
pkgdesc="minimized build of Digikam for non-KDE users, without Plasma/KDE integration"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=(liblqr libkipi libksane lensfun opencv knotifyconfig marble-common
	threadweaver kcalcore exiv2)
optdepends=('kipi-plugins: export to various online services'
            'hugin: panorama tool')
makedepends=(extra-cmake-modules boost doxygen eigen kdoctools)
conflicts=('digikam' 'digikam-git')
provides=('digikam')
source=("http://download.kde.org/stable/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        digikam-kcalcore-17.12.patch
        digikam-qt-5.9.3.patch::"https://cgit.kde.org/digikam.git/patch/?id=855ba5b7"
	digikam-opencv-3.4.patch)
sha256sums=('3605ffb5b6e8fbd6b725e5075f74f505d7edee7531789c2882d11df2d20150f5'
            '61648bdeb88dcb94d2896b9d9211c6a6b50a39a143701e04465aa040a60053c0'
            '03822e596321028d0971ec82351337dad76abeda93c9cef3b1d2a31807e02661'
	    'b822cf879216a479134e48e3cfb597ef5b741698454e0993846ab660896caba7')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # sv docs fail to build
  sed -e '/sv/d' -i doc-translated/CMakeLists.txt
# fix conflicts with libkvkontakte
  rm po/*/libkvkontakte.po
# fix build with kcalcore 17.12
  cd core
  patch -p1 -i "$srcdir"/digikam-kcalcore-17.12.patch
# fix thumbnails with Qt 5.9.3
  patch -p1 -i "$srcdir"/digikam-qt-5.9.3.patch
# fix build with opencv 3.4
  patch -p1 -i "$srcdir"/digikam-opencv-3.4.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  cmake "${srcdir}/${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DDIGIKAMSC_COMPILE_KIPIPLUGINS=OFF \
    -DDIGIKAMSC_COMPILE_PO=ON \
    -DENABLE_KFILEMETADATASUPPORT=OFF \
    -DENABLE_MEDIAPLAYER=OFF \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_OPENCV3=ON
  make
}

package() {
  cd "${_pkgname}-${pkgver}/core"
  make DESTDIR="$pkgdir" install
  cd "${srcdir}/${_pkgname}-${pkgver}/doc"
  make DESTDIR="$pkgdir" install
  cd "${srcdir}/${_pkgname}-${pkgver}/po"
  make DESTDIR="$pkgdir" install

  # Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/kipiplugin*.mo
}
