# Maintainer: VConet <v-conet@outlook.com>

_pkgname=u3logicanalyzer
pkgname=${_pkgname}-git
pkgver=0.2.0.0.r2.g41b2564
pkgrel=1
pkgdesc='Sigrok/PulseView based acquisition software for the WeAct Studio CH32H417 logic analyzer'
arch=('x86_64' 'aarch64')
url='https://github.com/WeActStudio/WeActStudio.U3LogicAnalyzer'
license=('GPL-3.0-or-later')
depends=(
    'boost-libs'
    'gcc-libs'
    'glib2'
    'glibmm'
    'hicolor-icon-theme'
    'hidapi'
    'libglvnd'
    'libserialport'
    'libsigc++'
    'libusb'
    'libzip'
    'python'
    'qt6-base'
    'qt6-svg'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'patchelf'
    'qt6-tools'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${pkgname}::git+${url}.git#branch=WeActStudio"
    'U3LogicAnalyzer.desktop'
    'U3LogicAnalyzer.metainfo.xml'
)
sha256sums=(
    'SKIP'
    '7354ea6c071850ff39dae5a78afa6886c405041ea2593e00c9abbc26e4d16197'
    '505293edf7a4051f75ce08bbfcc3b9fa462ed6ed8db99f14f63c37b3c927abe8'
)

pkgver() {
    cd "$pkgname"
    if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 |
            sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
    else
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"

    local _prefix="$srcdir/stage"
    local _cmake=(cmake -G Ninja -DCMAKE_BUILD_TYPE=None
                  -DCMAKE_INSTALL_PREFIX="$_prefix" -DDISABLE_WERROR=ON)

    # Step 1: libsigrok with the WeAct CH32H417 and fx2lafw drivers.
    "${_cmake[@]}" -S libsigrok -B build/libsigrok
    cmake --build build/libsigrok --parallel
    cmake --install build/libsigrok

    # Step 2: the C++ bindings; they are found through the pkg-config file
    # installed by the previous step.
    export PKG_CONFIG_PATH="$_prefix/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
    "${_cmake[@]}" -S libsigrok/bindings/cxx -B build/libsigrokcxx \
        -DCMAKE_PREFIX_PATH="$_prefix"
    cmake --build build/libsigrokcxx --parallel
    cmake --install build/libsigrokcxx

    # Step 3: libsigrokdecode (embeds the system Python).
    "${_cmake[@]}" -S libsigrokdecode -B build/libsigrokdecode
    cmake --build build/libsigrokdecode --parallel
    cmake --install build/libsigrokdecode

    # Step 4: the application itself.  Not installed: the binary is copied
    # into /opt in package() together with the libraries above.
    "${_cmake[@]}" -S pulseview -B build/pulseview \
        -DSTATIC_PKGDEPS_LIBS=OFF \
        -DENABLE_DECODE=ON \
        -DENABLE_FLOW=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_SIGNALS=OFF \
        -DQT_VERSION_MAJOR=6
    cmake --build build/pulseview --parallel
}

package() {
    cd "$pkgname"

    local _optdir="$pkgdir/opt/U3LogicAnalyzer"

    # Binary and its private sigrok libraries, side by side: the RUNPATH is
    # $ORIGIN.  patchelf drops the build-time prefix that CMake added.
    install -Dm755 build/pulseview/U3LogicAnalyzer "$_optdir/U3LogicAnalyzer"
    cp -a "$srcdir/stage/lib"/libsigrok.so* \
          "$srcdir/stage/lib"/libsigrokcxx.so* \
          "$srcdir/stage/lib"/libsigrokdecode.so* "$_optdir/"
    patchelf --set-rpath '$ORIGIN' "$_optdir/U3LogicAnalyzer"

    # Protocol decoders and the firmware the fx2lafw driver uploads; the
    # application points SIGROKDECODE_DIR/SIGROK_FIRMWARE_DIR at them.
    install -d "$_optdir/share"
    cp -a "$srcdir/stage/share/libsigrokdecode" "$_optdir/share/"
    cp -a "$srcdir/stage/share/sigrok-firmware" "$_optdir/share/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/U3LogicAnalyzer/U3LogicAnalyzer "$pkgdir/usr/bin/U3LogicAnalyzer"

    install -Dm644 "$srcdir/U3LogicAnalyzer.desktop" \
        "$pkgdir/usr/share/applications/U3LogicAnalyzer.desktop"
    install -Dm644 "$srcdir/U3LogicAnalyzer.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/U3LogicAnalyzer.metainfo.xml"
    install -Dm644 pulseview/icons/pulseview.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/U3LogicAnalyzer.png"
    install -Dm644 pulseview/icons/pulseview.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/U3LogicAnalyzer.svg"

    # 1a86:5537 (runtime), 1a86:fe17 (IAP), 1d50:608c/608d (fx2lafw).
    install -Dm644 99-weact-ch32h417.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-weact-ch32h417.rules"
    install -Dm644 99-fx2lafw.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-fx2lafw.rules"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
