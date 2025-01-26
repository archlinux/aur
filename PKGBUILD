# Maintainer ArchEnemy
GITFLAGS="--branch edk2-stable202405 --depth 1"
pkgname=i915ovmf
pkgver=1.0.1
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
    "edk2::git+https://github.com/tianocore/edk2.git"
    "edk2-platforms.zip::https://github.com/tianocore/edk2-platforms/archive/refs/heads/master.zip"
)
sha256sums=(
    "6e2ae1bc4cd34dc0d9b642c6b7d8974b324de7f15b8ad1bb8e83e8f9def6be9f"
    #"53cbf51f2ca7aea9ef67ca9aeb6276dc5643c87b5ccdb7fe9f9936361623d7be"
    SKIP
    #"3ff0ba1929c53a10f384b3a17a2f377594962e40dbd98c5faf3f930923cfd54d"
    "SKIP"
)

prepare(){
    cd edk2
    echo "checking out edk2 submodules..."
    git submodule update --init --depth 1 --recursive
}

build(){
    BUILD_DIR=$(realpath .)
    export EDK2_PATH="$BUILD_DIR/edk2"
    export EDK2_PLATFORMS_PATH="$BUILD_DIR/edk2-platforms-master"
    export REPO_PATH="$BUILD_DIR/${pkgname}Pkg-${pkgver}"
    cd "$REPO_PATH"
    source ./config
    ./build.sh
}

package(){
    mkdir -p $pkgdir/var/lib/libvirt/qemu/drivers
    install -m755 $REPO_PATH/@BUILD/Build/i915ovmf/RELEASE_GCC5/X64/i915ovmf.rom $pkgdir/var/lib/libvirt/qemu/drivers/
}
