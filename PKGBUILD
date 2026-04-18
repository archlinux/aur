# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: Alexis Maiquez <aur@almamu.com>
pkgname=niri-wallpaperengine-git
_pkgname=linux-wallpaperengine
pkgver=r601.be77336
pkgrel=1
pkgdesc="Wallpaper Engine backgrounds for Linux! Using background layer, compatible with niri blur."
arch=('x86_64')
url="https://github.com/Almamu/linux-wallpaperengine"
license=('GPL-3.0-only')
depends=('lz4' 'ffmpeg' 'mpv' 'glfw' 'glew' 'libpulse' 'libcups' 'at-spi2-core' 'nss' 'libxcomposite' 'libxdamage' 'nspr' 'wayland')
makedepends=('git' 'cmake' 'sdl2' 'glm' 'wayland-protocols' 'xorg-xrandr')
provides=("linux-wallpaperengine")
conflicts=("linux-wallpaperengine" "linux-wallpaperengine-git")
source=(
    "${_pkgname}::git+https://github.com/Almamu/linux-wallpaperengine.git#branch=main"
    "background.patch"
)
sha512sums=('SKIP'
            'e6ec156ad851877d6212641a56790bb96f12fd9d13816b0dbc6d3b826bf5ce36277c0afa9a80b14f34eedfe345896b9fab03b066c81e6d22fb6aa92a1ce222b2')

pkgver() {
    cd "$_pkgname"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

prepare() {
    cd "$_pkgname"
    patch -d "${srcdir}/${_pkgname}" -Np1 -i "${srcdir}/background.patch"
    git submodule update --init --recursive
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX="/opt/${_pkgname}" \
        -Wno-dev \
        -DCMAKE_CXX_FLAGS="-ffat-lto-objects -Wno-builtin-macro-redefined" \
        -DCMAKE_C_FLAGS="-Wno-builtin-macro-redefined"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # create forwarding script
    install -d -m755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/bash
export LD_LIBRARY_PATH="/opt/${_pkgname}/lib:\$LD_LIBRARY_PATH"
cd /opt/${_pkgname}; exec ./${_pkgname} "\$@"
EOF
    chmod +x ${pkgdir}/usr/bin/${_pkgname}
    chmod +x ${pkgdir}/opt/${_pkgname}/linux-wallpaperengine
}
