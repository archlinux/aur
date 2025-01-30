# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com
pkgname=image-garden
pkgver=0.1.1
pkgrel=3
pkgdesc="Tool for creating test virtual machines"
arch=(any)
url="https://gitlab.com/zygoon/image-garden"
license=('Apache-2.0')
groups=()
depends=()
makedepends=('shellcheck')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
	"$pkgname-$pkgver.tar.bz2::https://gitlab.com/zygoon/${pkgname}/-/archive/v${pkgver}/image-garden-v${pkgver}.tar.bz2"
	"0001-Allow-overriding-default-OVMF-code-and-vars-blobs-lo.patch"
	"0002-Arch-override-default-OVMF-blobs-location.patch"
)
noextract=()
sha256sums=(
	'e75ce3e9491b474425029787d8b4d456f593d23c62ca593673dfdd3f6bad1595'
	'8310ca74ad374b7197d04ed8d4e9ccbea64fd2fc8467a40f7e14c07c2d3d2ece'
	'04a824cd0ceee56811f3c1c8b12c0ed7fd7203eefd6559d66cbebffeeff68b48'
)

prepare() {
	cd "$pkgname-v$pkgver"

	for name in "${source[@]}"; do
		if [[ "${name%.patch}" == "$name" ]]; then
			# not a patch
			continue
		fi
		msg2 "applying $name"
		patch -p1 -i "$srcdir/$name"
	done
}

build() {
	cd "$pkgname-v$pkgver"
	make
}

check() {
	cd "$pkgname-v$pkgver"
	make check
}

package() {
	depends=(
		'make'
		'cdrtools'
		'qemu-img'
		'qemu-system-x86'
		'qemu-system-aarch64'
		'edk2-ovmf'
		'wget'
		'whois'
	)

	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr install
}
