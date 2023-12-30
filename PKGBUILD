# Maintainer: Sean Anderson <seanga2@gmail.com>
_vcsname=alterpcb-tlinesim
pkgname=$_vcsname-git
pkgver=r56.3061766
pkgrel=1
pkgdesc="transmission line simulation tool"
arch=(x86_64)
url="https://www.maartenbaert.be/alterpcb/tlinesim/"
license=(GPL3)
depends=(
	qt5-base
)
makedepends=(
	git
	eigen
	suitesparse
)
checkdepends=()
optdepends=()
provides=(alterpcb-tlinesim)
conflicts=(alterpcb-tlinesim)
source=(
	"git+https://github.com/MaartenBaert/${_vcsname}.git"
	0001-Include-Eigen-headers-with-pkg-config.patch
	0002-Support-installation.patch
)
sha256sums=('SKIP'
            '98f633c6e0339f64e8701253c7cf840053a10fda48634660943078e4fc055f2c'
            'd038eaf0ca90322e844a6e4ff989eb62f0ed9b5c4651169ff7a3d68de73ee4d4')

pkgver() {
	cd $_vcsname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_vcsname
	patch -p1 -i "$srcdir/0001-Include-Eigen-headers-with-pkg-config.patch"
	patch -p1 -i "$srcdir/0002-Support-installation.patch"
}

build() {
	gendesk -f -n --pkgname $_vcsname --pkgdesc "$pkgdesc" \
		--name "AlterPCB Transmission Line Simulator"  \
		--categories "Development;Electronics"

	cd $_vcsname/src
	qmake PREFIX="/usr"
	make
}

package() {
	install -Dt "$pkgdir/usr/share/applications/" -m644 "$_vcsname.desktop"

	cd $_vcsname/src
	make INSTALL_ROOT="$pkgdir" install
}
