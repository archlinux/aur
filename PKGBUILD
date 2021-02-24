# Maintainer: Matthew Monaco <cx monaco dgbaley27>
#             Ivan           <vantu5z@mail.ru>

# http://kernel.opensuse.org/cgit/kernel-source/
# http://kernel.opensuse.org/cgit/kernel-source/commit/patches.drivers?id=940e57e2c66093f6fee481ab4224dd4294e3793f
# https://bugzilla.novell.com/768506
# https://bugzilla.novell.com/765524

_kver=5.11
_gitroot=git://repo.or.cz/linux.git
_gitcommit=linux-$_kver.y
_cur_kernel="$(uname -r)"
_EXTRAMODULES=$(readlink -f /usr/lib/modules/"$_cur_kernel/extramodules")

pkgname=synaptics-led
pkgver=$_kver
pkgrel=1
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/mmonaco/PKGBUILDs"
pkgdesc="Synaptics LED enabled psmouse kernel module"
depends=('linux>=5.10.13')
makedepends=('git' 'linux-headers>=5.10.13')
install="$pkgname.install"

source=(
	SHA256SUMS
	"$pkgname.install"
	kernel.patch
)

sha256sums=('bd0aa5a3b9334f2b51ac5ef61bd14479c7e7bbb263d7003d3b465e5bd04a7abf'
            'b46af61822e8ec8639faa1b60dd3b6b1a64e24854611902499b9f81d2691e22c'
            'e5ceec0528c76af072bac74f701c45b84726d8f5f72337e24434b6ac5a1a6097')

build() {
	msg2 "Module will be installed to: $_EXTRAMODULES"

	msg2 "Getting source from $_gitroot"
	cd "${srcdir}"
	git archive --remote="$_gitroot" "$_gitcommit" drivers/input/mouse | tar -x

	msg2 "Performing Integrity Check"
	cd "drivers/input/mouse"
	sha256sum --quiet -c "${srcdir}/SHA256SUMS"

	msg2 "Patching source"
    cd "${srcdir}"
	for p in ../*.patch; do
      msg2 "Applying patch: $p"
      patch -p1 -i "$p"
    done

	msg2 "Building psmouse.ko"
	cd "drivers/input/mouse"
	make -C "/usr/lib/modules/$_cur_kernel/build" M="$PWD" psmouse.ko

	msg2 "Compressing psmouse.ko.xz"
	xz psmouse.ko
}

package() {
	cd "${srcdir}/drivers/input/mouse"

	install -D -m 0644 psmouse.ko.xz "${pkgdir}/${_EXTRAMODULES}/psmouse.ko.xz"

	# if you have not one kernel installed and _EXTRAMODULES not proper detected:
	# you should change install string for EXTRAMODULES manualy:
	# install -D -m 0644 psmouse.ko.xz "${pkgdir}/usr/lib/modules/{YOUR_EXTRAMODULES_DIR}/psmouse.ko.xz"
}
