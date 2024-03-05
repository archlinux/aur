pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.7_1
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/sid/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7.7-amd64-unsigned_6.7.7-1_amd64.deb
	$_url/linux-headers-6.7.7-amd64_6.7.7-1_amd64.deb
	$_url/linux-headers-6.7.7-common_6.7.7-1_all.deb
	$_url/linux-kbuild-6.7.7_6.7.7-1_amd64.deb)
source_aarch64=(`sed s/md/rm/g<<<${source_x86_64[@]}`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	1a67d2bfaa3400cabc06589a034ca59bf07a7cae7647f5cdd60d88164056ad1c
	2d47b4fd8fe8d14cd32d515ac3f62396aa4a4de6dd6aed659fdcd242732e7591
	8e4f5f289fb716e7502630982927c2a52ed179a8f0248c90f1706b68ba917e5b
	afeb74533ae6575d9fb5b7c7931e41b7d4574878e7d0a1a148cd39f575d5b9c8)
sha256sums_aarch64=(
	1fa20eb712ef4a7c7308dd5967c7526565bb210c572ec2df5ed3a6f6030f390f
	03cb648d213fa13f3e85f095f056476e2db450f8acd592590e082e68a039bdc7
	8e4f5f289fb716e7502630982927c2a52ed179a8f0248c90f1706b68ba917e5b
	3c10e0be5a1dce9f128212477aea69035a3719f316665aeb537b2d03ed367a79)
_arch=${CARCH/x86_/amd};_arch=${_arch/arch/rm}
_source=(${source_x86_64[@]});[ $_arch = arm64 ] && _source=(${source_aarch64[@]})
_pkgver=6.7.7
package_linux-bin(){
	pkgdesc='The Linux kernel and modules'
	depends_x86_64=(initramfs)
	depends_aarch64=(dracut)
	optdepends=('linux-libre-firmware: firmware images needed for some devices')
	provides=(linux)
	[ $_arch = arm64 ] && install=linux2.install
	bsdtar xfO ${_source[0]##*/} data.tar.*|bsdtar xf - boot/vmlinuz* usr/{lib,share/doc/linux-image-$_pkgver-$_arch-unsigned/changelog.*}
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
		bsdtar xfO ${_source[-$_i]##*/} data.tar.*|tar xfJ - ./usr/$_a --xform=s,usr/$_a/linux-$_b-$_pkgver$_c,usr/lib/modules/$_pkgver-$_arch/build,
	done
	sed -i "s/\$(shell dpkg --print-architecture)/$_arch/;s/gcc-.*/gcc/;/CROSS_COMPILE /d" usr/lib/modules/$_pkgver-$_arch/build/.kernelvariables
	rm -d usr/src
	mv usr "$pkgdir"
}
