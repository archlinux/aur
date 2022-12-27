# Edit on github: https://github.com/LizardByte/Sunshine/tree/nightly/packaging/linux/aur/PKGBUILD
# Reference: https://wiki.archlinux.org/title/PKGBUILD

pkgname=sunshine
pkgver=0.16.0
pkgrel=1
pkgdesc="Sunshine is a Gamestream host for Moonlight."
arch=('x86_64' 'i686')
url=https://app.lizardbyte.dev
license=('GPL3')

depends=('avahi' 'boost-libs' 'curl' 'libevdev' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
makedepends=('boost' 'cmake' 'git' 'make' 'nodejs' 'npm')
optdepends=('cuda' 'libcap' 'libdrm')

provides=()
conflicts=()

source=("$pkgname::git+https://github.com/LizardByte/Sunshine.git#commit=c1f0daa024645a00af3f0e9d96098a08cf11531b")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --recursive --init
}

build() {
    pushd "$pkgname"
    npm install
    popd

    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$pkgname" \
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
