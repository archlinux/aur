# Maintainer: articpenguin <julia.schweinz at mailfence dot com>
# Contributor: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=ilua-git
_pkgname=ilua
pkgver=0.2.1.r135.05eb181
pkgrel=3
pkgdesc="Portable Lua kernel for Jupyter "
arch=(any)
url="https://github.com/guysv/ilua"
license=(GPL2)
depends=(
 python
 lua
 python-jupyter_core
 jupyter_console
 python-txzmq
 python-twisted
 python-termcolor
 python-pygments
)
makedepends=(
 python-setuptools
 python-setuptools-scm
 python-wheel
 git
)
optdepends=(
 'python-service-identity: for TLS client hostname verification'
)
provides=('ilua')
#conflicts=('')  # It installs the kernel in /usr/share/jupyter/kernels/lua, not sure if it would conflict with other Lua Jupyter kernels packaged in the future
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# TODO: get the pip version number which is somehow higher than the latest git tag
	printf "%s.r%s.%s" \
		"$(git describe --abbrev=0 --tags)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	python3 setup.py build
}

check() {
	cd "$_pkgname"

	python3 -m unittest
}

package() {
	cd "$_pkgname"

	python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
