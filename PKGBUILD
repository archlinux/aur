# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=xyce-serial-bin
_xyce_ver=7.10.0
_pkg_date=261004
pkgver="${_xyce_ver}r${_pkg_date}"
pkgrel=2
pkgdesc="Open-source, SPICE-compatible, high-performance analog circuit simulator"
arch=(x86_64)
url='https://github.com/Xyce/Xyce'
license=('GPL-3.0-or-later')
options=(!debug)

conflicts=(
    'xyce-shylu'
    'xyce-serial'
)

makedepends=(
    'git'
    'tar'
)

depends=(
    'blas-openblas'
    'fftw'
    'suitesparse'
)

optdepends=(
    # ADMS is no-longer activly maintained
    # For 'too many arguments to function verilogaparse' build error, check https://github.com/Qucs/ADMS/issues/115
    'adms: Convert Verilog-A models to C++ for Xyce'
)

checkdepends=(
    'bc'
    'perl'
    'python-numpy'
    'python-scipy'
)

source=(
    "xyce_${_xyce_ver}-${_pkg_date}.tar.zst::https://github.com/ResRipper/Xyce-Builder/releases/download/Xyce-${_xyce_ver}-${_pkg_date}/xyce_serial-${_xyce_ver}.tar.zst"
    "Xyce_Regression::git+https://github.com/Xyce/Xyce_Regression#tag=Release-${_xyce_ver}"
    "excluded_tests"
)
b2sums=(
    '72b927c7f3ad9a00d8685257f8276a1519fc7265d506c08e85c62787afa30db1bb1611352a1187c855338c713d0238652a29490b62f2716785eb321f3d16e55d'
    '838107646009e48622e8ca9473024b3aba657c54dc07dccf98d5d9c304909afd3ca4c8544f71a3e1f9a0dff2b7894e8c2dec2b6f72f21c0706b0b9e413692a40'
    '92920019f18fe8995110a9c97e681e9e5b16a7c1219eda88389b13af9d9be65ed206ca57aa5fa877a778cd42e79b5d61a3e753c26eea16cb2dbd5dcb627ca701'
)

prepare() {
    # Already provided by ADMS
    rm "${srcdir}/usr/bin/admsXml"
}

check() {
    cd "${srcdir}/usr"

    # Clean-up
    rm -rf "${srcdir}/test_output"
    rm -f "${srcdir}/test_results"
    
    mkdir -p "${srcdir}/test_output"

    cd "${srcdir}/Xyce_Regression"
    # Patch for Numpy 2.x
    git cherry-pick -n -m 1 a77e39e409d3ab2ae05d6dcbf08d9e42e3fd0f15

    eval "$(${srcdir}/Xyce_Regression/TestScripts/suggestXyceTagList.sh ${srcdir}/usr/bin/Xyce)"

    "${srcdir}"/Xyce_Regression/TestScripts/run_xyce_regression \
    --output="${srcdir}/test_output" \
    --xyce_test="${srcdir}/Xyce_Regression" \
    --resultfile="${srcdir}"/test_results \
    --taglist="${TAGLIST}" \
    --excludelist="${srcdir}/excluded_tests" \
    "${srcdir}/usr/bin/Xyce"
}

package() {
    cp -r "${srcdir}/usr" "${pkgdir}"
}