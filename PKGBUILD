# Maintainer: Matthew Monaco <cx monaco dgbaley27>
#             Ivan           <vantu5z@mail.ru>

# http://kernel.opensuse.org/cgit/kernel-source/
# http://kernel.opensuse.org/cgit/kernel-source/commit/patches.drivers?id=940e57e2c66093f6fee481ab4224dd4294e3793f
# https://bugzilla.novell.com/768506
# https://bugzilla.novell.com/765524

_kver=4.19
_gitroot=git://repo.or.cz/linux.git
_gitcommit=linux-$_kver.y
_cur_kernel="$(uname -r)"
_EXTRAMODULES=$(readlink -f /usr/lib/modules/"$_cur_kernel/extramodules")

pkgname=synaptics-led
pkgver=$_kver
pkgrel=2
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/mmonaco/PKGBUILDs"
pkgdesc="Synaptics LED enabled psmouse kernel module"
depends=('linux>=4.14.9')
makedepends=('git' 'linux-headers>=4.14.9')
install="$pkgname.install"

source=(
	SHA256SUMS
	"$pkgname.install"
	kernel.patch
)

sha256sums=('7c944beb9eec59dde38e43d99a732067257aac337d3fe22081704c18aaa20f90'
            'b46af61822e8ec8639faa1b60dd3b6b1a64e24854611902499b9f81d2691e22c'
            '5772c0adfc86f7fff1692c220c069c427725fe196263942818d372ffdc09f88a')

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

	msg2 "Compressing psmouse.ko.gz"
	gzip -9 psmouse.ko
}

package() {
	cd "${srcdir}/drivers/input/mouse"

	install -D -m 0644 psmouse.ko.gz "${pkgdir}/${_EXTRAMODULES}/psmouse.ko.gz"

	# if you have not one kernel installed and _EXTRAMODULES not proper detected:
	# you should change install string for EXTRAMODULES manualy:
	# install -D -m 0644 psmouse.ko.gz "${pkgdir}/usr/lib/modules/{YOUR_EXTRAMODULES_DIR}/psmouse.ko.gz"
}
