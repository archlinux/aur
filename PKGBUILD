# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=aocc
_major=5-0
pkgver=5.0.0
pkgrel=4
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
_url="https://download.amd.com/developer/eula/aocc/aocc-${_major}/aocc-compiler-${pkgver}.tar"
url="https://www.amd.com/en/developer/aocc.html"
source=("$_url"
        "modulefile")
options=('staticlibs' '!strip' 'libtool')
optdepends=('env-modules')
install=aocc.install
_sha256sum=$(curl -A 'Mozilla' "$url" | grep --perl-regexp '\w{64}(?=\<\/td\>)' --only-matching | sed -n '1 p')
sha256sums=("$_sha256sum" "1740216760f755dc031d54f06c29333bca73f728d89a706f405b41e737bfc56f")
# NB: I should've made my checksum variable lambdas such that they will find all sums,
# even if AMD change their website, but if they remove the </td> tag from the end,
# this may fail. In which case, we can possible YOLO remove the lookahead.

# Default compiler flags
# This by default sets your flags to CFLAGS, but you may replace them.
_default_flags="$CFLAGS"

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
