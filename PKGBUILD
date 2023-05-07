# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=python-astropy-sphinx-theme-git
_gitname=astropy-sphinx-theme
pkgver=1.1.r6.gd9eadd5
pkgrel=1
pkgdesc="The sphinx theme for Astropy and affiliated packages."
arch=('any')
url="https://github.com/astropy/astropy-sphinx-theme"
license=('BSD')
makedepends=('python-setuptools-scm'
             'git'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-sphinx')
source=("git+https://github.com/astropy/astropy-sphinx-theme")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_gitname}"

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_gitname}

    pytest || warning "Tests failed" # -vv --color=yes # -vv --color=yes
}

package() {
    cd "${srcdir}/${_gitname}"
    depends=('python-sphinx>=1.6')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
