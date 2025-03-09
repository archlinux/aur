# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wx-tools
pkgname=wx-tools
pkgver=1.0.0
pkgrel=2
groups=()
pkgdesc="wxTools: A Serial Port, UDP, TCP, and WebSocket Debugging Assistant Based on wxWidgets.
"
arch=($CARCH)
url="https://github.com/x-tools-author/wx-tools"
license=('LicenseRef-wxWindows')
provides=(${pkgname} wx-tools)
conflicts=(${pkgname} wx-tools)
depends=(
    cairo
    sh
    gcc-libs
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    gspell
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
    wxwidgets-gtk3
    pkgconf
)
checkdepends=(
    gtest
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e048c7636c0f264aea506c9f9b81229d28ed44771c8c7ce43ea6aa91016efd2')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}-${pkgver}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/assets/wxTools"
    install -Dm0755 wxTools -t "${pkgdir}/usr/share/${pkgname}/"
    cp -r {files,i18n} "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/wxTools.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.x-tools-author.wx-tools.svg"

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
