# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=f4pga
pkgname="$_pkgname-git"
pkgver=r765.42fc3f8
pkgrel=2
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

prepare() {
	cd "$_pkgname"

	find f4pga/wrappers/sh -type f | xargs sed -i -e 's#\$F4PGA_ENV_SHARE#/usr/share/symbiflow#g'
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
