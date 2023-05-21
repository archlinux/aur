# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-berliner-git
pkgver=2020.1221.0.r11.g9c78338
pkgrel=1
pkgdesc="Tools for stellar tracks & isochrones"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/berliner"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-scipy' 'python-regli' 'python-joblib')
optdepends=('python-astropy: For testing')
#checkdepends=('python-pytest' 'python-astropy')
checkdepends=('python-nose')
conflicts=('python-berliner')
provides=('python-berliner')
source=("git+https://github.com/hypergravity/berliner.git")
md5sums=('SKIP')
_gitname=berliner

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd ${srcdir}/${_gitname}

    python setup.py build
}

check() {
    cd ${srcdir}/${_gitname}

    nosetests || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_gitname}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
    install -D -m644 notebook/* -t "${pkgdir}/usr/share/doc/${pkgname%-git}/notebook"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
