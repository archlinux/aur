pkgbase=linux-dfsg
pkgname=(linux{,-headers}-bin)
pkgver=6.7.9_1
pkgrel=1
arch=(x86_64 aarch64)
url=https://packages.debian.org/source/sid/linux
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source_x86_64=(
	$_url/linux-image-6.7.9-amd64-unsigned_6.7.9-1_amd64.deb
	$_url/linux-headers-6.7.9-amd64_6.7.9-1_amd64.deb
	$_url/linux-headers-6.7.9-common_6.7.9-1_all.deb
	$_url/linux-kbuild-6.7.9_6.7.9-1_amd64.deb)
source_aarch64=(`sed s/md/rm/g<<<${source_x86_64[@]}`)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	e7480b399a8e7614499c2c70e252b60b9a63330d705df539d4feff5592c54e80
	8e8128fe8f2e7d803ac498f568f67f1a4d1578e7cde2cd479a95f68bc1290960
	205c07e2453aa8e3ec1016faec1624750827584546ca2e544b94badf6fce686a
	c6ec5002464661c7b7b1dd65fbfe36e5c904f29035bcc1aa5654cf8451065f50)
sha256sums_aarch64=(
	e2326128e587a7de8247c3bee95bb12a1e3ad56a07051c524045de02741dd901
	1e45bd24b9f8c23ac35d682690a4fc10ea1b2d53a74fdd017ce2fa861d85be9b
	${sha256sums_x86_64[2]}
	abf3ad70c600a5dc265d0feb482b03684fe286bfaf85085a9cf2ce0655bc66a0)
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
