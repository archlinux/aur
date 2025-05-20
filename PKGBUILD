# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com
pkgname=image-garden
pkgver=0.3
pkgrel=2
pkgdesc="Tool for creating test virtual machines"
arch=(any)
url="https://gitlab.com/zygoon/image-garden"
license=('Apache-2.0')
groups=()
depends=('cdrtools' 'edk2-ovmf' 'qemu-system-x86' 'qemu-system-aarch64')
makedepends=('shellcheck')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
	"$pkgname-$pkgver.tar.bz2::https://gitlab.com/zygoon/${pkgname}/-/archive/v${pkgver}/image-garden-v${pkgver}.tar.bz2"
	"0001-Arch-override-default-OVMF-blobs-location.patch"
)
noextract=()
sha256sums=('6ce3a94bbb9897979d5761f2d8e20fc8dff1798d10e703e7676968b7c2fa8e6c'
            '04a824cd0ceee56811f3c1c8b12c0ed7fd7203eefd6559d66cbebffeeff68b48')

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
