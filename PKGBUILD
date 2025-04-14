# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com
pkgname=image-garden
pkgver=0.2.2
pkgrel=1
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
	"0001-Arch-override-default-OVMF-blobs-location.patch"
)
noextract=()
sha256sums=('92efbfe2c7a0f9221001a043ae2a9e15a556cac548d2922517bceaab6d14a661'
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
