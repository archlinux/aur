# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=intel-npu-driver
pkgver=1.10.1
pkgrel=2
_patches_commit=4a6e0c5a8f55569ae3e8f53ff0762465c087f73e
pkgdesc='Intel Neural Processing Unit (NPU) driver'
arch=('x86_64')
url='https://github.com/intel/linux-npu-driver/'
license=('MIT' 'BSD-3-Clause')
depends=('gtest' 'openssl' 'level-zero-loader' 'opencv' 'systemd-libs' 'yaml-cpp')
makedepends=('cmake' 'git' 'level-zero-headers' 'libdrm')
install=intel-npu-driver.install
source=("git+https://github.com/intel/linux-npu-driver.git#tag=v${pkgver}"
        'git+https://github.com/intel/level-zero-vpu-extensions.git'
        'git+https://github.com/openvinotoolkit/vpux_plugin_elf.git'
        "git+https://github.com/xanderlent/intel-npu-driver-rpm.git#commit=${_patches_commit}"
        '10-intel-npu-driver.rules'
        '010-intel-npu-driver-fix-libdrm-header.patch')
sha256sums=('3c2287b2d545ea51413937ea4452ec80345e748773b63638a7ef976c50593b85'
            'SKIP'
            'SKIP'
            'ceb2b7936290d1c3425f7711d831f083064b89fe1ee76eae7a3dca7c3842d8f1'
            '592a2f5575ecce93a03c66987573fe675d41a63b49cee11d2553645d9e5624fe'
            '4dad75ab65bd244d1be9a3bc62ff81da357c3a181693761081acaa82be3fe6b3')

prepare() {
    git -C linux-npu-driver submodule init
    git -C linux-npu-driver config --local submodule.third_party/level-zero.update none
    git -C linux-npu-driver config --local submodule.third_party/level-zero-npu-extensions.url "${srcdir}/level-zero-vpu-extensions"
    git -C linux-npu-driver config --local submodule.third_party/vpux_elf.url "${srcdir}/vpux_plugin_elf"
    git -C linux-npu-driver config --local submodule.third_party/googletest.update none
    git -C linux-npu-driver config --local submodule.third_party/yaml-cpp.update none
    git -C linux-npu-driver -c protocol.file.allow='always' submodule update
    
    # fix build with level-zero 1.18
    # https://github.com/intel/level-zero-npu-extensions/commit/110f48ee8eda22d8b40daeeecdbbed0fc3b08f8b
    git -C linux-npu-driver/third_party/level-zero-npu-extensions config --local advice.detachedHead false
    git -C linux-npu-driver/third_party/level-zero-npu-extensions checkout 110f48ee8eda22d8b40daeeecdbbed0fc3b08f8b
    
    patch -d linux-npu-driver -Np1 -i "${srcdir}/010-intel-npu-driver-fix-libdrm-header.patch"
    
    patch -d linux-npu-driver -Np1 -i "${srcdir}/intel-npu-driver-rpm/0001-Disable-third-party-googletest-and-yaml-cpp.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/intel-npu-driver-rpm/0002-Make-firmware-install-respect-CMAKE_INSTALL_PATH.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/intel-npu-driver-rpm/0004-Fix-usage-of-upstreamed-extension.patch"
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
        -DLevelZero_INCLUDE_DIR:PATH='/usr/include' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    chmod 644 "${pkgdir}/usr/lib/firmware/updates/intel/vpu"/vpu_*.bin
    install -D -m644 10-intel-npu-driver.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D linux-npu-driver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D linux-npu-driver/firmware/bin/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-firmware"
}
