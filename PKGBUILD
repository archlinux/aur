# Maintainer: mileswithtails_ <gabmaykin@bk.ru>
pkgname=chaotixrecompiled-git
pkgver=0.15.1.r184.g1d4e22c
pkgrel=1
pkgdesc="Static recompilation of Knuckles' Chaotix (32X) with an SDL3 frontend (interpreter build; ROM required at first launch)"
arch=('x86_64' 'aarch64')
url="https://github.com/YuutaTsubasa/ChaotixRecompiled"
license=('MIT')
depends=('gcc-libs' 'glibc' 'sdl3' 'sdl3_ttf')
makedepends=('git' 'cmake' 'ninja')
optdepends=(
    'vulkan-icd-loader: Vulkan renderer'
    'mesa: OpenGL/Vulkan drivers for AMD/Intel GPUs'
    'nvidia-utils: Vulkan/OpenGL drivers for NVIDIA GPUs'
)
provides=('chaotixrecompiled')
conflicts=('chaotixrecompiled')
options=('!lto')
source=("$pkgname::git+https://github.com/YuutaTsubasa/ChaotixRecompiled.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local ver
    ver=$(sed -n 's/^project(ChaotixRecompiled VERSION \([0-9][0-9.]*\).*/\1/p' CMakeLists.txt | head -n1)
    printf '%s.r%s.g%s' "$ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCHAOTIX_BUILD_FRONTEND=ON \
        -DCHAOTIX_BUILD_TESTS=OFF \
        -DCHAOTIX_BUILD_TOOLS=OFF
    cmake --build build
}

package() {
    install -Dm755 build/ChaotixRecompiled "$pkgdir/usr/bin/chaotixrecompiled"

    install -Dm644 "$pkgname/assets/icon/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/chaotixrecompiled.png"

    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/chaotixrecompiled.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Knuckles' Chaotix Recompiled
GenericName=32X Platform Game
Comment=Static recompilation of Knuckles' Chaotix (requires your own ROM)
Exec=env SDL_RENDER_DRIVER=vulkan,gpu,opengl chaotixrecompiled %f
TryExec=chaotixrecompiled
Icon=chaotixrecompiled
Terminal=false
Categories=Game;ArcadeGame;
Keywords=sonic;knuckles;chaotix;sega;32x;megadrive;genesis;
StartupNotify=true
EOF
}
