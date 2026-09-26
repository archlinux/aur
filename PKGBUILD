# Maintainer: Tuncay <redbulltrinker@googlemail.com>
pkgname=3dco-plus-git
_pkgname="${pkgname%-git}"
pkgver=v1.4.1.r0.g30b5086
pkgrel=1
pkgdesc="An enhanced, AI-assisted fork of 3D Controller Overlay."
arch=('any')
url="https://github.com/Khyretos/3dco-plus"
license=('MIT')
makedepends=('git' 'base-devel' 'cmake' 'pkgconf' 'glfw' 'sdl3' 'assimp' 'spdlog' 'fmt'
    'nlohmann-json' 'freetype2')
provides=('3dco+')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    mkdir build
    cd build
    cmake ..
    make -j"$(nproc)"
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "build/3dco+" -t "${pkgdir}/usr/bin"
    install -Dm 644 "assets/icon.png" -T "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    cat >"${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Comment=3D Controller Overlay +
Name=3dco+
Exec=/usr/bin/3dco+
Icon=/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
Terminal=false
Categories=Game;
StartupNotify=true
EOF
    install -Dm 644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
