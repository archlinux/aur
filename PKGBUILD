# Contributor: Todd Musall 
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Contributor: Lari Tikkanen
# Maintainer:  Tim Schumacher

pkgname=heimdall-git
_pkgname=Heimdall
pkgver=1.4.2.r7.ga2cfdaa
pkgrel=1
pkgdesc="Tool suite used to flash firmware (ROMs) onto Samsung Galaxy S devices"
arch=("i686" "x86_64")
url="https://glassechidna.com.au/heimdall/"
license=("MIT")
depends=("qt5-base")
makedepends=("cmake" "git")
optdepends=("android-udev: Udev rules to connect Android devices to your linux box")
conflicts=("heimdall")
provides=("heimdall")
source=(
	"$_pkgname::git+https://gitlab.com/BenjaminDobell/Heimdall.git"
	"heimdall.desktop"
)
sha256sums=(
	"SKIP"
	"439cea1a8976b9b589ffe4030a084243bcc5e937dcb9c571cdb94d3ff08b4fb4"
)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"

	cmake . -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/$_pkgname"

	# Install desktop file
	install -m644 -D "$srcdir/heimdall.desktop" "$pkgdir/usr/share/applications/heimdall.desktop"

	# Install license file
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install heimdall command line tool
	install -d "$pkgdir"/usr/bin
	install -Dm755 bin/* "$pkgdir"/usr/bin/
	install -Dm644 heimdall/60-heimdall.rules "$pkgdir"/usr/lib/udev/rules.d/60-heimdall.rules
}
