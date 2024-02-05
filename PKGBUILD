pkgbase=gcc9-bin
pkgname=(g{cc,++,fortran}9-bin)
pkgver=9.5.0_3ubuntu1
pkgrel=1
pkgdesc='The GNU Compiler Collection - C frontend (series 9.x)'
arch=(x86_64 aarch64)
license=({,L}GPL FDL custom)
_arch=${CARCH/x86_/amd};_arch=${_arch/arch/rm}
_dist=noble
[ $_arch = arm64 ] && _dist=lunar	# mantic needs glibc 2.38
url=https://packages.ubuntu.com/$_dist/source/gcc-9
_pkgver=9.5.0-4ubuntu2
source_x86_64=(http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-9/{cpp-9,gcc-9,libgcc-9-dev,g++-9,libstdc++-9-dev,gfortran-9}_${_pkgver}_amd64.deb)
source_aarch64=(http://ports.ubuntu.com/pool/universe/g/gcc-9/{cpp-9,gcc-9,libgcc-9-dev,g++-9,libstdc++-9-dev,gfortran-9}_9.5.0-3ubuntu1_arm64.deb)
noextract=(
	${source_x86_64[@]##*/}
	${source_aarch64[@]##*/})
sha256sums_x86_64=(
	adaa4b4c09679080dfe40e2ad95792e234eaa451f434cc7c62a719aabc02bf27
	ae0acbb23387c9520cc39b1d3c6d2e6eda1d20ffb61146159b33f611fe700566
	57c6f7b6fbcbb9c9ec346a5d632cab87f275d8552d0b640d9480df15b2a55e1a
	85d57788b14420b07ae3135bfd8925e25f03738be477173d5483d3da7417f0ef
	ae877c6c1b0a664a00cf9b5e66247e2546b2289070a47805d63e17b073355fc7
	dc01891f2d6a83bcac47747a8d73a7c641c3fa295875861a14e613e6332181d7)
sha256sums_aarch64=(
	913fac987229d6eae7387bb31bc5813d86efd8f6b0ea1bad5b731589df9ce08c
	c18a03d2b309199f8eb21730244b2a15e6580800d35e6c25354f28413c45b3e7
	d33b63abf92587e674bae3603db9e09542e3442a842cbb6b1d4bb28b50beef17
	6d1f73789c7f1e8a482ae52740d760e4c66859c2ba5a6feddbfa6a62099c963a
	d2dfc6f615661a58faace56cf33d7a50b5dd25f4ceb10cb5df535352441b0d83
	ba172ba744e237fefc94144e4949c82524922fca1ac29cc8ba47c5f64e59f066)
[ $_arch = arm64 ] && _pkgver=9.5.0-3ubuntu1
pkgver(){
	echo ${_pkgver/-/_}
}
_package(){
	for _i in $@;do bsdtar xfO ${_i}_${_pkgver}_$_arch.deb data.tar.*|bsdtar xf - `for _i in $(echo $@|tr \  '\n'|sed s,^,doc/,) lintian
		do echo --exclude=usr/share/$_i;done`;done
	mv usr/share/doc/gcc{-9-base,9}
	mv usr "$pkgdir"
}
package_gcc9-bin(){
	depends=(libisl)
	provides=(gcc9)
	conflicts=(gcc9)
	_package cpp-9 gcc-9 libgcc-9-dev
}
package_g++9-bin(){
	pkgdesc=${pkgdesc/C /C++ }
	depends=(gcc9-bin)
	_package g++-9 libstdc++-9-dev
}
package_gfortran9-bin(){
	pkgdesc='Fortran front-end for GCC (series 9.x)'
	depends=(gcc9-bin)
	conflicts=(gcc9-fortran)
	_package gfortran-9
}
