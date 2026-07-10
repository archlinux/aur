# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com
pkgname=image-garden
pkgver=0.6.3
pkgrel=1
pkgdesc="Tool for creating test virtual machines"
arch=(any)
url="https://gitlab.com/zygoon/image-garden"
license=('Apache-2.0')
groups=()
depends=('xorriso' 'edk2-ovmf' 'qemu-system-x86' 'qemu-system-aarch64' 'whois' 'wget' 'xz' 'virtiofsd')
optdepends=('qemu-system-ppc' 'qemu-system-riscv' 'qemu-system-s390x')
makedepends=('shellcheck' 'python')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
	"$pkgname-$pkgver.tar.bz2::https://gitlab.com/zygoon/${pkgname}/-/archive/v${pkgver}/image-garden-v${pkgver}.tar.bz2"
)
noextract=()
sha256sums=('416b7090223a5c8c1429ae165778860581a5fc203237af175099ff649127ac7c')

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
