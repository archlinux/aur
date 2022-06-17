# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgbase=confu-git
pkgname=('confu-git' 'confu2-git')
pkgver=r44.4f3d0e7
pkgrel=1
pkgdesc='Cross-platform C/C++ configuration system (git version, uses python3)'
arch=('any')
url='https://github.com/Maratyszcza/confu/'
license=('MIT')
makedepends=(
    # official repositories
        'git'
        'python' 'python-setuptools' 'python-six' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-yaml'
        'python2' 'python2-setuptools' 'python2-six' 'python2-yaml'
    # AUR:
        'python-ninja-syntax' 'python2-ninja-syntax'
)
source=('git+https://github.com/Maratyszcza/confu.git')
sha256sums=('SKIP')

prepare() {
    cp -a confu confu-py2
}

pkgver() {
    printf 'r%s.%s' "$(git -C confu rev-list --count HEAD)" "$(git -C confu rev-parse --short HEAD)"
}

build() {
    printf '%s\n' '  -> Building for Python3...'
    cd confu
    python setup.py build
    python setup.py build_sphinx --all-files --source-dir="${srcdir}/confu/sphinx"
    
    printf '%s\n' '  -> Building for Python2...'
    cd "${srcdir}/confu-py2"
    python2 setup.py build
}

package_confu-git() {
    depends=(
        # binary repositories:
            'python' 'python-six' 'python-yaml'
        # AUR:
            'python-ninja-syntax'
    )
    
    cd confu
    python setup.py install --root="$pkgdir" --optimize=1
    
    # doc
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "${srcdir}/confu/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_confu2-git() {
    pkgdesc='Cross-platform C/C++ configuration system (git version, uses python2)'
    depends=(
        # binary repositories:
            'python2' 'python2-six' 'python2-yaml'
        # AUR:
            'python2-ninja-syntax'
    )
    
    cd confu-py2
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "${pkgdir}/usr/bin/confu" "${pkgdir}/usr/bin/confu2"
    
    # fix wrong python versions
    sed -i '1s/python$/python2/' "${pkgdir}/usr/lib/python2.7/site-packages/confu/recipes/"*.py
    
    # doc
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "${srcdir}/confu/build/sphinx/html/"* "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
