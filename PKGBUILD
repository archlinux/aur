# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=slimit2
_srcname=slimit
pkgver=0.8.1
pkgrel=4
pkgdesc='A JavaScript minifier written in Python (uses python2)'
arch=('any')
url='https://github.com/rspivak/slimit/'
license=('MIT')
depends=('python2' 'python2-ply' 'python2-setuptools')
makedepends=('python2-sphinx')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/rspivak/slimit/archive/0.8.1.tar.gz")
sha256sums=('015fc1917c0eff834514fcedd4251275a3dacb10df1b49549277fe5e19de1ddf')

prepare() {
    cd "${_srcname}-${pkgver}/docs"
    
    sed -i '/sphinx-build/s/$/2/' Makefile
}

build() {
    cd "${_srcname}-${pkgver}"
    python2 setup.py build
    cd docs
    make html man
}

check() {
    cd "${_srcname}-${pkgver}"
    python2 setup.py test
}

package() {
    cd "${_srcname}-${pkgver}"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "$pkgdir"/usr/bin/slimit{,2}
    
    # html docs
    cd docs/build/html
    cp -a * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # man page
    cd ../man
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
