# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgbase=slimit-git
pkgname=('slimit-git' 'slimit2-git')
_srcname=slimit
pkgver=0.8.1.r12.g3533eba
pkgrel=3
pkgdesc='A JavaScript minifier written in Python'
arch=('any')
url='https://github.com/rspivak/slimit/'
license=('MIT')
makedepends=('git' 'python' 'python-setuptools' 'python-sphinx'
                   'python2' 'python2-setuptools' 'python2-sphinx')
source=('git+https://github.com/rspivak/slimit.git')
sha256sums=('SKIP')

prepare() {
    cp -a "$_srcname" "${_srcname}-py2"
    
    cd "${_srcname}-py2/docs"
    sed -i '/sphinx-build/s/$/2/' Makefile
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    printf '%s\n' '  -> Building for Python...'
    cd "$_srcname"
    python setup.py build
    cd docs
    make html man
    
    printf '%s\n' '  -> Building for Python2...'
    cd "${srcdir}/${_srcname}-py2"
    python2 setup.py build
    cd docs
    make html man
}

check() {
    cd "$_srcname"
    python setup.py test
    
    cd "${srcdir}/${_srcname}-py2"
    python2 setup.py test
}

package_slimit-git() {
    depends=('python' 'python-ply' 'python-setuptools')
    provides=('slimit')
    conflicts=('slimit')
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    cd "$_srcname"
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    
    # html docs
    cd docs/build/html
    cp -a * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # man page
    cd ../man
    install -D -m644 "${_srcname}.1" -t "${pkgdir}/usr/share/man/man1"
    
    # license
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_slimit2-git() {
    pkgdesc+=' (python2 version)'
    depends=('python2' 'python2-ply' 'python2-setuptools')
    provides=('slimit2')
    conflicts=('slimit2')
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python2 install
    cd "${_srcname}-py2"
    python2 setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    mv "$pkgdir"/usr/bin/slimit{,2}
    
    # html docs
    cd docs/build/html
    cp -a * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # man page
    cd ../man
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
    
    # license
    cd "${srcdir}/${_srcname}-py2"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
