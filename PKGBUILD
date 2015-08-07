# Maintainer: Matthew Monaco <cx monaco dgbaley27>

# http://kernel.opensuse.org/cgit/kernel-source/
# http://kernel.opensuse.org/cgit/kernel-source/commit/patches.drivers?id=940e57e2c66093f6fee481ab4224dd4294e3793f
# https://bugzilla.novell.com/768506
# https://bugzilla.novell.com/765524

# _kver=3.11
_kver=4.0
_gitroot=git://repo.or.cz/linux.git
_gitcommit=linux-$_kver.y
_cur_kernel="$(uname -r)"

pkgname=synaptics-led
pkgver=$_kver
pkgrel=1
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/mmonaco/PKGBUILDs"
pkgdesc="Synaptics LED enabled psmouse kernel module"
depends=(linux)
makedepends=(git linux-headers)
install="$pkgname.install"

source=(
	SHA256SUMS_for_3.11
	SHA256SUMS_for_4.0
	"$pkgname.install"
	0001-input-Add-LED-support-to-Synaptics-device.patch
	0002-synaptics-add-debugging-to-synaptics_has_led.patch
	0003-patch_for_kernel_4.patch
)

sha256sums=(
	448b8b052247a081fd99bd4500313cb1bf24687c42c7ac6c178681bbc5c64352
	1780583e2e1da8526e0b14b232cfdc8e5fb8799aa7477fd74788dccfd3b34bf3
	b46af61822e8ec8639faa1b60dd3b6b1a64e24854611902499b9f81d2691e22c
	4ce194fd0283affb0be2eef6d61aaeae134837af2d204ddd765008d081809e07
	790b80dc08e22e91fc315c5439cec5d65a1ee523f7d22aba509e39bb8abc7a6f
	d288fbe19be60efda3ec06f613a302a8d169487f0301a41e501b1541efaf4ec9
)

build() {

	cd "$srcdir"

	msg2 "Getting source from $_gitroot"
	git archive --remote="$_gitroot" "$_gitcommit" drivers/input/mouse | tar -x
	
	cd "drivers/input/mouse"

	msg2 "Performing Integrity Check"
#	sha256sum --quiet -c "$srcdir/SHA256SUMS_for_3.11"
	sha256sum --quiet -c "$srcdir/SHA256SUMS_for_4.0"

	msg2 "Patching source"
#	patch -p4 -i "$srcdir/0001-input-Add-LED-support-to-Synaptics-device.patch"
#	patch -p4 -i "$srcdir/0002-synaptics-add-debugging-to-synaptics_has_led.patch"
	patch -p4 -i "$srcdir/0003-patch_for_kernel_4.patch"

	msg2 "Building psmouse.ko"
	make -C "/usr/lib/modules/$_cur_kernel/build" M="$PWD" psmouse.ko

	msg2 "Compressing psmouse.ko.gz"
	gzip -9 psmouse.ko
}

package() {

	cd "$srcdir/drivers/input/mouse"

	_EXTRAMODULES=$(find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||')

install -D -m 0644 psmouse.ko.gz "$pkgdir/usr/lib/modules/${_EXTRAMODULES}/psmouse.ko.gz"
}
