# $Id$
# Maintainer: Enihcam <gmail: nanericwang>

pkgname=r8168-ck
_pkgname=r8168
pkgver=8.045.08
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('x86_64')
depends=('glibc' 'linux-ck')
makedepends=('linux-ck-headers')
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        linux-4.15.patch)
sha256sums=('18161cb72fc872a9aed194514f7b8fb8b255b6fa6ed3d2dd459700eaad575f31'
            '6434f0d1fcb08e3605a17859d3b8946c65bcf14737e223315b6468b3394c5cd7')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -Np1 -i ../linux-4.15.patch
}

build() {
	_kernver=$(pacman -Q linux-ck | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ck/version)
	msg2 "Kernel = $KERNEL_VERSION"

	cd "$_pkgname-$pkgver"
	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/lib/modules/$KERNEL_VERSION/build \
			SUBDIRS="$srcdir/$_pkgname-$pkgver/src" \
			EXTRA_CFLAGS="${CFLAGS} -DCONFIG_R8168_NAPI" \
			modules
}

package() {
	_kernver=$(pacman -Q linux-ck | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux-ck>=$_kernver" "linux-ck<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")

	cd "$_pkgname-$pkgver"
	install -Dt "$pkgdir/usr/lib/modules/extramodules-$_kernver-ck" -m644 src/*.ko
	find "$pkgdir" -name '*.ko' -exec xz {} +

	echo "blacklist r8169" | \
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/r8168.conf"
}
