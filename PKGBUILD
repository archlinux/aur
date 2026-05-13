# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
url="https://www.amd.com/en/developer/aocc.html"
_fetch_data=$(curl -sA 'Mozilla' "$url")

pkgname=aocc
_major=$(echo "$_fetch_data" | grep -oP 'aocc-\K\d+-\d+(?=-eula)' -- | head -1)
pkgver=$(echo "$_fetch_data" | grep -oP 'aocc-compiler-\K\d+\.\d+\.\d+' -- | head -1)
pkgrel=1
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
makedepends=('curl')
options=('staticlibs' '!strip' 'libtool')
optdepends=('env-modules')
source=(
    "https://download.amd.com/developer/eula/aocc/aocc-${_major}/aocc-compiler-${pkgver}.tar"
    "modulefile"
)
install=aocc.install
sha256sums=(
    "$(echo "$_fetch_data" | grep -oP '\w{64}(?=</td>)' | sed -n '1p')"
    '1740216760f755dc031d54f06c29333bca73f728d89a706f405b41e737bfc56f'
)
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
