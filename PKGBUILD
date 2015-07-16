# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qt5-examples
_srcpkg=qt5
pkgdesc='Examples and demos from qt5 documentation'
pkgver=5.5.0
_qtver=5.5
pkgrel=1
arch=('any')
url='http://qt-project.org/'
license=('LGPL')
makedepends=()
depends=("qt5-base" "qt5-tools" "qt5-doc=${pkgver}")

_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt.io/official_releases/qt/${_qtver}/${pkgver}/single/${_pkgfqn}.tar.xz")
sha1sums=('4409ef12d1017a9b5e6733ea27596a6ca637a88c')

package() {
    base=${pkgdir}/usr/share/doc/qt/examples

    # The various example dirs have conflicting .pro files, but
    # QtCreator requires them to be in the same top-level directory.
    # Matching the Qt5 installer, only the qtbase project is kept.
    mkdir -p ${base}
    mv ${srcdir}/${_pkgfqn}/qtbase/examples/examples.pro ${base}

    fdirs=$(find "${srcdir}/${_pkgfqn}" -maxdepth 2 -type d -name examples)
    for dir in $fdirs
    do
        mod=$(basename ${dir%/examples})

        if [ -e "${dir}/README" ]
        then
            mv ${dir}/README ${dir}/README.${mod}
        fi

        # Don't overwrite existing examples.pro file
        mv -n ${dir}/* ${base}/
    done

    # Special case for QtQuick, which has two modules that install
    # examples to the 'quick' directory :/
    if [ -d "${srcdir}/${_pkgfqn}/qtquick1/examples/quick" ]
    then
        mv -n ${srcdir}/${_pkgfqn}/qtquick1/examples/quick/* ${base}/quick/
    fi

    if [ -d "${srcdir}/${_pkgfqn}/qtquickcontrols/examples/quick" ]
    then
        mv -n ${srcdir}/${_pkgfqn}/qtquickcontrols/examples/quick/* ${base}/quick/
    fi
}
