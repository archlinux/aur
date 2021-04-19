# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rare-git
pkgver=1.2.1.r2.gb86f356
pkgrel=1
pkgdesc="GUI for legendary. An Epic Games Launcher open source alternative."
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=(
	"legendary"
	"python-pillow"
	"python-psutil"
	"python-pypresence"
	"python-qtawesome"
	"python-requests"
	"python-setuptools"
	"python-wheel"
)
makedepends=("git" "python-setuptools" "gendesk")
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
	cd "$srcdir/$pkgname"

	gendesk -n -f \
		--pkgname "${pkgname%-git}" \
		--pkgdesc "$pkgdesc" \
		--categories "Application;Game;Launcher" \
		--custom "Keywords=epic;games;launcher;legendary;"
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	local py_version=$(python --version | cut -d" " -f2 | cut -d. -f1-2)

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

	mkdir -p "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/lib/python$py_version/site-packages/${pkgname%-git}/styles/Logo.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
