pkgbase=gcc9-bin
pkgname=(g{cc,++,fortran}9-bin)
pkgver=9.5.0_3ubuntu1
_arch=`uname -m|sed s/x86_/amd/\;s/arch/rm/`
_web=https://packages.ubuntu.com
_curl(){
	curl -LsS --retry 3 $_web/$1
}
[ $_dist. = . ] && _dist=`[ $_arch = amd64 ] && _curl gcc-9\&exact=1|grep resultlink|cut -d\" -f2|tail -1 || echo lunar`	# mantic needs glibc 2.38
[ $_pkgver. = . ] && _pkgver=`_curl $_dist/gcc-9|grep Package:|cut -d\( -f2|cut -d\) -f1`
pkgrel=1
pkgdesc='The GNU Compiler Collection - C frontend (series 9.x)'
arch=(x86_64 aarch64)
url=$_web/$_dist/source/gcc-9
license=({,L}GPL FDL custom)
_pkgs='cpp-9 gcc-9 libgcc-9-dev'
_pkgs2=g++-9\ libstdc++-9-dev
_pkgs3=gfortran-9
source=(`for _i in $_pkgs{,2,3};do echo http://$([ $_arch = amd64 ] && echo archive.ubuntu.com/ubuntu ||
	echo ports.ubuntu.com)/pool/universe/g/gcc-9/${_i}_${_pkgver}_$_arch.deb;done`)
noextract=(${source[@]##*/})
sha256sums=(`for _i in $_pkgs{,2,3};do _curl $_dist/$_arch/$_i/download|grep SHA256|cut -d\> -f6|cut -d\< -f1;done`)
pkgver(){
	echo ${_pkgver/-/_}
}
_package(){
	for _i in $@;do bsdtar xfO ${_i}_${_pkgver}_$_arch.deb data.tar.*|bsdtar xf - `for _i in $(echo $@|tr \  '\n'|sed s,^,doc/,) lintian
		do echo --exclude=usr/share/$_i;done`;done
	mv usr/share/doc/gcc{-9-base,9-bin}
	mv usr "$pkgdir"
}
package_gcc9-bin(){
	depends=(libisl)
	provides=(gcc9)
	conflicts=(gcc9)
	_package $_pkgs
}
package_g++9-bin(){
	pkgdesc=${pkgdesc/C /C++ }
	depends=(gcc9-bin)
	_package $_pkgs2
}
package_gfortran9-bin(){
	pkgdesc='Fortran front-end for GCC (series 9.x)'
	depends=(gcc9-bin)
	conflicts=(gcc9-fortran)
	_package $_pkgs3
}
