# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ezpadova-git
pkgname=('python-ezpadova-git' 'python2-ezpadova-git')
pkgver=r61.5378a3e
pkgrel=1
pkgdesc="A python package that allows you to download PADOVA isochrones directly from their website"
arch=('i686' 'x86_64')
url="https://github.com/mfouesneau/ezpadova"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-astropy' 'python2-astropy')
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

prepare() {
    cd ${srcdir}/${_gitname}

    cp -a ${srcdir}/${_gitname}{,-py2}
}

build() {
    cd ${srcdir}/${_gitname}
    python setup.py build

    msg "Building Python2"
    cd ${srcdir}/${_gitname}-py2
    python2 setup.py build
}

check() {
    cd ${srcdir}/${_gitname}
    python setup.py test

    cd ${srcdir}/${_gitname}-py2
    python2 setup.py test
}

package_python-ezpadova-git() {
    depends=('python')
    cd ${srcdir}/${_gitname}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python2-ezpadova-git() {
    depends=('python2')
    cd ${srcdir}/${_gitname}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
