# $Id$
# Maintainer: Enihcam <gmail: nanericwang>

_pkgname=r8168
pkgname=r8168-ck
pkgver=8.048.03
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (linux-ck)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('x86_64')
makedepends=('linux-ck-headers')
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('0f191c4dc2f2e1aef6789d34820305fae27690d20212f2ac12ded634eb786d8c')

build() {
	cd "$_pkgname-$pkgver"
	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/src/linux-ck M="$PWD/src" \
			EXTRA_CFLAGS="${CFLAGS/-fno-plt/} -DCONFIG_R8168_NAPI -DCONFIG_ASPM -DENABLE_EEE" \
			modules
}

package() {
	depends=('glibc' 'linux-ck')

	local extradir=/usr/lib/modules/$(</usr/src/linux-ck/version)/extramodules
	cd "$_pkgname-$pkgver"
	install -Dt "$pkgdir$extradir" -m644 src/*.ko
	find "$pkgdir" -name '*.ko' -exec strip --strip-debug {} +
	find "$pkgdir" -name '*.ko' -exec xz {} +

	echo "blacklist r8169" | \
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}
