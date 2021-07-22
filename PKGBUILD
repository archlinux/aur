# Maintainer: Cyano Hao <c@cyano.cn>

_pkgbase=linux-elbin  # for mkinitcpio hook
pkgname=linux-el-bin
_basever=4.18.0
_rhver=305.10.2
pkgver=$_rhver.kabi.$_basever
epoch=8
pkgrel=1
pkgdesc="The Enterprise Linux kernel, modules, headers and documentation (Rocky Linux binary)"
url="https://git.rockylinux.org/staging/rpms/kernel"
arch=(x86_64)
license=(GPL2)
depends=(coreutils kmod initramfs)
optdepends=(
	'crda: to set the correct wireless channels of your country'
	'linux-firmware: firmware images needed for some devices'
	'pahole: utility for building kernel modules'
)
makedepends=(xz cpio)
options=('!strip')
backup=("etc/mkinitcpio.d/$_pkgbase.preset")
install=linux-el.install

# corresponding packages (rhel -> archlinux)
#   kernel               -> N/A (meta package)
# ✓ kernel-core          -> linux
# ✓ kernel-modules       -> linux
#   kernel-modules-extra -> N/A (obsolete)
# ✓ kernel-devel         -> linux-headers
# ✓ kernel-doc           -> linux-docs
#   kernel-headers       -> linux-api-headers
#   kernel-tools         -> N/A (misc userland utils)

_rocky_mirror="https://download.rockylinux.org/pub/rocky"
_rocky_ver="8.4"
_rpmver=$_basever-$_rhver.el8_4
source=(
	"$_rocky_mirror/$_rocky_ver/BaseOS/x86_64/os/Packages/kernel-core-$_rpmver.x86_64.rpm"
	"$_rocky_mirror/$_rocky_ver/BaseOS/x86_64/os/Packages/kernel-modules-$_rpmver.x86_64.rpm"
	"$_rocky_mirror/$_rocky_ver/BaseOS/x86_64/os/Packages/kernel-devel-$_rpmver.x86_64.rpm"
	"$_rocky_mirror/$_rocky_ver/BaseOS/x86_64/os/Packages/kernel-doc-$_rpmver.noarch.rpm"
	"$_pkgbase.preset"
)
noextract=(kernel-doc-$_rpmver.noarch.rpm)  # bsdtar cannot extract it
sha256sums=('7469f90326990ae80bad7e23472a5efac3d327f938e79e9795e4ee16f38b88d9'
            'dde6313a73399b7a0d2c7f53f1e9cf27c5f4fa32457a4e23b136f372880f0fe7'
            'a35754be5eccbce6fbffcde5dabd824098e5377e22aa497d770bfe4b3126682c'
            '52a57b581f0e5c8433998ee37fd74b750594f40f380e7553ce5f76f379043278'
            'dcb7f4f352395287152bb6a3469171d9199b1e000bab9f244e17db893cff70d9')

_rpm2cpio() {
	# source: `rpm2cpio` from extra/rpmextract

	leadsize=96
	o=`expr $leadsize + 8`
	set `od -j $o -N 8 -t u1 $pkg`
	il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
	dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
	# echo "sig il: $il dl: $dl"

	sigsize=`expr 8 + 16 \* $il + $dl`
	o=`expr $o + $sigsize + \( 8 - \( $sigsize \% 8 \) \) \% 8 + 8`
	set `od -j $o -N 8 -t u1 $pkg`
	il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
	dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
	# echo "hdr il: $il dl: $dl"

	hdrsize=`expr 8 + 16 \* $il + $dl`
	o=`expr $o + $hdrsize`

	dd if=$pkg ibs=$o skip=1 2>/dev/null
}

prepare() {
	echo "Extracting kernel-doc-$_rpmver.noarch.rpm"
	pkg=kernel-doc-$_rpmver.noarch.rpm _rpm2cpio | unxz | cpio -idm
}

package() {
	cd "$srcdir"
	install -Dm644 $_pkgbase.preset "$pkgdir"/etc/mkinitcpio.d/$_pkgbase.preset

	# kernel image and modules
	install -m755 -d "$pkgdir"/usr/lib/modules/
	cp -r lib/modules/$_rpmver.x86_64/ "$pkgdir"/usr/lib/modules/$_rpmver.x86_64
	# mkinitcpio hook
	echo $_pkgbase >"$pkgdir"/usr/lib/modules/$_rpmver.x86_64/pkgbase
	# create modules.* files
	depmod -b "$pkgdir"/usr $_rpmver.x86_64

	# headers
	# dkms hook requires headers in module directory
	rm "$pkgdir"/usr/lib/modules/$_rpmver.x86_64/build
	cp -r usr/src/kernels/$_rpmver.x86_64/ "$pkgdir"/usr/lib/modules/$_rpmver.x86_64/build
	# symlink
	install -m755 -d "$pkgdir"/usr/src/
	ln -s ../lib/modules/$_rpmver.x86_64/build "$pkgdir"/usr/src/$_pkgbase

	# docs
	# follow arch linux packaging schema
	cp -r usr/share/doc/kernel-doc-$_basever/Documentation "$pkgdir"/usr/lib/modules/$_rpmver.x86_64/build/Documentation
	# symlink
	install -m755 -d "$pkgdir"/usr/share/doc/
	ln -s ../../lib/modules/$_rpmver.x86_64/build/Documentation "$pkgdir"/usr/share/doc/$_pkgbase
}
