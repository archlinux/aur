# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wx-tools
pkgname=wx-tools
pkgver=1.2.1
pkgrel=1
groups=()
pkgdesc="A Serial Port, UDP, TCP, and WebSocket Debugging Assistant Based on wxWidgets."
arch=($CARCH)
url="https://github.com/x-tools-author/wx-tools"
license=('LicenseRef-wxWindows')
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    at-spi2-core
    sh
    cairo
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libgcc
    libpng
    libstdc++
    libunwind
    libx11
    libxkbcommon
    pango
    pcre2
    wayland
    zlib
)
makedepends=(
    git
    cmake
    fontconfig
    freetype2
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
options=('!strip' '!debug')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f05e8effd84d7e3fd6a215baf27790ded56896bfa25243e938e22dd4bb926209')

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
        -Wno-author

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
    # DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
