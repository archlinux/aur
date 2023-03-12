# Maintainer: detian <dehe_tian@outlook.com>
pkgname=sunshine-ipv6
_pkgname=sunshine
pkgver=0.18.4
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight with ipv6 patch."
arch=('x86_64' 'aarch64')
url=https://app.lizardbyte.dev
license=('GPL3')
install=sunshine.install

depends=('avahi' 'boost-libs' 'curl' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
makedepends=('boost' 'cmake' 'git' 'make' 'nodejs' 'npm')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')

provides=('sunshine')
conflicts=('sunshine' 'sunshine-nox' 'sunshine-git')

source=(
    "$_pkgname::git+https://github.com/LizardByte/Sunshine.git#tag=v${pkgver}"
    "ipv6.patch"
)
sha256sums=('SKIP' '870976b2481e9a3b77a48f85a5dbaef9ad7b133dc31915ec735edcc1c1f7a789')

prepare() {
    cd "$_pkgname"

    # ipv6 support from HexJacaranda
    # git pull --rebase https://github.com/HexJacaranda/Sunshine ipv6
    git am "$srcdir/ipv6.patch"

    if [ "$CARCH" == x86_64 ]; then
        git rm -f third-party/ffmpeg-linux-aarch64
    elif [ "$CARCH" == aarch64 ]; then
        git rm -f third-party/ffmpeg-linux-x86_64
    fi
    git rm -f third-party/ffmpeg-windows-x86_64
    git rm -f third-party/ffmpeg-macos-x86_64
    git rm -f third-party/ffmpeg-macos-aarch64

    git submodule update --recursive --init
}

build() {
    pushd "$_pkgname"
    npm install
    popd

    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$_pkgname" \
        -B build \
        -Wno-dev \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D SUNSHINE_ASSETS_DIR="share/sunshine"

    make -C build
}

package() {
    make -C build install DESTDIR="$pkgdir"
}
