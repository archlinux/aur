# Maintainer: Super Tecno Gym <banana@grrlz.net>
# Contributor: Sam Day <me@samcday.com>

pkgname="rmtfs"
pkgdesc="Qualcomm Remote Filesystem Service Implementation"
pkgver=1.1.1
pkgrel=2
arch=(aarch64 x86_64)
url="https://github.com/linux-msm/rmtfs"
license=("BSD-3-Clause")
depends=(qrtr libudev.so)
makedepends=()
_srcname="${pkgname}-${pkgver}"
source=(
	"${_srcname}.tar.gz::https://github.com/linux-msm/rmtfs/archive/refs/tags/v${pkgver}.tar.gz"
	"udev.rules"
	"0001-sharedmem-Fix-build-warning-on-32-bit-arm.patch"
	"0002-storage-Try-opening-the-slot-suffixed-partition.patch"
	"0003-storage-Add-modem_study-into-partition_table.patch"
	)

sha256sums=('190b50e97d2bb2cfa2ea20137a91aa5b113351f53f8c05fbb152ab97f31b57f7'
            '0c2f26d40d9d18e3089c6d836b64231c4f7e0c1ca41686fe7c9d1eb495dc6bbe'
	    'a86309dfe9272accab23f0e0cd2367e5481b56a0eb6f72a6b147916eea2249b7'
	    'a60a6f5d37b56ae013c805bae246b43a1c8637a29b681b083cc3e270d97a2814'
	    '11296c19676c977dda256ee480ba1be2c681573656095ab4cd4cdece6548a1c0'
)

build() {
	cd "$_srcname"

	patch -p1 < ../0001-sharedmem-Fix-build-warning-on-32-bit-arm.patch
	patch -p1 < ../0002-storage-Try-opening-the-slot-suffixed-partition.patch
	patch -p1 < ../0003-storage-Add-modem_study-into-partition_table.patch

	make prefix=/usr
}

package() {
	cd "$_srcname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir"/udev.rules "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
