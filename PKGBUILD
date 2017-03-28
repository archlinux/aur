# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=slimit2
_srcname=slimit
pkgver=0.8.1
pkgrel=1
pkgdesc="A JavaScript minifier written in Python (uses python2)"
arch=('i686' 'x86_64')
url="https://github.com/rspivak/slimit/"
license=('MIT')
depends=('python2' 'python2-ply')
makedepends=('python2-setuptools' 'python2-sphinx')
conflicts=('slimit2-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/rspivak/slimit/archive/0.8.1.tar.gz")
sha256sums=('015fc1917c0eff834514fcedd4251275a3dacb10df1b49549277fe5e19de1ddf')

build() {
    cd "${_srcname}-${pkgver}"
    msg2 "Running 'setup.py'..."
    python2 setup.py build
    
    cd docs
    sed -i '/sphinx-build/s/$/2/' Makefile
    msg2 "Making target 'html'..." && make html
    msg2 "Making target 'man'..."  && make man
}

package() {
    cd "${_srcname}-${pkgver}"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{_sources,_static}
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "$pkgdir"/usr/bin/slimit{,2}
    
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
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
    gzip -9 "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
}
