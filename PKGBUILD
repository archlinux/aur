# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=f4pga
pkgname="$_pkgname-git"
pkgver=r758.a4ff811
pkgrel=1
pkgdesc="F4PGA tools"
arch=(any)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('python' 'python-colorama')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "symbiflow-arch-defs-toolchain")
source=(
	"git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname/f4pga"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	pytest
}

package() {
	cd "$_pkgname/f4pga"

	python -m installer --destdir="$pkgdir" dist/*.whl

	cd "$srcdir/$_pkgname"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
