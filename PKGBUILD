# Maintainer: Stephen Martin <stephensrmmartin@gmail.com>
# Contributor: Jorge Barroso <jorge-barroso@users.noreply.github.com>

pkgname=vkbasalt-gui-git
_pkgname=vkbasalt-gui
pkgver=r17.cd91781
pkgrel=1
pkgdesc="A Qt-based GUI to more easily configure and use vkBasalt on your games"
arch=('x86_64')
url="https://github.com/jorge-barroso/vkBasalt-gui"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'vulkan-icd-loader')
makedepends=('cmake' 'ninja' 'git' 'imagemagick' 'qt5-tools')
optdepends=(
    'vkbasalt: Vulkan post-processing layer (required for functionality)'
)
conflicts=('vkbasalt-gui-git')
replaces=('vkbasalt-gui-git')
provides=('vkbasalt-gui')

source=(
    "${_pkgname}::git+${url}.git#branch=main"
    "qdebug.patch"
)
sha256sums=('SKIP'
            '61aed8dfd8c23f4e641c63a9817d426a08abffa372d46dca3c48472a2dd63b94')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # Patch the mainwindow.cpp
    patch -Np1 -i ${srcdir}/qdebug.patch
    
    # Create build directory
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake --build build --config Release
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    # Install the application
    DESTDIR="${pkgdir}" cmake --install build
    
    # Install desktop file (create one if not provided upstream)
    if [ ! -f "${_pkgname}.desktop" ]; then
        cat > "${_pkgname}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=VKBasalt GUI
Comment=A Qt-based GUI to configure vkBasalt
Exec=vkBasalt-gui
Icon=vkbasalt-gui
Terminal=false
Categories=Graphics;3DGraphics;Game;
EOF
    fi
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    
    # Install icon (create one if not provided upstream)
    if [ ! -d "icons" ]; then
        install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
        # Create a simple placeholder icon
        convert -size 256x256 xc:white "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" || true
    else
        install -Dm644 "icons/${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" 2>/dev/null || true
    fi
}

# vim: ts=2 sw=2 et:
