# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Contributor: Jesse R Codling <codling@umich.edu>

url="https://www.amd.com/en/developer/aocl.html"
_major=5-2
pkgver=5.2.0

_fetch_data=$(curl -sA "Mozilla" "${url}") && {
    pkgver=$(echo "${_fetch_data}" | grep -oP 'aocl-linux-aocc-\K[\d.]+(?=\.tar\.gz)' | head -1)
    _major=$(echo "${_fetch_data}" | grep -oP 'aocl-\K\d+-\d+(?=-eula)' | head -1)
}

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
_url_aocc="https://download.amd.com/developer/eula/aocl/aocl-${_major}/aocl-linux-aocc-${pkgver:?}.tar.gz"
_url_gcc="https://download.amd.com/developer/eula/aocl/aocl-${_major}/aocl-linux-gcc-${pkgver:?}.tar.gz"
source=(
    "${_url_aocc}"
    "${_url_gcc}"
    "${pkgbase}-aocc.install"
    "${pkgbase}-gcc.install"
    "modulefile"
)
options=('staticlibs' '!strip')
makedepends=('curl' 'patchelf')
optdepends=('environment-modules')
_sha256sum1=$(echo "${_fetch_data}" | grep --perl-regexp '\w{64}(?=\<\/td\>)' --only-matching | sed -n '1 p')
_sha256sum2=$(echo "${_fetch_data}" | grep --perl-regexp '\w{64}(?=\<\/td\>)' --only-matching | sed -n '4 p')
sha256sums=("${_sha256sum1}"
            "${_sha256sum2}"
            '4f58524e1948b2cb470b856546b87656b2fbce0b98b0d43d345fcedb101f1295'
            'fe5245a7b34253a67105ee5e6bb868bbb69ebf318af32dc81e1cdd7d7277b639'
            'bbf75a4d30aa4f8c4eb46d3c6193c011c43683352266fa56314f16212e409965')
# NB: I should've made my checksum variable lambdas such that they will find all
# sums, even if AMD change their website, but if they remove the `</td>` tag from
# the table (perhaps on some other browser environments this may happen) this may
# fail. In which case, we can possibly replace the lookahead. Alternatively, if
# all methods fail, use `updpkgsums`, or manual `sha256sum` and compare to
# upstream manually for safety.

# Helper functions
_install_aocl_variant() {
    local _variant=${1}
    local aocl_prefix=/opt/aocl
    local prefix=${pkgdir}${aocl_prefix}
    mkdir -p ${prefix:?}

    cd ${srcdir}/${pkgbase}-linux-${_variant}-${pkgver:?}
    ./install.sh -t ${prefix:?} -i lp64

    # strip unneeded directories
    mv ${prefix:?}/${pkgver:?}/* ${prefix:?}
    rm -r ${prefix:?}/${pkgver:?}
}

_patch_and_fix_aocl() {
    local _variant=${1}
    local aocl_prefix=/opt/aocl
    local prefix=${pkgdir}${aocl_prefix}

    # add missing libFLAME dependency on BLIS and AOCL-Utils
    for _group in MT ST; do
        patchelf --add-needed ${aocl_prefix}/${_variant}/${_group}/lib_ILP64/libblis-mt.so ${prefix:?}/${_variant}/${_group}/lib_ILP64/libflame.so
        patchelf --add-needed ${aocl_prefix}/${_variant}/${_group}/lib_ILP64/libaoclutils.so ${prefix:?}/${_variant}/${_group}/lib_ILP64/libflame.so
        patchelf --add-needed ${aocl_prefix}/${_variant}/${_group}/lib_LP64/libblis-mt.so ${prefix:?}/${_variant}/${_group}/lib_LP64/libflame.so
        patchelf --add-needed ${aocl_prefix}/${_variant}/${_group}/lib_LP64/libaoclutils.so ${prefix:?}/${_variant}/${_group}/lib_LP64/libflame.so

        # fix amd-libs.cfg, pkgconfig, and cmake files containing ${pkgdir}
        find ${prefix:?}/${_variant}/${_group} \( -name 'amd-libs.cfg' -o -name '*.pc' -o -name '*.cmake' -o -name '*_module' \) -exec sed -e "s:/.*/opt:/opt:g" -s -i {} \;

        # fix provided shell and module files to match ${aocl_prefix}
        sed -e "s:aocl/${pkgver:?}:aocl:g" -s -i ${prefix:?}/${_variant}/${_group}/*_module ${prefix:?}/${_variant}/${_group}/amd-libs.cfg
    done
}

_setup_modulefile() {
    local _variant=${1}
    local aocl_prefix=/opt/aocl
    local prefix=${pkgdir}${aocl_prefix}

    cp ${srcdir}/modulefile ${prefix:?}/${_variant}

    # Extra sed commands for gcc variant
    if [[ "${_variant}" == "gcc" ]]; then
        sed -e "s/aocc/gcc/g" \
            -e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
            -i ${prefix:?}/${_variant}/modulefile
    fi

    mkdir -p ${pkgdir}/etc/modules/modulefiles
    ln -s ${aocl_prefix}/${_variant}/modulefile ${pkgdir}/etc/modules/modulefiles/aocl-${_variant}
}

package_aocl-aocc() {
    install=${pkgname}.install
    _install_aocl_variant aocc
    _patch_and_fix_aocl aocc
    _setup_modulefile aocc
}

package_aocl-gcc() {
    install=${pkgname}.install
    _install_aocl_variant gcc
    _patch_and_fix_aocl gcc
    _setup_modulefile gcc
}

# vim:set ts=4
