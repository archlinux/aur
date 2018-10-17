# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgbase=python-opcodes-git
pkgname=('python-opcodes-git' 'python2-opcodes-git')
_srcname=python-opcodes
_srcname2=python2-opcodes
pkgver=r179.6e2b0cd
pkgrel=2
pkgdesc='Python3 module for instruction sets documentation in a format convenient for tools development (git version)'
arch=('any')
url='https://github.com/Maratyszcza/Opcodes/'
license=('BSD')
makedepends=(
    # binary repositories:
        'git' 'python' 'python-setuptools' 'python2' 'python2-setuptools'
        'python-sphinx' 'python2-sphinx'
    # AUR:
        'python-sphinx-bootstrap-theme' 'python2-sphinx-bootstrap-theme'
)
source=("$pkgname"::'git+https://github.com/Maratyszcza/Opcodes.git')
sha256sums=('SKIP')

prepare() {
    cp -a "$pkgbase" "${pkgbase}-py2"
}

pkgver() {
    cd "$pkgbase"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    printf '%s\n' '  -> Building for Python3...'
    cd "${pkgbase}"
    python setup.py build
    # broken in python 3.7
    #python setup.py build_sphinx --all-files --source-dir="${srcdir}/${pkgbase}/sphinx"
    
    printf '%s\n' '  -> Building for Python2...'
    cd "${srcdir}/${pkgbase}-py2"
    python2 setup.py build
    python2 setup.py build_sphinx --all-files --source-dir="${srcdir}/${pkgbase}-py2/sphinx"
}

package_python-opcodes-git() {
    depends=('python' 'python-setuptools')
    
    cd "$pkgbase"
    python setup.py install --root="$pkgdir" --optimize=1
    
    # doc
    #mkdir -p "${pkgdir}/usr/share/doc/${_srcname}"
    #cp -a "${srcdir}/${pkgbase}/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${_srcname}"
    
    # license
    install -D -m644 license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-opcodes-git() {
    pkgdesc='Python2 module for instruction sets documentation in a format convenient for tools development (git version)'
    depends=('python2' 'python2-setuptools')
    
    cd "${pkgbase}-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1
    
    # doc
    mkdir -p "${pkgdir}/usr/share/doc/${_srcname2}"
    cp -a "${srcdir}/${pkgbase}-py2/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${_srcname2}"
    
    # license
    install -D -m644 license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
