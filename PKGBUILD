# Maintainer: Cyano Hao <c@cyano.cn>

_pkgbase=linux-elbin  # for mkinitcpio hook
pkgname=linux-el-bin
_basever=4.18.0
pkgver=240.22.1
epoch=8  # indicates RHEL major version
pkgrel=2
# pkgdesc="The Enterprise Linux kernel, modules, headers and documentation (pre-built binary)"
pkgdesc="The Enterprise Linux kernel, modules and headers (Rocky Linux binary)"
url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
depends=(coreutils kmod initramfs)
options=('!strip')
backup=("etc/mkinitcpio.d/$_pkgbase.preset")
install=linux-el.install

# corresponding packages (rhel -> archlinux)
#   kernel               -> N/A (meta package)
# ✓ kernel-core          -> linux
# ✓ kernel-modules       -> linux
#   kernel-modules-extra -> N/A (obsolete)
# ✓ kernel-devel         -> linux-headers
# ○ kernel-doc           -> linux-docs (currently bsdtar cannot extract it)
#   kernel-headers       -> linux-api-headers
#   kernel-tools         -> N/A (misc userland utils)

_rocky_mirror="https://download.rockylinux.org/pub/rocky"
_rpmver=$_basever-$pkgver.el$epoch
source=(
	"$_rocky_mirror/$epoch/BaseOS/x86_64/os/Packages/kernel-core-$_rpmver.x86_64.rpm"
	"$_rocky_mirror/$epoch/BaseOS/x86_64/os/Packages/kernel-modules-$_rpmver.x86_64.rpm"
	"$_rocky_mirror/$epoch/BaseOS/x86_64/os/Packages/kernel-devel-$_rpmver.x86_64.rpm"
	# "$_rocky_mirror/$epoch/BaseOS/x86_64/os/Packages/kernel-doc-$_rpmver.noarch.rpm"
	"$_pkgbase.preset"
)
sha256sums=('bba3049faaee909ba055f495012a49cb885db357048e967a41d79aa1d5822465'
            '6360d8c98d127b00b2b7b6bc28b14f5b738642f699909a5e660161066a437f23'
            '8791ee1dc248f4ec347f2b254bf1c39e7e8a71c4a61b3996dd0c989c3acbe098'
            'dcb7f4f352395287152bb6a3469171d9199b1e000bab9f244e17db893cff70d9')

package() {
	cd "$srcdir"
	install -Dm644 $_pkgbase.preset "$pkgdir"/etc/mkinitcpio.d/$_pkgbase.preset

	# kernel image and modules
	install -m755 -d "$pkgdir"/usr/lib/modules/
	cp -r lib/modules/$_rpmver.x86_64/ "$pkgdir"/usr/lib/modules/$_rpmver.x86_64
	echo $_pkgbase >"$pkgdir"/usr/lib/modules/$_rpmver.x86_64/pkgbase  # mkinitcpio hook

	# headers
	# dkms hook requires headers in module directory
	rm "$pkgdir"/usr/lib/modules/$_rpmver.x86_64/build
	cp -r usr/src/kernels/$_rpmver.x86_64/ "$pkgdir"/usr/lib/modules/$_rpmver.x86_64/build
	# symlink
	install -m755 -d "$pkgdir"/usr/src/
	ln -s ../lib/modules/$_rpmver.x86_64/build "$pkgdir"/usr/src/$_pkgbase
}
