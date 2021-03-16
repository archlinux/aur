# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-compiler-${pkgver}.tar' required from upstream

pkgname=aocc
pkgver=3.0.0
pkgrel=2
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocc/"
source=("local://aocc-compiler-${pkgver}.tar" "local://modulefile")
options=('staticlibs' '!strip' 'libtool')
optdepends=('env-modules')
install=aocc.install
md5sums=("e670c7f8abe5a96b7b1d770f5a8e160a" "SKIP")

# default flags for compiler
# edit this or /etc/makepkg.conf to your liking for default flags for your architecutre
# like e.g. "-O3 -march=znver2 -mtune=znver2"
_default_flags="${CFLAGS}"

# path hardcoded in aocc.install. if you change this, change paths there as well
_aocc_prefix=/opt/aocc

package() {
	prefix=${pkgdir}${_aocc_prefix}
	mkdir -p ${prefix}

	cp -rp ${srcdir}/${pkgname}-compiler-${pkgver}/* ${prefix}

	ln -s ${_aocc_prefix}/bin/clang   ${prefix}/bin/aocc-clang
	ln -s ${_aocc_prefix}/bin/clang++ ${prefix}/bin/aocc-clang++
	ln -s ${_aocc_prefix}/bin/flang   ${prefix}/bin/aocc-flang

	# Default flags the compilers should use
	# This only works together with calling the "aocc-" prefixed symlinks above
	# Verbose output should read "Configuration file: /opt/aocc/bin/aocc.cfg"
	echo "${_default_flags}" > ${prefix}/bin/aocc.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${_aocc_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}
