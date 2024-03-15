pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.9_2
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/sid/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7.9-amd64-unsigned_6.7.9-2_amd64.deb
	$_url/linux-headers-6.7.9-amd64_6.7.9-2_amd64.deb
	$_url/linux-headers-6.7.9-common_6.7.9-2_all.deb
	$_url/linux-kbuild-6.7.9_6.7.9-2_amd64.deb)
source_aarch64=(`sed s/md/rm/g<<<${source_x86_64[@]}`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	bd6f5414588cd926adbdc71425cd77809cd5484aea7a19284a621f646292a507
	aa65dd1f6596ddeb103803fc6b4be2585aa364899b9f26744accea573af92e97
	e06b04addc4c6dba4b5a600398977eaec786401a94081b154986e0c198e92bc9
	78640a4f27512f03e808368f0094d88c8e90ed593b769215f7c3b60f3e58342d)
sha256sums_aarch64=(
	bfe3a6ba2753d093ce7dcf57319b755cdc20919efa86a667e510fc8a503c29b4
	85c7d3bdcbe600563e522f86e4f334adc880b8295574eb3ba2073e1e2f7d9e91
	${sha256sums_x86_64[2]}
	9d9287871ce31b654a90cbc8ab446e1aab676e85733ef132a155be1980af79f1)
_arch=${CARCH/x86_/amd} _arch=${_arch/arch/rm}
_source=(${source_x86_64[@]});[ $_arch = arm64 ] && _source=(${source_aarch64[@]})
_pkgver=6.7.9
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
