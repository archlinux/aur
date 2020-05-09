# Maintainer: Mirko Scholz
# modeled after qwtplot3d
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=qwtplot3d-qt5
pkgver=0.2.7
pkgrel=3
pkgdesc="Qt/OpenGL-based C++ programming library containing 3d-widgets"
arch=("x86_64")
license=('custom:zlib')
url="http://qwtplot3d.sourceforge.net/"
depends=('qt5-base')
makedepends=('mesa' 'glu')
source=("https://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-$pkgver.tgz"
        qwtplot3d-gcc44.patch 
	qwtplot3d-qt-4.8.0.patch
	qwtplot3d-qt5.patch)
sha1sums=('4463fafb8420a91825e165da7a296aaabd70abea'
          '52fa169b651a98550f8a8391ddf52e0eaeb2c215'
          '8dcafdc9753b0f2eeea2f1e96efa6e8d3d956005'
          'f0048a7fb030165a2173a3bf6fdadbf73d571bf4')

prepare() {
    cd qwtplot3d
    patch -p1 -i "${srcdir}"/qwtplot3d-gcc44.patch
    patch -p1 -i "${srcdir}"/qwtplot3d-qt-4.8.0.patch
    patch -p1 -i "${srcdir}"/qwtplot3d-qt5.patch
}

build() {
    cd qwtplot3d
    # build qwt:
    qmake-qt5 qwtplot3d.pro "CONFIG+=staticlib"
    make
}

package() {
    cd qwtplot3d

    # install qwtplot3d: (by hand, because the Makefile do not provide a "install:")
    install -d "${pkgdir}"/usr/{include/qt/qwtplot3d-qt5,lib}

    for n in include/* ; do
     install -Dm644 $n "${pkgdir}"/usr/include/qt/qwtplot3d-qt5
    done

#   for n in lib/libqwtplot3d-qt5.so* ; do
#    cp -d $n "${pkgdir}"/usr/lib
#   done
    install -Dm644 lib/libqwtplot3d-qt5.a "${pkgdir}"/usr/lib

    # install custom license
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

