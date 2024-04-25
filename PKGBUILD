pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.12_1
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/sid/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7.12-amd64-unsigned_6.7.12-1_amd64.deb
	$_url/linux-headers-6.7.12-amd64_6.7.12-1_amd64.deb
	$_url/linux-headers-6.7.12-common_6.7.12-1_all.deb
	$_url/linux-kbuild-6.7.12_6.7.12-1_amd64.deb)
source_aarch64=(`sed s/md/rm/g<<<${source_x86_64[@]}`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	86432c7bbf358946b5f497987d4c18d7d100a5b7c5f7a73a05c814fdbbd03421
	9bc97771a7a610360922e1af21551dc30bb7c19c60494b8de72d506f73ade391
	2fd8b1aaa2262d741e2e0ebfe935e5a21673a3844b1e4669f5febeca80257045
	30345e4166a00111475d0fcbdd3f443c51132feeeebf57f17625df62d5199620)
sha256sums_aarch64=(
	1b49e4c7388690481b1cf87e1737e9d94bf12af3ae9a69837d50ae61c5a7abe0
	0d485314f4d9e1e33f4e8258985891d930bc927a427154023ae15c27e1edaebe
	${sha256sums_x86_64[2]}
	7d0321e6a6a309c7cd1bd2be439280df4309cc7ad9de1413e0c63f8bef4bda9f)
_arch=${CARCH/x86_/amd} _arch=${_arch/arch/rm}
_source=(${source_x86_64[@]});[ $_arch = arm64 ] && _source=(${source_aarch64[@]})
_pkgver=6.7.12
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
