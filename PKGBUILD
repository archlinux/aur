# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-compiler-${pkgver}.tar' required from upstream

pkgname=aocc
pkgver=2.3.0
pkgrel=1
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocc/"
source=("local://aocc-compiler-${pkgver}.tar" "local://modulefile")
options=('staticlibs' '!strip' 'libtool')
depends=('env-modules')
install=aocc.install
md5sums=("acb9a992c9bd6315612c5a9313ecc2fb" "SKIP")

# default flags for compiler
# edit this or /etc/makepkg.conf to your liking for default flags for your architecutre
# like e.g. "-O3 -march=znver2 -mtune=znver2"
_default_flags="${CFLAGS}"

_aocc_prefix=/opt/aocc

if [ -z ${MODULESHOME} ]; then
	echo "Environment variable MODULESHOME from env-modules is unset."
	echo "Restart your shell or source the env-modules scripts for your shell."
	exit 1
fi

package() {
	prefix=${pkgdir}${_aocc_prefix}
	mkdir -p ${prefix}

	# Cleanup
	rm ${srcdir}/${pkgname}-compiler-${pkgver}/install.sh
	# amdlibm seems to be an outdated version in aocc, use recent one from from aocl
	find ${srcdir}/${pkgname}-compiler-${pkgver}/lib/ -name "*amdlibm*" -delete

	cp -r ${srcdir}/${pkgname}-compiler-${pkgver}/* ${prefix}

	ln -s ${_aocc_prefix}/bin/clang   ${prefix}/bin/aocc-clang
	ln -s ${_aocc_prefix}/bin/clang++ ${prefix}/bin/aocc-clang++
	ln -s ${_aocc_prefix}/bin/flang   ${prefix}/bin/aocc-flang

	# Default flags the compilers should use
	# This only works together with calling the "aocc-" prefixed symlinks above
	# Verbose output should read "Configuration file: /opt/aocc/bin/aocc.cfg"
	echo "${_default_flags}" > ${prefix}/bin/aocc.cfg

	# modulefile
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${_aocc_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}
