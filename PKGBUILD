# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=xyce
pkgname="${_pkgname}-shylu"
pkgver=7.10.0
pkgrel=4
pkgdesc="Open-Source, SPICE-compatible, high-performance analog circuit simulator - ShyLU/OpenMP/Parallel support"
arch=("x86_64")
url="https://github.com/Xyce/xyce"
license=('GPL-3.0-or-later')
depends=(
    "openmpi"
    "fftw"
    "trilinos16"
    "glibc"
    "libstdc++"
    "libgcc"
    "libgomp"
    "libgfortran"
)
makedepends=(
    "git"
    "cmake"
    "make"
)
optdepends=(
    "adms: For compiling plugins using 'buildxyceplugin.sh'"
    "bash: For compiling plugins using 'buildxyceplugin.sh'"
    "python: For use with the Python-Xyce interface"
    "texlive-binextra: latexmk used to compile documentation"
)
provides=(
    'xyce'
)
conflicts=('xyce')
install=${_pkgname}.install
options=(!debug)

source=(
    "${pkgname}::git+${url}#tag=Release-${pkgver}"
    "0001-fix-Device-env-for-Latex.patch"
    "0002-multiple-plugin-fix.patch"
    "0003-fix-latex-doc-build.patch"
    "0004-synchronize-buildxyceplugin-autotools.patch"
    "0005-differential-noise-analysis.patch"
)

b2sums=('6e51120fd8ba481bfd4a226f0a208eefc4511b4e666235a8715f1fa41d28329ce5ad467708d5081a93af2599b94eb4639dd0271dc8f8ecc34242f5bfaba57dc5'
        'c909334855940362f0a015acd3090b57ea7ab6a9f043f32ded8cfc51a246f42eef810200430e2d5a76263a33d3f1a941855dc85dcdece81c938a9db6e3bd9ae8'
        '9651017d9f1548f27db0a73230a75aa404b3d2353cd229803056232cf9e3f985660553503cbf46de5435c129a40dac4ace38feb5e501ddb7c7f485edf2efea08'
        '5e34211b9e43acfe25bad80fd8a70c624f49cd9802fe70b30977a02a75f00799c443eea21494b488e9f0ca777211bce88e9b3a981b4d1f992f984768a2b35bda'
        'fe67b289cc4c2055ca8c0ce4f666d6b206e4105afb156a3579742be65acec951af30dcdb6d921e84eb11de03368e284e9a207574ad1e6e28653c754395fcd048'
        'e922743799763cdf91f48ef3dd14a266ab1ec3701e1654cd681a97bd4517c6882065d52528c4189abb1a301652125969e9d0e2f5803564765818c7db03f0acf0'
)

prepare() {
    cd "${pkgname}"

    # Latex fails to build on newer than 2025.11 version
    # Patch the one macro that fails
    # see upstream issue: https://github.com/Xyce/Xyce/issues/177
    patch -Np1 < "../0001-fix-Device-env-for-Latex.patch"

    # For multiple plugins (more than 2) we need to patch
    # see upstream issue: https://github.com/Xyce/Xyce/issues/148
    patch -Np1 < "../0002-multiple-plugin-fix.patch"

    # Fix latex build issues
    # see upstream issue: https://github.com/Xyce/Xyce/issues/159
    patch -Np1 < "../0003-fix-latex-doc-build.patch"

    # Synchronize the CMake based buildxyceplugin script to be more like
    # the Autotools variant
    # see upstream MR: https://github.com/Xyce/Xyce/pull/173/
    patch -Np1 < "../0004-synchronize-buildxyceplugin-autotools.patch"

    # Fix parsing issues when using differential noise analysis
    # see upstream issue: https://github.com/Xyce/Xyce/issues/174
    patch -Np1 < "../0005-differential-noise-analysis.patch"
}

build() {
    local xyce_options=(
        -D Trilinos_DIR="/usr/lib/trilinos16/cmake/Trilinos"
        -D Xyce_PLUGIN_SUPPORT=ON
        -D Xyce_AMESOS2_SHYLUBASKER=ON
        -D Xyce_PARALLEL_MPI=ON
    )

    local cmake_options=(
        -W no-dev
        -W no-cpp
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_POSITION_INDEPENDENT_CODE=ON
        -D CMAKE_INSTALL_PREFIX="/usr"
    )
    cmake \
        "${xyce_options[@]}"    \
        "${cmake_options[@]}"   \
        -B build                \
        -S "${pkgname}"

    cmake --build build

    # Build documentation (only if latexmk is available)
    if command -v latexmk &> /dev/null; then
        (
            cd "${srcdir}/${pkgname}/doc/Users_Guide/"
            make
        )

        (
            cd "${srcdir}/${pkgname}/doc/Reference_Guide/"
            make
        )
    else
        printf "\tlatexmk not installed => Skipping documentation\n"
    fi
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    # Remove 'admsXml' - Already have it from adms
    if [[ -e ${pkgdir}/usr/bin/admsXml ]]; then
        rm "${pkgdir}/usr/bin/admsXml"
    fi
    # Remove the /doc/ files
    rm -r "${pkgdir}/usr/doc"
    # Install the docs:
    (
        cd "${srcdir}/${pkgname}/doc"

        REFGUIDE="Reference_Guide/Xyce_RG.pdf"
        USERGUIDE="Users_Guide/Xyce_UG.pdf"
        # Reference Guide
        if [[ -e "${REFGUIDE}" ]]; then
            install -Dm0644 "${REFGUIDE}" "${pkgdir}/usr/share/doc/${pkgname}/Xyce_RG.pdf"
        fi

        # User guide
        if [[ -e "${USERGUIDE}" ]]; then
            install -Dm0644 "${USERGUIDE}" "${pkgdir}/usr/share/doc/${pkgname}/Xyce_UG.pdf"
        fi
    )
}

# vim: set ts=4 sw=4 et:
