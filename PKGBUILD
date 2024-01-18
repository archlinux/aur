# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=r6799.572ea80e
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL-3.0-only)
depends=(
    sh
    glibc
    gcc-libs
    sdl2
    qt6-base
    libxrandr
    libglvnd
    libx11
    dbus
    curl
    hicolor-icon-theme)
makedepends=(
    git
    cmake
    clang
    lld
    llvm
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
            '221a8fc0d1f0cebdf281acc26484e98ebbb59f876e12fdef3f03cf91380e31f5')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S duckstation \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=format-security" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security" \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DBUILD_NOGUI_FRONTEND=OFF \
        -DBUILD_QT_FRONTEND=ON \
        -G Ninja \
        -Wno-dev
    cmake --build build --parallel
}

package() {
    # Initially install everything into /usr/lib/duckstation
    install -m 755 -d "${pkgdir}/usr/lib"
    cp -drv --no-preserve='ownership' build/bin "${pkgdir}/usr/lib/${_pkgname}"

    # Move shared data to /usr/share/duckstation
    pushd "${pkgdir}/usr/lib/${_pkgname}"
    install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
    for _dir in resources translations
    do
        mv "${_dir}" "${pkgdir}/usr/share/${_pkgname}"
        ln -s "/usr/share/${_pkgname}/${_dir}" .
    done
    popd

    install -Dvm755 "$srcdir/duckstation-qt.sh" "$pkgdir/usr/bin/duckstation-qt"
    install -Dvm644 "$srcdir/duckstation-qt.desktop" "$pkgdir/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "$_pkgname/data/resources/images/duck.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}
