pkgbase=linux-bin
pkgname=(linux{,-headers}-bin)
pkgver=6.5.10_1
_web=https://packages.debian.org
url=$_web/source/sid/linux-signed-arm64
[ "$_curl" = "" ] && _curl=`curl -s $url`
_pkgver=`echo "$_curl"|grep Source\ Package:|sed 's/.*(//;s/).*//'|tr + _`
_pkgver2=`echo "$_curl"|grep [0-9]-arm64\"|cut -d- -f3-4`
pkgrel=1
arch=(aarch64)
license=(GPL2)
options=(!strip)
_a=https://ftp.debian.org/debian/pool/main/l/linux
source=(
	$_a-signed-arm64/linux-image-$_pkgver2-arm64_${_pkgver/_/-}_arm64.deb
	$_a/linux-{headers-$_pkgver2-{arm64_${_pkgver/_/-}_arm64,common_${_pkgver/_/-}_all},kbuild-${_pkgver2}_${_pkgver/_/-}_arm64}.deb)
noextract=(${source[@]##*/})
sha256sums=($(for _i in $(echo ${source[@]##*/}|tr \  \\n|sed s/_.*//);do curl -s $_web/sid/arm64/$_i/download|grep SHA256|cut -d\> -f6|cut -d\< -f1;done))
pkgver(){
	echo $_pkgver
}
[ $_b. = . ] && _b=$PWD
sed s/%KVER%/$_pkgver2-arm64/ $_b/linux.install>linux2.install
package_linux-bin(){
	pkgdesc="The Linux kernel and modules (signed)"
	depends=(dracut)
	optdepends=('linux-libre-firmware: firmware images needed for some devices')
	provides=(linux)
	install=linux2.install
	bsdtar xfO ${source[0]##*/} data.tar.*|bsdtar xf - boot/vmlinuz* {,usr/}lib usr/share/doc/linux-image-$_pkgver2-arm64/changelog.*
	msg2 "Compressing kernel modules..."
	find lib/modules/*/kernel -type f -exec xz {} \;
	mv boot/{vmlinuz*,Image}
	mv lib/modules usr/lib
	mv usr/lib/linux-image* boot/dtbs
	mv usr/share/doc/linux-{image-$_pkgver2-arm64,bin}
	mv boot usr "$pkgdir"
}
package_linux-headers-bin(){
	pkgdesc="Headers and scripts for building modules for the Linux kernel"
	provides=(linux-headers)
	for _i in 3 2 1
		do _a=src _b=headers _c=-arm64
		[ $_i = 2 ] && _c=-common
		[ $_i = 1 ] && _a=lib _b=kbuild _c=
		bsdtar xfO ${source[-$_i]##*/} data.tar.xz|tar xfJ - ./usr/$_a --xform=s,usr/$_a/linux-$_b-$_pkgver2$_c,usr/lib/modules/$_pkgver2-arm64/build,
	done
	sed -i "s/\$(shell dpkg --print-architecture)/arm64/" usr/lib/modules/$_pkgver2-arm64/build/.kernelvariables
	sed -i s/gcc-.*/gcc/ usr/lib/modules/$_pkgver2-arm64/build/.kernelvariables
	rm -d usr/src
	mv usr "$pkgdir"
}
