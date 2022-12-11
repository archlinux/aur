pkgname=gcc9-bin
pkgver=`curl -s --retry 5 https://packages.ubuntu.com/kinetic/gcc-9|grep Package:|cut -d\( -f2|cut -d\) -f1|sed s/-/_/`
pkgrel=2
pkgdesc="The GNU Compiler Collection (series 9.x)"
arch=(x86_64 aarch64)
_arch=`uname -m|sed s/x86_/amd/\;s/arch/rm/`
url=https://packages.ubuntu.com/kinetic/g++-9
license=({,L}GPL FDL custom)
depends=(libisl)
provides=(gcc9)
conflicts=(gcc9)
source=(http://`[ $_arch = amd64 ] && echo archive.ubuntu.com/ubuntu || echo ports.ubuntu.com`/pool/universe/g/gcc-9/{{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev}_${pkgver/_/-}_$_arch.deb)
noextract=(*.deb)
md5sums=($(for I in {{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev};do curl -s --retry 5 https://packages.ubuntu.com/kinetic/$_arch/$I/download|grep MD5|cut -d\> -f6|cut -d\< -f1;done))
build(){
	for I in *.deb;do bsdtar xfO $I data.tar.zst|bsdtar xf - --exclude=usr/share/{lintian,doc/{{cpp,g++,gcc}-9,lib{gcc,stdc++}-9-dev}};done
	rm -fr usr/share/doc/gcc9-bin
	mv usr/share/doc/gcc{-9-base,9-bin}
}
package(){
	cp -r usr "$pkgdir"
}
