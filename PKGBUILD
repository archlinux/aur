# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=python-digiham-git
pkgver=0.6.2.r8.g65fe48d
pkgrel=4
pkgdesc="Python bindings for the digiham library."
arch=('x86_64' 'aarch64')
url="https://github.com/jketterl/pydigiham"
license=('GPL-3.0-only')
depends=('digiham' 'python' 'gcc-libs' 'python-csdr-luarvique')
makedepends=('git' 'python-setuptools')
conflicts=('python-digiham')
provides=('python-digiham')
source=("$pkgname"::"git+https://github.com/jketterl/pydigiham.git#branch=develop"
        "fix-designated-init.patch")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "$srcdir/$pkgname"
	# GCC15 defaults to gnu++23: mixing PyModuleDef_HEAD_INIT with designated
	# initializers is an error; use positional style instead.
	patch -p1 < "$srcdir/fix-designated-init.patch"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
