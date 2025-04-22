# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=mwecocapture-dkms
pkgver=1.4.256
pkgrel=1
pkgdesc="Driver for Eco Capture"
arch=('x86_64')
url="https://www.magewell.com/downloads/eco-capture#/driver/linux-x86"
license=('GPL-2.0-or-later')
depends=('glibc' 'dkms' 'linux-firmware')
makedepends=('git')
provides=('mwecocapture')
conflicts=('mwecocapture')
source=("https://www.magewell.com/files/drivers/EcoCaptureForLinuxX86_$pkgver.tar.gz"
	"dkms.conf")
sha256sums=('1b067d94bfa6f53edf1a8d635fd2bd41eda757e38b7f474bf75d8dabb223b312'
            '57345bdcdc03c6baee00a463344881ad9eed45ebe329432413933f0fd9f82d0d')


package() {
	cd "$srcdir"
	local _dir=EcoCaptureForLinuxX86
	install -Dm644 dkms.conf "${pkgdir}/usr/src/mwecocapture-$pkgver/dkms.conf"

	sed -e "s/@PKGNAME@/mwecocapture/g" \
		-e "s/@PKGVER@/$pkgver/g" \
		-i "$pkgdir/usr/src/mwecocapture-$pkgver/dkms.conf"

	cd "$srcdir/${_dir}_${pkgver}"
	cp -r --no-preserve='ownership' driver "$pkgdir/usr/src/mwecocapture-$pkgver/src"
	pushd firmware
	for file in *.bit;
	do
		install -Dm644 $file "$pkgdir/usr/lib/firmware/$file"
	done
	popd
	pushd bin
	for file in mweco-info_64;
	do
		install -Dm755 $file "$pkgdir/usr/bin/$file"
	done
	popd
	install -Dm644 docs/Readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
}
