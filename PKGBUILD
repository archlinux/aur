# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: Pierre Gueth <pierre.gueth at gmail>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Tim Huetz <tim at huetz biz>

pkgname=libsvm
pkgver=3.22
_srcver="${pkgver/./}"
pkgrel=2
pkgdesc='A library for Support Vector Machines classification (includes binaries and bindings for python and java)'
arch=('i686' 'x86_64')
url='http://www.csie.ntu.edu.tw/~cjlin/libsvm/'
license=('BSD')
depends=('gcc-libs')
makedepends=('gtk2' 'qt4' 'python')
optdepends=('gtk2: for GTK2 interface with svm-toy-gtk'
            'qt4: for Qt4 interface with svm-toy-qt'
            'python: for python modules and tools'
            'java-environment: for java bindings')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cjlin1/libsvm/archive/v${_srcver}.tar.gz")
sha256sums=('a3469436f795bb3f8b1e65ea761e14e5599ec7ee941c001d771c07b7da318ac6')

build() {
    msg2 'Building library and CLI binaries...'
    cd "${pkgname}-${_srcver}"
    make lib
    make all
    
    msg2 'Building GTK2 interface...'
    cd svm-toy/gtk
    make
    
    msg2 'Building Qt4 interface...'
    cd ../qt
    make
}

package() {
    cd "${pkgname}-${_srcver}"
    
    local _pyver="$(python --version | sed 's/^Python[[:space:]]//' | grep -o '^[0-9]*\.[0-9]*')"
    
    local _sover="$(find . -maxdepth 1 -type f -name 'libsvm.so.*' | awk -F'.' '{ print $4 }')"
    
    # binaries
    install -D -m755 svm-predict -t "${pkgdir}/usr/bin"
    install -D -m755 svm-scale   -t "${pkgdir}/usr/bin"
    install -D -m755 svm-train   -t "${pkgdir}/usr/bin"
    install -D -m755 svm-toy/gtk/svm-toy "${pkgdir}/usr/bin/svm-toy-gtk"
    install -D -m755 svm-toy/qt/svm-toy  "${pkgdir}/usr/bin/svm-toy-qt"
    
    # library
    install -D -m755 "libsvm.so.${_sover}" -t "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -sf "libsvm.so.${_sover}" libsvm.so
    
    # include
    cd "${srcdir}/${pkgname}-${_srcver}"
    install -D -m644 svm.h -t "${pkgdir}/usr/include"
    
    # python modules
    cd "${srcdir}/${pkgname}-${_srcver}/python"
    install -D -m644 svm.py     -t "${pkgdir}/usr/lib/python${_pyver}"
    install -D -m644 svmutil.py -t "${pkgdir}/usr/lib/python${_pyver}"
    
    # python tools
    cd "${srcdir}/${pkgname}-${_srcver}/tools"
    install -D -m755 checkdata.py -t "${pkgdir}/usr/bin"
    install -D -m755 easy.py      -t "${pkgdir}/usr/bin"
    install -D -m755 grid.py      -t "${pkgdir}/usr/bin"
    install -D -m755 subset.py    -t "${pkgdir}/usr/bin"
    
    # java
    cd "${srcdir}/${pkgname}-${_srcver}/java"
    install -D -m644 libsvm.jar -t "${pkgdir}/usr/share/java"
    
    # license
    cd "${srcdir}/${pkgname}-${_srcver}"
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
