# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=python-opcodes-git
pkgname=('python-opcodes-git' 'python-opcodes-doc-git')
pkgver=r179.6e2b0cd
pkgrel=4
pkgdesc='Python module for instruction sets documentation in a format convenient for tools development (git version)'
arch=('any')
url='https://github.com/Maratyszcza/Opcodes/'
license=('BSD')
makedepends=('git' 'python' 'python-setuptools' 'python-sphinx' 'python-sphinx-bootstrap-theme')
checkdepends=('python-pytest')
source=('git+https://github.com/Maratyszcza/Opcodes.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C Opcodes rev-list --count HEAD)" "$(git -C Opcodes rev-parse --short HEAD)"
}

build() {
    cd Opcodes
    python setup.py build
    python setup.py build_sphinx --all-files --source-dir="${srcdir}/Opcodes/sphinx"
}

check() {
    cd Opcodes
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package_python-opcodes-git() {
    depends=('python' 'python-setuptools')
    provides=('python-opcodes')
    conflicts=('python-opcodes')

    cd Opcodes
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-opcodes-doc-git() {
    pkgdesc="$(sed 's/\((git version)\)/(documentation) \1/' <<< "$pkgdesc")"
    provides=('python-opcodes-doc')
    conflicts=('python-opcodes-doc')
    
    mkdir -p "${pkgdir}/usr/share/doc/python-opcodes"
    cp -dr --no-preserve='ownership' Opcodes/build/sphinx/html/* "${pkgdir}/usr/share/doc/python-opcodes"
    install -D -m644 Opcodes/license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
