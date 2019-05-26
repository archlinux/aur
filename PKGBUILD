# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgbase=python-opcodes-git
pkgname=('python-opcodes-git' 'python2-opcodes-git')
_srcname=Opcodes
_srcname2=python2-opcodes
pkgver=r179.6e2b0cd
pkgrel=3
pkgdesc='Python module for instruction sets documentation in a format convenient for tools development (git version)'
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
source=('git+https://github.com/Maratyszcza/Opcodes.git')
sha256sums=('SKIP')

prepare() {
    cp -a "$_srcname" "${_srcname}-py2"
}

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    printf '%s\n' '  -> Building for Python...'
    cd "${_srcname}"
    python setup.py build
    python setup.py build_sphinx --all-files --source-dir="${srcdir}/${_srcname}/sphinx"
    
    printf '%s\n' '  -> Building for Python2...'
    cd "${srcdir}/${_srcname}-py2"
    python2 setup.py build
    python2 setup.py build_sphinx --all-files --source-dir="${srcdir}/${_srcname}-py2/sphinx"
}

check() {
    cd "$_srcname"
    python setup.py test
    
    cd "${srcdir}/${_srcname}-py2"
    python2 setup.py test
}

package_python-opcodes-git() {
    depends=('python' 'python-setuptools')
    
    cd "$_srcname"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    # doc
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname%-git}"
    cp -a "${srcdir}/${_srcname}/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${pkgname%-git}"
    
    # license
    install -D -m644 license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-opcodes-git() {
    pkgdesc='Python2 module for instruction sets documentation in a format convenient for tools development (git version)'
    depends=('python2' 'python2-setuptools')
    
    cd "${_srcname}-py2"
    python2 setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    # doc
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname%-git}"
    cp -a "${srcdir}/${_srcname}-py2/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${pkgname%-git}"
    
    # license
    install -D -m644 license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
