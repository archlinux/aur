# Maintainer: Georgios Kourachanis < geo dot kourachanis at gmail dot com >

_target=aarch64-linux-gnu
_relver=4.9
_relshortdate=17.01
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
_gccver=4.9.4

pkgbase=${_target}-gcc49-linaro-bin
pkgver=${_reldate}
pkgrel=4
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('i686' 'x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
pkgname=("${_target}-gcc49-linaro-bin"
		 "${_target}-binutils-linaro-bin"
		 "${_target}-eglibc-linaro-bin"
		 "${_target}-gdb-linaro-bin")
options=(!emptydirs !strip staticlibs)
source_i686=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-i686_${_target}.tar.xz")
source_x86_64=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-x86_64_${_target}.tar.xz")
sha256sums_i686=('af32d7b71fd69f33c216a00f6c9e51c9d10b99b24194d0215f3951635dc49910')
sha256sums_x86_64=('d1f2761b697e6b49f5db1ec0cd48d2fd98224be8cb5ef182093f691e99c923eb')

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

package_aarch64-linux-gnu-gcc49-linaro-bin() {

	provides=("${_target}-gcc")
	conflicts=("${_target}-gcc")
	depends=("${_target}-binutils-linaro-bin=2.24_${_reldate}"
			 "${_target}-eglibc-linaro-bin=2.19_${_reldate}")
	pkgver="${_gccver}_${_reldate}"

	cd ${pkgdir}

	mkdir -p opt/$pkgbase/{${_target},bin,lib,libexec,share/man/man1}

	# 
	mv ${srcdir}/${_path}/${_target}/include opt/$pkgbase/${_target}/
	# 
	mv ${srcdir}/${_path}/${_target}/lib64 opt/$pkgbase/${_target}/
	# 
	for i in c++ cpp g++ gcc gcc-4.9.4 gcc-ar gcc-nm gcc-ranlib gcov gfortran; do
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
	ln -sf	${_target}-gcc{,-4.9.4}
}

package_aarch64-linux-gnu-eglibc-linaro-bin() {

	provides=("${_target}-glibc")
	conflicts=("${_target}-glibc")
	depends=("${_target}-gcc49-linaro-bin=${_gccver}_${_reldate}")
	pkgver="2.19_${_reldate}"
	pkgdesc="Embedded C Library ARM64 target"

	cd ${pkgdir}

	mkdir -p opt/$pkgbase/${_target}

	# 
	mv ${srcdir}/${_path}/${_target}/libc opt/$pkgbase/${_target}/
}

package_aarch64-linux-gnu-gdb-linaro-bin() {

	provides=("${_target}-gdb")
	conflicts=("${_target}-gdb")
	pkgver="7.10_${_reldate}"
	pkgdesc="The GNU Debugger for the ARM64 target"

	cd ${pkgdir}

	mkdir -p opt/$pkgbase/{bin,share/man/man1}

	# 
	mv ${srcdir}/${_path}/share/man/man1/${_target}-{gdb,gdbserver}.1 opt/$pkgbase/share/man/man1/
	# 
	mv ${srcdir}/${_path}/bin/{,"${_target}"-}gdbserver
	# 
	mv ${srcdir}/${_path}/bin/${_target}-{gdb,gdbserver} opt/$pkgbase/bin

	mkdir -p ${pkgdir}/usr/bin/
	cd ${pkgdir}/usr/bin/
	ln -sf	../../opt/$pkgbase/bin/* ./
}

package_aarch64-linux-gnu-binutils-linaro-bin() {

	provides=("${_target}-binutils")
	conflicts=("${_target}-binutils")
	pkgver="2.24_${_reldate}"
	pkgdesc="A set of programs to assemble and manipulate binary and object files for the ARM64 target"

	cd ${pkgdir}

	mkdir -p opt/$pkgbase/{${_target}/lib,bin,share/man/man1}

	for i in addr2line ar as c++filt elfedit gprof ld nm objcopy objdump ranlib readelf size strings strip; do
		# 
		mv ${srcdir}/${_path}/share/man/man1/${_target}-${i}.1 opt/$pkgbase/share/man/man1/
		# 
		mv ${srcdir}/${_path}/bin/${_target}-${i}* opt/$pkgbase/bin/
	done
	# 
	mv ${srcdir}/${_path}/${_target}/bin opt/$pkgbase/${_target}/
	# 
	mv ${srcdir}/${_path}/${_target}/lib/ldscripts opt/$pkgbase/${_target}/lib/

	mkdir -p ${pkgdir}/usr/bin/
	cd ${pkgdir}/usr/bin/
	ln -sf	../../opt/$pkgbase/bin/* ./
	ln -sf	${_target}-ld{,.bfd}
}
