pkgbase=linux-bin
pkgname=(linux{,-headers}-bin)
pkgver=6.5.10_1
pkgrel=1
arch=(x86_64 aarch64)
_arch=`uname -m|sed s/x86_/amd/\;s/arch/rm/`
_web=https://packages.debian.org
url=$_web/source/sid/linux-signed-$_arch
[ "$_curl" = '' ] && _curl=`curl -s $url`
_pkgver=`echo "$_curl"|grep Source\ Package:|sed 's/.*(//;s/).*//'|tr + -`
_pkgver2=`echo "$_curl"|grep [0-9]-$_arch\"|cut -d- -f3-4`
license=(GPL2)
options=(!strip)
_url=https://ftp.debian.org/debian/pool/main/l/linux
source=(
	$_url-signed-$_arch/linux-image-$_pkgver2-${_arch}_${_pkgver}_$_arch.deb
	$_url/linux-{headers-$_pkgver2-{${_arch}_${_pkgver}_$_arch,common_${_pkgver}_all},kbuild-${_pkgver2}_${_pkgver}_$_arch}.deb)
noextract=(${source[@]##*/})
sha256sums=(
	$(for _i in $(echo ${source[@]##*/}|tr \  \\n|sed s/_.*//);do curl -s $_web/sid/$_arch/$_i/download|grep SHA256|cut -d\> -f6|cut -d\< -f1;done))
pkgver(){
	echo ${_pkgver/-/_}
}
[ $_arch = arm64 ] && {
	[ $_pwd. = . ] && _pwd=$PWD
	sed s/%KVER%/$_pkgver2-arm64/ $_pwd/linux.install>linux2.install
}
package_linux-bin(){
	pkgdesc='The Linux kernel and modules (signed)'
	depends_x86_64=(initramfs)
	depends_aarch64=(dracut)
	optdepends=('linux-libre-firmware: firmware images needed for some devices')
	provides=(linux)
	[ $_arch = arm64 ] && install=linux2.install
	bsdtar xfO ${source[0]##*/} data.tar.*|bsdtar xf - boot/vmlinuz* lib `[ $_arch = arm64 ] && echo usr/lib` usr/share/doc/linux-image-$_pkgver2-$_arch/changelog.*
	[ $_arch = amd64 ] && {
		mv boot/vmlinuz* lib/modules/$_pkgver2-$_arch/vmlinuz
		echo linux>lib/modules/$_pkgver2-$_arch/pkgbase
	} || {
		mv boot/{vmlinuz*,Image}
		mv usr/lib/linux-image* boot/dtbs
		mv boot "$pkgdir"
	}
	msg2 'Compressing kernel modules...'
	find lib/modules/*/kernel -type f -exec xz {} \;
	mv lib usr
	mv usr/share/doc/linux-{image-$_pkgver2-$_arch,bin}
	mv usr "$pkgdir"
}
package_linux-headers-bin(){
	pkgdesc='Headers and scripts for building modules for the Linux kernel'
	provides=(linux-headers)
	for _i in 3 2 1
		do _a=src _b=headers _c=-$_arch
		[ $_i = 2 ] && _c=-common
		[ $_i = 1 ] && _a=lib _b=kbuild _c=
		bsdtar xfO ${source[-$_i]##*/} data.tar.xz|tar xfJ - ./usr/$_a --xform=s,usr/$_a/linux-$_b-$_pkgver2$_c,usr/lib/modules/$_pkgver2-$_arch/build,
	done
	sed -i "s/\$(shell dpkg --print-architecture)/$_arch/" usr/lib/modules/$_pkgver2-$_arch/build/.kernelvariables
	sed -i s/gcc-.*/gcc/ usr/lib/modules/$_pkgver2-$_arch/build/.kernelvariables
	rm -d usr/src
	mv usr "$pkgdir"
}
