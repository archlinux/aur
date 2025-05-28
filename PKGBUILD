# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com
pkgname=image-garden
pkgver=0.3.3
pkgrel=1
pkgdesc="Tool for creating test virtual machines"
arch=(any)
url="https://gitlab.com/zygoon/image-garden"
license=('Apache-2.0')
groups=()
depends=('xorriso' 'edk2-ovmf' 'qemu-system-x86' 'qemu-system-aarch64')
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
	"0002-image-garden-fix-shellcheck.patch"
)
noextract=()
sha256sums=('d6fcc5d61971b0350617852a3274512bcffc4119324f92675431d6a3df493d43'
            '0a37160d07fea968e28b5b93c0d8ac34868f4ef21ab16dcaff758f98e6dedeb6'
            '07f7680afb15f63164cbaaad0c2e3d11bec01f1c870469884d690da425dc22f5')

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
