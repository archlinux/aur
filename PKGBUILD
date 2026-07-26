pkgname=ultralightwebcursor-git
_pkgname=UltralightWeb_Cursor
pkgver=1.0.1
pkgrel=1
pkgdesc="HTML/CSS/JS-based global animated cursor framework integrated with KDE 6 System Settings and KWin Effects"
arch=('x86_64')
url="https://github.com/LuYishan-4/Animated_UltralightWeb_Cursor"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'kcmutils'
    'kcoreaddons'
    'kconfig'
    'kconfigwidgets'
    'ki18n'
    'kauth'
    'kwin'
)
makedepends=('git' 'cmake' 'extra-cmake-modules' 'p7zip')
provides=("ultralightwebcursor" "kcm-ultralightwebcursor")
conflicts=("ultralightwebcursor" "kcm-ultralightwebcursor")

install=ultralightwebcursor.install
source=("git+https://github.com/LuYishan-4/Animated_UltralightWeb_Cursor")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (set -o pipefail; git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # 1. Handle Ultralight SDK archive decompression with strict directory enforcement
    echo "==> Verifying Ultralight SDK directory alignment..."
    local sdk_target="sdk/ultralight-free-sdk-1.4.0-linux-x64"

    if [ ! -f "${sdk_target}/include/AppCore/App.h" ]; then
        echo "==> Target SDK headers not found. Re-extracting cleanly..."
        rm -rf "${sdk_target}"

        cd sdk
        7z x ultralight-free-sdk-1.4.0-linux-x64.7z
        cd ..

        if [ -d "sdk/include" ] && [ -f "sdk/include/AppCore/App.h" ]; then
            echo "==> SDK extracted flatly into sdk/. Re-structuring into target directory layout..."
            mkdir -p "${sdk_target}"
            mv sdk/bin sdk/include sdk/layers "${sdk_target}/" 2>/dev/null || true
        fi

        if [ -d "${sdk_target}/ultralight-free-sdk-1.4.0-linux-x64" ]; then
            echo "==> Squashing nested double SDK directories..."
            mv "${sdk_target}/ultralight-free-sdk-1.4.0-linux-x64" sdk/tmp_sdk
            rm -rf "${sdk_target}"
            mv sdk/tmp_sdk "${sdk_target}"
        fi
    fi

    if [ ! -f "${sdk_target}/include/AppCore/App.h" ]; then
        echo "==> ERROR: SDK extraction layout is still invalid."
        exit 1
    fi
    echo "==> Generating compliant policy placeholder in source tree..."
    cat <<EOF > GUI/org.ultralightwebcursor.policy
<?xml version="1.0" encoding="utf-8"?>
<policyconfig>
</policyconfig>
EOF

}

build() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p build/GUI
    touch build/GUI/org.ultralightwebcursor.policy

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev


    touch build/GUI/org.ultralightwebcursor.policy

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"

    DESTDIR="${pkgdir}" cmake --install build

    # KAuth Security Compliance:
    if [ -f "${pkgdir}/usr/lib/kf6/kauth/ultralightwebcursor_helper" ]; then
        chown root:root "${pkgdir}/usr/lib/kf6/kauth/ultralightwebcursor_helper"
        chmod 4755 "${pkgdir}/usr/lib/kf6/kauth/ultralightwebcursor_helper"
    fi
}
