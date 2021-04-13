# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-sdf-timing
pkgname="$_pkgname-git"
pkgver=r118.5b9dc79
pkgrel=1
pkgdesc="Python library for working Standard Delay Format (SDF) Timing Annotation files"
arch=(any)
url="https://github.com/SymbiFlow/python-sdf-timing"
license=('ISC')
depends=('python' 'python-ply')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=(
	"git+$url.git"
	"0001-setup.py-don-t-use-dependencies-in-requirements.txt.patch"
)
sha256sums=('SKIP'
            'e26af72e6dbe463dd435aa04513533410d6b67433d7be68a751cef6e21eefd04')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-setup.py-don-t-use-dependencies-in-requirements.txt.patch"
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
