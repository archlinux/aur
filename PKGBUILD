# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=r6121.39e62ae9
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL3)
depends=(
    sdl2
    qt6-base
    libxrandr
    libglvnd
    libx11
    libdrm
    dbus
    curl
    mesa
    hicolor-icon-theme)
makedepends=(
    git
    cmake
    extra-cmake-modules
    qt6-tools
    qt6-wayland
    libdrm
    libpulse
    alsa-lib
    sndio
    ninja
    jack)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'sndio: Small audio support'
    'alsa-lib: ALSA support'
    'jack: JACK support'
)
provides=('duckstation')
conflicts=('duckstation')
source=(git+"$url".git
    duckstation-qt.desktop
    duckstation-qt.sh)
sha256sums=('SKIP'
            'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
            'fdfc77b028faa8be25ea66c8f47c41750ba6eb98f41a4802b44398fc5994b86a')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S duckstation \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security" \
        -DBUILD_NOGUI_FRONTEND=OFF \
        -DBUILD_QT_FRONTEND=ON \
        -DUSE_DRMKMS=ON \
        -DUSE_EGL=ON \
        -DUSE_SDL2=ON \
        -DUSE_WAYLAND=ON \
        -DUSE_X11=ON \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -G Ninja \
        -Wno-dev
    ninja -C build
}

package() {
    install -m755 -d "$pkgdir/opt"
    cp -drv --no-preserve='ownership' build/bin "$pkgdir/opt/$_pkgname"

    install -Dvm755 "$srcdir/duckstation-qt.sh" "$pkgdir/usr/bin/duckstation-qt"
    install -Dvm644 "$srcdir/duckstation-qt.desktop" "$pkgdir/usr/share/applications/duckstation-qt.desktop" 
    install -Dm644 "$_pkgname/data/resources/images/duck.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}
