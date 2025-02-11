# Maintainer ArchEnemy
GITFLAGS="--branch edk2-stable202411 --depth 1"
pkgname=i915ovmf
pkgver=1.0.2
pkgrel=1
pkgdesc="i915ovmfPkg VBIOS for Intel GPU Passthrough GVT-g/GVT-d"
arch=('x86_64')
url="https://github.com/x78x79x82x79/i915ovmfPkg"
license=('unknown')
depends=(
  'pacman>6.1'
  'git'
  'util-linux'
  'bash'
)
makedepends=(
  'nasm'
)
provides=("i915ovmfpkg")
conflicts=("i915ovmfpkg")
optdepends=(
    'qemu-system-x86'
)
source=(
    "i915ovmf.tar.gz::https://github.com/x78x79x82x79/${pkgname}Pkg/archive/refs/tags/v${pkgver}.tar.gz"
    "edk2::git+https://github.com/x78x79x82x79/edk2"
    "edk2-platforms.tar.gz::https://github.com/x78x79x82x79/edk2-platforms/archive/refs/tags/v1.0.0.tar.gz"
)
sha256sums=(
    "5580834291cb07a5da9cab8de964c94ecf4754e1a4cb159eff2a371b737ba3ab"
    "SKIP"
    "9e7ab8c60970a9129c230d87d9a8884c22505b7d9c27ba9212185257d5069012"
)

prepare(){
    cd edk2
    git init
    echo "checking out edk2 submodules..."
    git submodule update --init --depth 1 --recursive
}

build(){
    BUILD_DIR=$(realpath .)
    export EDK2_PATH="$BUILD_DIR/edk2"
    export EDK2_PLATFORMS_PATH="$BUILD_DIR/edk2-platforms-1.0.0"
    export REPO_PATH="$BUILD_DIR/${pkgname}Pkg-${pkgver}"
    cd "$REPO_PATH"
    source ./config
    ./build.sh
}

package(){
    mkdir -p $pkgdir/var/lib/libvirt/qemu/drivers
    install -m755 $REPO_PATH/@BUILD/Build/i915ovmf/RELEASE_GCC5/X64/i915ovmf.rom $pkgdir/var/lib/libvirt/qemu/drivers/
}
