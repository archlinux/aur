# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=intel-npu-driver-git
pkgver=1.35.0.r0.gfd49947
pkgrel=1
pkgdesc='Intel Neural Processing Unit (NPU) driver (git version)'
arch=('x86_64')
url='https://github.com/intel/linux-npu-driver/'
license=('BSD-3-Clause AND MIT')
depends=(
    'glibc'
    'gtest'
    'level-zero-loader'
    'libgcc'
    'libstdc++'
    'opencv'
    'yaml-cpp')
optdepends=(
    'intel-npu-compiler: for compiling OpenVINO IR models')
makedepends=(
    'cmake'
    'git'
    'level-zero-headers'
    'libdrm')
provides=('intel-npu-driver')
conflicts=('intel-npu-driver')
install=intel-npu-driver.install
source=('git+https://github.com/intel/linux-npu-driver.git'
        'git+https://github.com/intel/level-zero-vpu-extensions.git'
        'git+https://github.com/openvinotoolkit/npu_compiler_elf.git'
        '10-intel-npu.rules'
        '010-intel-npu-driver-rename-installed-binaries.patch'
        '020-intel-npu-driver-disable-werror.patch'
        '030-intel-npu-driver-fix-firmware-install-path.patch'
        '040-intel-npu-driver-use-system-level-zero.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '592a2f5575ecce93a03c66987573fe675d41a63b49cee11d2553645d9e5624fe'
            '03783024bbb9051a2f8f780fbaab643681c8d20c7d285cde9af241082ea483bb'
            '9eb32f61b0ea2ea991b621d7c9a15d93922d3f73516319625bb2ca63af0e9115'
            '958f5a8114e9ca51c3819ef26b9ace938a61b39da8da1b8627288c5a8910aaf6'
            'a257456a61d5ec670c26b2c6d23f23f03b68ff6e64f74539c17b2c7e1b074f25')

prepare() {
    git -C linux-npu-driver submodule init
    git -C linux-npu-driver config --local submodule.third_party/level-zero.update none
    git -C linux-npu-driver config --local submodule.third_party/level-zero-vpu-extensions.url "${srcdir}/level-zero-vpu-extensions"
    git -C linux-npu-driver config --local submodule.third_party/npu_compiler_elf.url "${srcdir}/npu_compiler_elf"
    git -C linux-npu-driver config --local submodule.third_party/googletest.update none
    git -C linux-npu-driver config --local submodule.third_party/yaml-cpp.update none
    git -C linux-npu-driver -c protocol.file.allow='always' submodule update
    
    patch -d linux-npu-driver -Np1 -i "${srcdir}/010-intel-npu-driver-rename-installed-binaries.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/020-intel-npu-driver-disable-werror.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/030-intel-npu-driver-fix-firmware-install-path.patch"
    patch -d linux-npu-driver/third_party/level-zero-npu-extensions -Np1 -i "${srcdir}/040-intel-npu-driver-use-system-level-zero.patch"
}

pkgver() {
    git -C linux-npu-driver describe --long --tags --abbrev='7' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # fix error: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    cmake -B build -S linux-npu-driver \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_NPU_COMPILER_BUILD:BOOL='OFF' \
        -DENABLE_SANITIZER:STRING='disabled' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build --component fw-npu
    chmod 644 "${pkgdir}/usr/lib/firmware/updates/intel/vpu"/vpu_*.bin
    install -D -m644 10-intel-npu.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D linux-npu-driver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D linux-npu-driver/firmware/bin/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-firmware"
}
