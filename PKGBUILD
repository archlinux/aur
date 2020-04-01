# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=slimit-git
pkgver=0.8.1.r12.g3533eba
pkgrel=4
pkgdesc='A JavaScript minifier written in Python (git version)'
arch=('any')
url='https://github.com/rspivak/slimit/'
license=('MIT')
depends=('python' 'python-ply' 'python-setuptools')
makedepends=('git' 'python-sphinx')
checkdepends=('python-nose')
provides=('slimit')
conflicts=('slimit')
source=('git+https://github.com/rspivak/slimit.git')
sha256sums=('SKIP')

pkgver() {
    git -C slimit describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd slimit
    python setup.py build
    make -C docs html man
}

check() {
    cd slimit
    nosetests
}

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    cd slimit
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    
    # html docs
    cp -a docs/build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
    
    # man page
    install -D -m644 docs/build/man/slimit.1 -t "${pkgdir}/usr/share/man/man1"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
