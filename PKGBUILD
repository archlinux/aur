pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.1_1~exp1
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/experimental/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7-amd64-unsigned_6.7.1-1~exp1_amd64.deb
	$_url/linux-headers-6.7-amd64_6.7.1-1~exp1_amd64.deb
	$_url/linux-headers-6.7-common_6.7.1-1~exp1_all.deb
	$_url/linux-kbuild-6.7_6.7.1-1~exp1_amd64.deb)
source_aarch64=(`echo ${source_x86_64[@]}|sed s/md/rm/g`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	9d636c9f1d9b601d1e6000d387e8d30a105a8cb917dfde8cafa50af6ec0cfa2b
	7598a40f2eed46215a0e18933c013ff1aeee68f2eacf49761764bf2d49a78db2
	9dfc4c719d6274fdc475c120df0436eaa2299f2ee985937dbb7aa1c602e6affa
	5219ed4efdfb6f20ebe4e0e3d03ed4cfb5ff2b410e0df88b1967498a5ac83e32)
sha256sums_aarch64=(
	23a4d128fc7ebf2f73f6050c3f25384774af87d02e5a7f2f9c1f54eac8bad3a0
	3757ef27798edf6ac0f9fd37d8ebcc1436d6c0132e1bc9acc1861f963e295a05
	9dfc4c719d6274fdc475c120df0436eaa2299f2ee985937dbb7aa1c602e6affa
	a6538625979850a64a291f19feb8cc03242bdec9bca7c32b936bb44fabff1641)
_arch=${CARCH/x86_/amd};_arch=${_arch/arch/rm}
_source=(${source_x86_64[@]});[ $_arch = arm64 ] && _source=(${source_aarch64[@]})
pkgver(){
	echo $_source|cut -d_ -f2|tr - _
}
_pkgver=6.7
package_linux-bin(){
	pkgdesc='The Linux kernel and modules'
	depends_x86_64=(initramfs)
	depends_aarch64=(dracut)
	optdepends=('linux-libre-firmware: firmware images needed for some devices')
	provides=(linux)
	[ $_arch = arm64 ] && install=linux2.install
	bsdtar xfO ${_source[0]##*/} data.tar.*|bsdtar xf - boot/vmlinuz* usr/lib `[ $_arch = arm64 ] &&
		echo usr/lib` usr/share/doc/linux-image-$_pkgver-$_arch-unsigned/changelog.*
	[ $_arch = amd64 ] && {
		mv boot/vmlinuz* usr/lib/modules/$_pkgver-$_arch/vmlinuz
		echo linux>usr/lib/modules/$_pkgver-$_arch/pkgbase
	} || {
		mv boot/{vmlinuz*,Image}
		mv usr/lib/linux-image* boot/dtbs
		mv boot "$pkgdir"
	}
	mv usr/share/doc/linux{-image-$_pkgver-$_arch-unsigned,}
	mv usr "$pkgdir"
}
package_linux-headers-bin(){
	pkgdesc='Headers and scripts for building modules for the Linux kernel'
	provides=(linux-headers)
	for _i in 3 2 1
		do _a=src _b=headers _c=-$_arch
		[ $_i = 2 ] && _c=-common
		[ $_i = 1 ] && _a=lib _b=kbuild _c=
		bsdtar xfO ${_source[-$_i]##*/} data.tar.xz|tar xfJ - ./usr/$_a --xform=s,usr/$_a/linux-$_b-$_pkgver$_c,usr/lib/modules/$_pkgver-$_arch/build,
	done
	sed -i "s/\$(shell dpkg --print-architecture)/$_arch/;s/gcc-.*/gcc/;/CROSS_COMPILE /d" usr/lib/modules/$_pkgver-$_arch/build/.kernelvariables
	rm -d usr/src
	mv usr "$pkgdir"
}
