# Maintainer: Martin Kraner < martin dot kraner at dewesoft dot com >

_target=aarch64-linux-gnu
_relver=7.5
_relshortdate=19.12
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
_gccver=7.5.0

pkgbase=${_target}-gcc75-linaro-bin
pkgver=${_reldate}
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('i686' 'x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
pkgname=("${_target}-gcc75-linaro-bin")
options=(!emptydirs !strip staticlibs)
source_i686=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-i686_${_target}.tar.xz")
source_x86_64=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-x86_64_${_target}.tar.xz")
sha256sums_i686=('20e85bffc8332d668cae887cfe73ee6983fe878a813f5b6f49a4f5e4e7ce2c80')
sha256sums_x86_64=('3b6465fb91564b54bbdf9578b4cc3aa198dd363f7a43820eab06ea2932c8e0bf')

_path="gcc-linaro-${_gccver}-${_reldate}-x86_64_${_target}"

prepare() {
	cd ${srcdir}/${_path}

	rm -f 	*-manifest.txt
	rm -f 	bin/runtest
	rm -f 	lib/lib*
	rm -f 	${_target}/libc/lib/{libsupc++.a,libgcc_s.so{,.1},libstdc++.{a,so{,.6,.6.0.20{,-gdb.py}}}}
	rm -f 	${_target}/{lib64,libc/lib}/{libatomic.{a,so{,.1,.1.1.0}},libgfortran.{a,so{,.3,.3.0.0},spec},libgomp.{a,so{,.1,.1.0.0},spec},libitm.{a,so{,.1,.1.0.0},spec},libssp{_nonshared.a,.{a,so{,.0,.0.0.0}}}}
	rm -rf 	${_target}/{lib64,libc/lib}/debug
	rm -rf 	include
	rm -rf 	share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	share/man/{man1/{$_target-{dlltool,nlmconv,windmc,windres}.1,runtest.1},man5,man7}

	cd ${_target}/bin/
	for i in *; do
		ln -sf ../../bin/${_target}-${i} ${i}
	done
}

package_aarch64-linux-gnu-gcc75-linaro-bin() {

	provides=("${_target}-gcc")
	conflicts=("${_target}-gcc")
#	depends=("${_target}-binutils224-linaro-bin=${_reldate}"
#			 "${_target}-eglibc219-linaro-bin=${_reldate}")
# 	pkgver="${_gccver}_${_reldate}"

	cd ${pkgdir}

	mkdir -p opt/$pkgbase/{${_target},bin,lib,libexec,share/man/man1}

	# 
	mv ${srcdir}/${_path}/${_target}/include opt/$pkgbase/${_target}/
	# 
	mv ${srcdir}/${_path}/${_target}/lib64 opt/$pkgbase/${_target}/
	# 
	for i in c++ cpp g++ gcc gcc-7.5.0 gcc-ar gcc-nm gcc-ranlib gcov gfortran; do
		mv ${srcdir}/${_path}/bin/${_target}-${i} opt/$pkgbase/bin/
	done
	# 
	mv ${srcdir}/${_path}/lib/gcc opt/$pkgbase/lib/
	# 
	mv ${srcdir}/${_path}/libexec/gcc opt/$pkgbase/libexec/

	cd ${pkgdir}/opt/$pkgbase/share/man/man1/
	# 
	for i in cpp g++ gcc gcov gfortran; do
		mv ${srcdir}/${_path}/share/man/man1/${_target}-${i}.1 ./
	done
	# 
	ln -sf	${_target}-{c++,g++}.1

	mkdir -p ${pkgdir}/usr/bin/
	cd ${pkgdir}/usr/bin/
	ln -sf	../../opt/$pkgbase/bin/* ./
	ln -sf	${_target}-{c++,g++}
	ln -sf	${_target}-gcc{,-7.5.0}
}
