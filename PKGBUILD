# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=f4pga
pkgname="$_pkgname-git"
pkgver=r781.5c805fa
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
	"0001-Use-actual-paths-instead-of-requiring-users-to-pass-.patch"
)
sha256sums=('SKIP'
            '977906a106fb3a0cb908317d025df979fd71c04bc0b5929e779dd6c7ad568ebd')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Use-actual-paths-instead-of-requiring-users-to-pass-.patch"
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
