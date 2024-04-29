# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=python-csdr-eti-git
pkgver=r12.676663b
pkgrel=2
pkgdesc="Python bindings for csdr-eti"
arch=('x86_64' 'aarch64')
url="https://github.com/jketterl/pycsdr-eti"
license=('GPL3')
depends=('python' 'csdr-eti')
makedepends=('git' 'python-setuptools')
conflicts=('python-csdr-eti' 'pycsdr-eti')
provides=('python-csdr-eti' 'pycsdr-eti')
source=("$pkgname"::"git+https://github.com/jketterl/pycsdr-eti.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build -b ../build -t ../build-tmp
}

package() {
	cd "$srcdir/$pkgname"
	# Sadly, setuptools still don't support separate build directory: https://github.com/pypa/setuptools/issues/1347
	python setup.py build -b ../build -t ../build-tmp install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
