# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ezpadova-git
pkgname=('python-ezpadova-git')
pkgver=r66.405046d
pkgrel=1
pkgdesc="A python package that allows you to download PADOVA isochrones directly from their website"
arch=('any')
url="https://github.com/mfouesneau/ezpadova"
license=('MIT')
makedepends=('git' 'python-setuptools')
checkdepends=('python-nose'
              'python-astropy')
source=("git+https://github.com/mfouesneau/ezpadova.git")
md5sums=('SKIP')
_gitname=ezpadova

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
    depends=('python')
    cd ${srcdir}/${_gitname}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
