pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.4_1~exp1
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/experimental/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7-amd64-unsigned_6.7.4-1~exp1_amd64.deb
	$_url/linux-headers-6.7-amd64_6.7.4-1~exp1_amd64.deb
	$_url/linux-headers-6.7-common_6.7.4-1~exp1_all.deb
	$_url/linux-kbuild-6.7_6.7.4-1~exp1_amd64.deb)
source_aarch64=(`echo ${source_x86_64[@]}|sed s/md/rm/g`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	d7c4580ace62292290e382b5b93ca9f7e14876a7c325d40061dee5c90e520255
	7157f738f6bbba59ef0bcee91fe584fb06c871a6c6719b5ea2480f507d9df829
	d396c5903d150e31657eebd5506c4856586bfe16854c93d27300f13392b3cd37
	4e180fbb7cd27c30c3f613ad368a0af4850dc208c1d5271027f035a8215c11ff)
sha256sums_aarch64=(
	2e4137d3a35faccfe8c3ae5458fedfa2807dcc2aa95922b5720d2872afa655b5
	e26bac0140501cefd29be16e5389755273c186eae33d5b1251ffa587bf34e89c
	d396c5903d150e31657eebd5506c4856586bfe16854c93d27300f13392b3cd37
	582676704845e5222d1a9b327dcdfb68314df6144c513c80975069eaf76a8645)
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
