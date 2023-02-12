# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server-git
pkgver=v0.1.6.r5.g60c376a
pkgrel=1
pkgdesc="Python based cmake language server"
arch=('any')
url="https://github.com/regen100/cmake-language-server"
license=('MIT')
groups=()
depends=("python-pygls" "python-pyparsing" "cmake" "cmake-format")
makedepends=("python-build" "python-installer" "git" "python-pdm")
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	cd "$srcdir/$pkgname"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
