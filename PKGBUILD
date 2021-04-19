# Maintainer: Dummerle

pkgname=rare-dev
pkgver=1.3.0b
pkgrel=1
pkgdesc="Dev branch of github.com/Dummerle/Rare - The latest, but unstable features"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=(
	"python-pillow"
	"python-pyqt5"
	"python-qtawesome"
	"python-requests"
	"python-setuptools"
	"python-wheel"
	"python-psutil"
)
makedepends=("git" "python-setuptools" "gendesk")
checkdepends=()
optdepends=()
provides=("rare-git" "rare")
conflicts=("rare-git" "rare")
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
	cd "$srcdir/$pkgname"
	git checkout offline

	gendesk -n -f \
		--pkgname "${pkgname%-git}" \
		--pkgdesc "$pkgdesc" \
		--icon games \
		--categories "Application;Game;Launcher" \
		--custom "Keywords=epic;games;launcher;legendary;"
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
