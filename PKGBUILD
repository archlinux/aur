# Maintainer: detian <dehe_tian@outlook.com>
pkgname=sunshine-ipv6
_pkgname=sunshine
pkgver=0.19.1
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight with ipv6 patch."
arch=('x86_64' 'aarch64')
url=https://app.lizardbyte.dev
license=('GPL3')
install=sunshine.install

depends=('avahi' 'boost-libs' 'curl' 'libappindicator-gtk3' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
makedepends=('boost' 'cmake' 'git' 'make' 'nodejs' 'npm')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')

provides=('sunshine')
conflicts=('sunshine' 'sunshine-nox' 'sunshine-git')

source=(
    "$_pkgname.desktop"
    "$_pkgname::git+https://github.com/HexJacaranda/Sunshine.git#branch=feature/ipv6_randomize"
)
sha256sums=('05013785251e864fc0d6603e714e256b03f9f2d57e80239bc2f528b1903b068a'
            'SKIP')

prepare() {
    cd "$_pkgname"
    # Skip submodules that we don't want
    git rm -f third-party/ffmpeg-windows-x86_64
    git rm -f third-party/ffmpeg-macos-x86_64
    git rm -f third-party/ffmpeg-macos-aarch64

    if [[ $CARCH == "x86_64" ]]; then
        git rm -f third-party/ffmpeg-linux-aarch64
    elif [[ $CARCH == "aarch64" ]]; then
        git rm -f third-party/ffmpeg-linux-x86_64
    fi

    git submodule update --recursive --init
}

build() {
    pushd "$_pkgname"
    npm install
    popd

    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake -Wno-dev \
        -S "$_pkgname" \
        -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D SUNSHINE_ASSETS_DIR="share/sunshine" \
        -D SUNSHINE_ENABLE_WAYLAND=ON \
        -D SUNSHINE_ENABLE_X11=ON \
        -D SUNSHINE_ENABLE_DRM=ON \
        -D SUNSHINE_ENABLE_CUDA=ON

    make -j "$(nproc)" -C build
}

package() {
    make -C build install DESTDIR="$pkgdir"

    # Copy desktop file
    install -vdm 755 "${pkgdir}/usr/share/pixmaps"
    ln -vs /usr/share/sunshine/web/images/logo-sunshine-45.png "${pkgdir}/usr/share/pixmaps/$_pkgname.png"
    install -vDm 644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
