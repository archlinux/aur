# Maintainer: Matthew Monaco <cx monaco dgbaley27>

# http://kernel.opensuse.org/cgit/kernel-source/
# http://kernel.opensuse.org/cgit/kernel-source/commit/patches.drivers?id=940e57e2c66093f6fee481ab4224dd4294e3793f
# https://bugzilla.novell.com/768506
# https://bugzilla.novell.com/765524

_kver=3.11
_gitroot=git://repo.or.cz/linux.git
_gitcommit=linux-$_kver.y
_cur_kernel="$(uname -r)"

pkgname=synaptics-led
pkgver=$_kver
pkgrel=7
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/mmonaco/PKGBUILDs"
pkgdesc="Synaptics LED enabled psmouse kernel module"
depends=(linux)
makedepends=(git linux-headers)
install="$pkgname.install"

source=(
	SHA256SUMS
	"$pkgname.install"
	0001-input-Add-LED-support-to-Synaptics-device.patch
	0002-synaptics-add-debugging-to-synaptics_has_led.patch
)

sha256sums=(
	448b8b052247a081fd99bd4500313cb1bf24687c42c7ac6c178681bbc5c64352
	b46af61822e8ec8639faa1b60dd3b6b1a64e24854611902499b9f81d2691e22c
	4ce194fd0283affb0be2eef6d61aaeae134837af2d204ddd765008d081809e07
	790b80dc08e22e91fc315c5439cec5d65a1ee523f7d22aba509e39bb8abc7a6f
)

build() {

	cd "$srcdir"

	msg2 "Getting source from $_gitroot"
	git archive --remote="$_gitroot" "$_gitcommit" drivers/input/mouse | tar -x
	
	cd "drivers/input/mouse"

	msg2 "Performing Integrity Check"
	sha256sum --quiet -c "$srcdir/SHA256SUMS"

	msg2 "Patching source"
	patch -p4 -i "$srcdir/0001-input-Add-LED-support-to-Synaptics-device.patch"
	patch -p4 -i "$srcdir/0002-synaptics-add-debugging-to-synaptics_has_led.patch"

	msg2 "Building psmouse.ko"
	make -C "/lib/modules/$_cur_kernel/build" M="$PWD" psmouse.ko

	msg2 "Compressing psmouse.ko.gz"
	gzip -9 psmouse.ko
}

package() {

	cd "$srcdir/drivers/input/mouse"

	install -Dm 0644 psmouse.ko.gz \
		"$pkgdir/lib/modules/$_cur_kernel/extramodules/psmouse.ko.gz"
}
