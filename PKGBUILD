# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=slimit-git
_srcname=slimit
pkgver=0.8.1.r7.g97d5645
pkgrel=1
pkgdesc="A JavaScript minifier written in Python"
arch=('i686' 'x86_64')
url="https://github.com/rspivak/slimit/"
license=('MIT')
depends=('python' 'python-ply')
makedepends=('python-setuptools' 'python-sphinx')
provides=('slimit')
conflicts=('slimit')
source=("$pkgname"::"git+https://github.com/rspivak/slimit.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
    
    cd docs
    make html
    make man
}

package() {
    cd "$pkgname"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{_sources,_static}
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # html docs
    cd docs/build/html
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${pkgname}"
    done
    cd _sources
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_sources"
    cd ../_static
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_static"
    
    # man page
    cd ../../man
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1"
    gzip -9 "${pkgdir}/usr/share/man/man1/${_srcname}.1"
}
