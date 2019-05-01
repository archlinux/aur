# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=qwtplot3d
pkgver=0.2.7
pkgrel=10
pkgdesc="Qt/OpenGL-based C++ programming library containing 3d-widgets"
arch=("x86_64")
license=('custom:zlib')
url="http://qwtplot3d.sourceforge.net/"
depends=('qt4')
makedepends=('mesa' 'glu')
source=("https://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-$pkgver.tgz"
        qwtplot3d-gcc44.patch qwtplot3d-qt-4.8.0.patch)
sha1sums=('4463fafb8420a91825e165da7a296aaabd70abea'
          '52fa169b651a98550f8a8391ddf52e0eaeb2c215'
          '8dcafdc9753b0f2eeea2f1e96efa6e8d3d956005')

prepare() {
    cd ${pkgname}
    patch -p1 -i "${srcdir}"/qwtplot3d-gcc44.patch
    patch -p1 -i "${srcdir}"/qwtplot3d-qt-4.8.0.patch
}

build() {
    cd ${pkgname}
    # build qwt:
    qmake-qt4 qwtplot3d.pro
    make
}

package() {
    cd ${pkgname}

    # install qwtplot3d: (by hand, because the Makefile do not provide a "install:")
    install -d "${pkgdir}"/usr/{include/qwtplot3d,lib}

    for n in include/* ; do
     cp -d $n "${pkgdir}"/usr/include/qwtplot3d
    done

    for n in lib/libqwtplot3d.so* ; do
     cp -d $n "${pkgdir}"/usr/lib
    done

    # install custom license
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

