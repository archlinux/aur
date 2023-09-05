# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=dektec-drivers-dkms
pkgver=2023.08.0
pkgrel=1
pkgdesc='Linux DKMS for Dektec device drivers'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/"
license=('BSD')
depends=('dkms')
optdepends=(
	'linux-headers: Build the module for Arch kernel'
	'linux-lts-headers: Build the module for LTS Arch kernel'
)
provides=('dektec-drivers-dkms')
conflicts=('dektec-drivers-dkms' 'dektec-dkms')
source=(
	"https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v$pkgver.tar.gz"
	'dkms.conf'
	'Makefile'
)
sha256sums=('144da46bb3c2be721682820ca33d4fc08d6545f31b3adbb906a90b5eb36e3fb3'
            '3ab98092aad33786c1766b8d0b29636c5bb1ccdb116cbfe32608c972b99d4d47'
            '3ee9f2b8836d3e68451c3c29f343295f6ceaca52e84e18d040205b245473d314')

prepare() {
    cd "$srcdir"

    # Fix version syntax
    sed -e "s|@PKGVER@|$pkgver|" -i dkms.conf -i Makefile

    # Insert patches below this line
}


package() {
	cd "$srcdir"
	mkdir -p "$pkgdir"/usr/src/$pkgname-$pkgver
	cp -RL "$srcdir"/LinuxSDK/* "$pkgdir"/usr/src/$pkgname-$pkgver
	install -Dm644 dkms.conf "$pkgdir"/usr/src/$pkgname-$pkgver
	install -Dm644 Makefile "$pkgdir"/usr/src/$pkgname-$pkgver

	# Install license
	install -Dm644 LinuxSDK/License "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	# Install udev rules
	install -Dm644 LinuxSDK/Drivers/Dta/Source/Linux/51-dta.rules -t "$pkgdir"/etc/udev/rules.d
	install -Dm644 LinuxSDK/Drivers/Dtu/Source/Linux/51-dtu.rules -t "$pkgdir"/etc/udev/rules.d
	install -Dm644 LinuxSDK/Drivers/DtPcie/Source/Linux/51-dtpcie.rules -t "$pkgdir"/etc/udev/rules.d
}
