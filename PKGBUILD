pkgname=gcc9-bin
pkgver=9.5.0_1ubuntu3
_web=https://packages.ubuntu.com
_dist=`curl -sL --retry 5 $_web/g++-9\&exact=1|grep resultlink|cut -d\" -f2|tail -1`
_pkgver=`curl -s --retry 5 $_web/$_dist/g++-9|grep Package:|cut -d\( -f2|cut -d\) -f1|tr - _`
pkgrel=2
pkgdesc="The GNU Compiler Collection (series 9.x)"
arch=(x86_64 aarch64)
_arch=`uname -m|sed s/x86_/amd/\;s/arch/rm/`
url=$_web/$_dist/g++-9
license=({,L}GPL FDL custom)
depends=(libisl)
provides=(gcc9)
conflicts=(gcc9)
source=(http://`[ $_arch = amd64 ] && echo archive.ubuntu.com/ubuntu || echo ports.ubuntu.com`/pool/universe/g/gcc-9/{{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev}_${_pkgver/_/-}_$_arch.deb)
noextract=(*.deb)
md5sums=($(for I in {{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev};do curl -s --retry 5 $_web/$_dist/$_arch/$I/download|grep MD5|cut -d\> -f6|cut -d\< -f1;done))
pkgver(){
	echo $_pkgver
}
build(){
	for I in *.deb;do bsdtar xfO $I data.tar.zst|bsdtar xf - --exclude=usr/share/{lintian,doc/{{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev}};done
	rm -fr usr/share/doc/gcc9-bin
	mv usr/share/doc/gcc{-9-base,9-bin}
}
package(){
	cp -r usr "$pkgdir"
}
