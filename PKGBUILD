# Maintainer: detian <dehe_tian@outlook.com>

pkgname='sunshine-ipv6'
_pkgname='sunshine'
pkgver=0.20.0
pkgrel=2
pkgdesc="Sunshine is a self-hosted game stream host for Moonlight. (with ipv6 patch)"
arch=('x86_64' 'aarch64')
url=https://github.com/HexJacaranda/Sunshine/tree/feature/ipv6_randomize
license=('GPL3')
install=sunshine.install
options=(!strip)

depends=('avahi' 'boost-libs' 'curl' 'libappindicator-gtk3' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
makedepends=('boost' 'cmake' 'git' 'make' 'nodejs' 'npm' 'ninja') # upx
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')

provides=('sunshine')
conflicts=('sunshine-nox' 'sunshine-git')

source=(
    "ipv6.patch"
    "$_pkgname.desktop"
    "$_pkgname::git+https://github.com/LizardByte/Sunshine.git#tag=v${pkgver}")
sha256sums=('a97c30853c9de6db20e857ec73d82b97365f86aace5c7116bad7cf5ca0a49747'
            '68b4d8cc6fbeb9ead07489790386835e7386a545557d54d2d841ca17e4118c11'
            'SKIP')

prepare() {
    cd "$_pkgname"

    patch -Np1 < ../ipv6.patch

    # Remove submodules that are not needed in this build.
    find . -type d \
        '(' -iname 'ffmpeg-*' -o -iname '*ViGEmClient' ')' \
        ! -iname "*linux-$CARCH" \
        -exec git rm -rf {} +

    git submodule update --recursive --init
}

build() {
    pushd "$_pkgname"
    npm install
    # For not check nightly update
    export BRANCH=master
    export BUILD_VERSION=${pkgver}
    COMMIT="$(git rev-parse HEAD)"
    export COMMIT
    popd

    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake -Wno-dev \
        -S "$_pkgname" \
        -B build -G Ninja \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SUNSHINE_ASSETS_DIR="share/$_pkgname" \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/$_pkgname \
        -D SUNSHINE_ENABLE_WAYLAND=ON \
        -D SUNSHINE_ENABLE_X11=ON \
        -D SUNSHINE_ENABLE_DRM=ON \
        -D SUNSHINE_ENABLE_CUDA=ON \

    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install #&& upx --best "$(realpath "$pkgdir/usr/bin/$_pkgname")"

    # Copy .desktop file
    install -vdm 755 "${pkgdir}"/usr/share/{applications,pixmaps}
    install -vDm 644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    ln -vs "/usr/share/${_pkgname}/web/images/logo-${_pkgname}-45.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
