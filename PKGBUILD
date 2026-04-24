# Maintainer: taotieren <admin@taotieren.com>

pkgname=qsoc-git
pkgver=1.0.5.r40.g5a6f631
pkgrel=1
epoch=
pkgdesc="QSoC - Quick System on Chip Studio"
arch=($CARCH)
url="https://github.com/vowstar/qsoc"
license=('Apache-2.0')
_qt=qt6
groups=()
depends=(
    glibc
    libgcc
    libstdc++
    hicolor-icon-theme
    $_qt-base
)
makedepends=(
    cmake
    cppcheck
    boost
    ninja
    git
    $_qt-5compat
    $_qt-svg
    $_qt-tools
    pkgconf
    sqlite
    vulkan-headers
)
optdepends=(
    
)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!makeflags')
install=
changelog=
source=(
    "${pkgname}::git+${url}.git"
    "slang::git+https://github.com/MikePopoloski/slang.git"
    "json::git+https://github.com/nlohmann/json.git"
    "yaml::git+https://github.com/jbeder/yaml-cpp.git"
    "gpds::git+https://github.com/simulton/gpds.git"
    "csv::git+https://github.com/d99kris/rapidcsv.git"
    "inja::git+https://github.com/pantor/inja.git"
    "antlr4::git+https://github.com/antlr/antlr4.git"
    "systemrdl::git+https://github.com/vowstar/systemrdl-toolkit.git"
    "fmt::git+https://github.com/fmtlib/fmt.git"
    "replxx::git+https://github.com/AmokHuginnsson/replxx.git"
    "libssh2::git+https://github.com/libssh2/libssh2.git"
    "mbedtls::git+https://github.com/Mbed-TLS/mbedtls.git"
    "framework::git+https://github.com/Mbed-TLS/mbedtls-framework.git"
    "tf-psa-crypto::git+https://github.com/Mbed-TLS/TF-PSA-Crypto.git"
    "mldsa-native::git+https://github.com/Mbed-TLS/mldsa-native.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
validpgpkeys=()
noextract=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( 
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx

    cd "${srcdir}/${pkgname}/"
    git submodule init
    git config submodule.external/slang.url "$srcdir/slang"
    git config submodule.external/json.url "$srcdir/json"
    git config submodule.external/yaml.url "$srcdir/yaml"
    git config submodule.external/gpds.url "$srcdir/gpds"
    git config submodule.external/csv.url "$srcdir/csv"
    git config submodule.external/inja.url "$srcdir/inja"
    git config submodule.external/antlr4.url "$srcdir/antlr4"
    git config submodule.external/mbedtls.url "$srcdir/systemrdl"
    git config submodule.external/fmt.url "$srcdir/fmt"
    git config submodule.external/replxx.url "$srcdir/replxx"
    git config submodule.external/libssh2.url "$srcdir/libssh2"
    git config submodule.external/mbedtls.url "$srcdir/mbedtls"
    git -c protocol.file.allow=always submodule update

    cd "${srcdir}/${pkgname}/external/mbedtls"
    git submodule init
    git config submodule.framework.url "$srcdir/framework"
    git config submodule.tf-psa-crypto.url "$srcdir/tf-psa-crypto"
    git -c protocol.file.allow=always submodule update

    # cd "${srcdir}/${pkgname}/external/mbedtls/tf-psa-crypto"
    # git submodule init
    # git config submodule.framework.url "$srcdir/framework"
    # git config submodule.mldsa-native.url "$srcdir/mldsa-native"
    # git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D ENABLE_UNIT_TEST=OFF \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-deprecated-declarations \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 resource/icon/light/scalable/applications-soc.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg

    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Name=${pkgdesc}
Comment=${pkgdesc}
Exec=${pkgname} gui
Terminal=false
Type=Application
StartupNotify=true
Categories=Electronics;Engineering;Science;
Icon=${pkgname}
EOF
}
