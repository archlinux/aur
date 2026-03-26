# Maintainer: taotieren <admin@taotieren.com>

pkgname=qsoc-git
pkgver=r772.2eb7c33
pkgrel=3
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
    $_qt-base
    yaml-cpp
    # AUR
    gpds
    qschematic
    replxx
    sv-lang
    systemrdl-toolkit
)
makedepends=(
    antlr4-runtime
    cmake
    boost
    ninja
    git
    fmt
    $_qt-5compat
    $_qt-svg
    $_qt-tools
    pkgconf
    inja
    nlohmann-json
    sqlite
    vulkan-headers
    # AUR
    rapidcsv
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
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

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
    mkdir -p "${srcdir}/pkgconfig"
    
    cat > "${srcdir}/pkgconfig/rapidcsv.pc" << 'EOF'
prefix=/usr
exec_prefix=${prefix}
includedir=${prefix}/include

Name: rapidcsv
Description: C++ CSV parser library
Version: 8.92
Cflags: -I${includedir}
EOF
    
    cat > "${srcdir}/pkgconfig/replxx.pc" << 'EOF'
prefix=/usr
exec_prefix=${prefix}
includedir=${prefix}/include
libdir=${prefix}/lib

Name: replxx
Description: A readline and libedit replacement
Version: 0.0.4
Cflags: -I${includedir}
Libs: -L${libdir} -lreplxx
EOF
    
    cat > "${srcdir}/pkgconfig/antlr4-runtime.pc" << 'EOF'
prefix=/usr
exec_prefix=${prefix}
includedir=${prefix}/include
libdir=${prefix}/lib

Name: antlr4-runtime
Description: ANTLR 4 C++ runtime library
Version: 4.13.0
Cflags: -I${includedir} -I${includedir}/antlr4-runtime
Libs: -L${libdir} -lantlr4-runtime
EOF
}

build() {
    cd "${srcdir}/${pkgname}"

    export PKG_CONFIG_PATH="${srcdir}/pkgconfig:${PKG_CONFIG_PATH}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D ENABLE_UNIT_TEST=OFF \
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
