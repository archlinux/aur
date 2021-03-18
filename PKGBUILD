# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=outrun
pkgname="$_pkgname-git"
pkgver=r3.1e86c42
pkgrel=1
pkgdesc="Execute a local command using the processing power of another Linux machine"
arch=(any)
url="https://github.com/Overv/outrun"
license=('Apache')
depends=('python' 'python-msgpack' 'python-pyzmq' 'python-lz4' 'python-fasteners' 'python-semver' 'fuse3' 'openssh')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'vagrant' 'python-vagrant')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=(
	"git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	#git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
