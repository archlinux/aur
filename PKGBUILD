# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wx-tools
pkgname=wx-tools
pkgver=1.2.0
pkgrel=5
groups=()
pkgdesc="wxTools: A Serial Port, UDP, TCP, and WebSocket Debugging Assistant Based on wxWidgets."
arch=($CARCH)
url="https://github.com/x-tools-author/wx-tools"
license=('LicenseRef-wxWindows')
provides=(${pkgname} wx-tools)
conflicts=(${pkgname} wx-tools)
depends=(
    sh
    cairo
    gcc-libs
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libpng
    libunwind
    libx11
    libxkbcommon
    pango
    pcre2
)
makedepends=(
    git
    cmake
    libiconv
    libnotify
    libmspack
    libsoup3
    libzip
    sdl_sound
    sdl2-compat
    ninja
    webkit2gtk-4.1
    pkgconf
)
checkdepends=(
    gtest
)
optdepends=()
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('cf94549cb900141af275b148fc31458d8e6974b762a86a140a11eca6b6a53176')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWXT_GENERATE_MSIX:BOOL=OFF \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -dm0755 "${pkgdir}/usr/share/${pkgname}/"
    cp -R build/assets/wxTools/* "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "wxTools.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.x-tools-author.wx-tools.svg"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash

exec /usr/share/wx-tools/wxTools "\$@"

EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.x-tools-author.wx-tools.desktop <<EOF
[Desktop Entry]
Name=${pkgname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=io.github.x-tools-author.wx-tools
Categories=Development;
Terminal=false
Type=Application
EOF
    #     DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
