# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rare-git
pkgver=0.1.r15.g4d47e98
pkgrel=1
pkgdesc="Legendary frontend"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=("legendary" "python-requests" "python-pillow" "python-pyqt5")
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
source=("$pkgname::git+$url.git" setup.py)
noextract=()
sha256sums=("SKIP" "SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	sed \
		-e 's#\$url'"#$url#" \
		-e 's#\$pkgdesc'"#$pkgdesc#" \
		-e 's#\$pkgver'"#${pkgver%.r*}#" \
		-e 's#\$pkgname'"#${pkgname%-git}#" \
		setup.py > "$srcdir/$pkgname/setup.py"
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
