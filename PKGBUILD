# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=grubinvaders
pkgver=1.0.0
pkgrel=3
pkgdesc="multi boot compliant game for i386 and compatible x86_64"
arch=('any')
url="http://www.erikyyy.de/invaders/"
license=('GPL2')
makedepends=('gcc')
source=("http://www.erikyyy.de/invaders/invaders-${pkgver}.tar.gz"
	'0001-gcc_binutils_bugfix.patch'
	'0002-reboot-on-esc.patch'
	'0003-no-stack-protector.patch'
	'0004-x86_64_envfix.patch'
	'grub')
install=${pkgname}.install

prepare() {
	cd ${srcdir}/invaders/

	patch -Np1 -i "${srcdir}/0001-gcc_binutils_bugfix.patch"
	patch -Np1 -i "${srcdir}/0002-reboot-on-esc.patch"
	patch -Np1 -i "${srcdir}/0003-no-stack-protector.patch"

	[ "${CARCH}" = "x86_64" ] && patch -Np1 -i "${srcdir}/0004-x86_64_envfix.patch" || true

	sed -i -e '/gcc $LDFLAGS/s/gcc/ld/' -e 's/-Wl,-N//' -e 's/-Wl,-Ttext//' -e 's/-Wl,100000//' -e 's/-Wl,--build-id=none//' compile.sh
}

build() {
	cd ${srcdir}/invaders/

	./compile.sh
}

package() {
	cd ${srcdir}/invaders/

	install -m0644 -D ${srcdir}/invaders/invaders ${pkgdir}/boot/${pkgname}/invaders.bin
	install -m0755 -D ${srcdir}/grub ${pkgdir}/etc/grub.d/50_grubinvaders
}

sha256sums=('304c8b0f82eaec54b07250b0f39886e1d9fa23c48075213bf87c8f375781a845'
            'c0c15db81101b6ffce3c6d142e207358155eac37970ddd3b31d4ebe42b703515'
            '36ff7d4a546b9e1f15f62683120f7b7428d14a5ef15b4923e8179cd0ffcc9b99'
            '46819946a00a81f8b8346a52778dd1c4f35ebc6ae82937e3eebde7b25dc4b3f4'
            'a21caf867c156a664779a40f5139ca895f4d7915a22a7a792dffc0976a8c8c5b'
            'fc36e67c91515aa619ca9616f517116d5cfd1f257fc142703a5ff01ec5dcfdab')
