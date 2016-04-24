# Maintainer: Matthew Monaco <cx monaco dgbaley27>

# http://kernel.opensuse.org/cgit/kernel-source/
# http://kernel.opensuse.org/cgit/kernel-source/commit/patches.drivers?id=940e57e2c66093f6fee481ab4224dd4294e3793f
# https://bugzilla.novell.com/768506
# https://bugzilla.novell.com/765524

_kver=4.4
_gitroot=git://repo.or.cz/linux.git
_gitcommit=linux-$_kver.y
_cur_kernel="$(uname -r)"

pkgname=synaptics-led
pkgver=$_kver
pkgrel=3
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/mmonaco/PKGBUILDs"
pkgdesc="Synaptics LED enabled psmouse kernel module"
depends=(linux)
makedepends=(git linux-headers)
install="$pkgname.install"

source=(
	SHA256SUMS_for_4.4
	"$pkgname.install"
	0003-patch_for_kernel_4.patch
)

sha256sums=('d8d91976d55c752d116d0ab42719f7df5d48de5be28ce8e18a61c96c09be1933'
            'b46af61822e8ec8639faa1b60dd3b6b1a64e24854611902499b9f81d2691e22c'
            '6e9f87025e2b178dc8cf9052fbe014f67d97b6b5ceb98e1a9fd15f12650fb437')

build() {

	cd "$srcdir"

	msg2 "Getting source from $_gitroot"
	git archive --remote="$_gitroot" "$_gitcommit" drivers/input/mouse | tar -x
	
	cd "drivers/input/mouse"

	msg2 "Performing Integrity Check"
	sha256sum --quiet -c "$srcdir/SHA256SUMS_for_4.4"

	msg2 "Patching source"
	patch -p4 -i "$srcdir/0003-patch_for_kernel_4.patch"

	msg2 "Building psmouse.ko"
	make -C "/usr/lib/modules/$_cur_kernel/build" M="$PWD" psmouse.ko

	msg2 "Compressing psmouse.ko.gz"
	gzip -9 psmouse.ko
}

package() {

	cd "$srcdir/drivers/input/mouse"

	# determin dir name in /usr/lib/modules/
	_EXTRAMODULES=$(find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||')

	install -D -m 0644 psmouse.ko.gz "$pkgdir/usr/lib/modules/${_EXTRAMODULES}/psmouse.ko.gz"

	# if you have not one kernel installed, you should change install string:
	# install -D -m 0644 psmouse.ko.gz "$pkgdir/usr/lib/modules/{YOUR_EXTRAMODULES_DIR}/psmouse.ko.gz"

}
