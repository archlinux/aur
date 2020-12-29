# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rare-git
pkgver=0.1.1.r10.gd6acb41
pkgrel=1
pkgdesc="Legendary frontend"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=(
	"legendary"
	"python-pillow"
	"python-pyqtwebengine"
	"python-requests"
	"python-wheel"
	"python-setuptools"
)
makedepends=("git" "python-setuptools")
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	sed 's/\(packages.*\)],/\1,"Rare.Tabs.GamesInstalled", "Rare.Tabs.GamesUninstalled"],/' \
		-i "$srcdir/$pkgname/setup.py"
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
