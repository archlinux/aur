# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=intel-npu-driver-git
pkgver=1.13.0.r0.gbd414f6
pkgrel=1
pkgdesc='Intel Neural Processing Unit (NPU) driver (git version)'
arch=('x86_64')
url='https://github.com/intel/linux-npu-driver/'
license=('MIT' 'BSD-3-Clause')
depends=(
    'gtest'
    'openssl'
    'level-zero-loader'
    'opencv'
    'systemd-libs'
    'yaml-cpp')
optdepends=('intel-npu-compiler: for compiling OpenVINO IR models')
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
        'git+https://github.com/openvinotoolkit/vpux_plugin_elf.git'
        'git+https://android.googlesource.com/platform/external/perfetto.git'
        '10-intel-npu.rules'
        '010-intel-npu-driver-fix-libdrm-header.patch'
        '020-intel-npu-driver-rename-installed-binaries.patch'
        '030-intel-npu-driver-disable-gtest-and-yaml.patch'
        '040-intel-npu-driver-fix-firmware-install-path.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '592a2f5575ecce93a03c66987573fe675d41a63b49cee11d2553645d9e5624fe'
            '4dad75ab65bd244d1be9a3bc62ff81da357c3a181693761081acaa82be3fe6b3'
            '898c41bb43b4d53ea0ab61bc8aad37b51702826442a9bfba08476804993dcba1'
            '861c3872934357048746d308732dd28b880c442702470d0191c9fc01a2aab1b8'
            'c378987c3da52988402d93f396d4084c86c2ddce9c0e2af3284631e6f1796825')

prepare() {
    git -C linux-npu-driver submodule init
    git -C linux-npu-driver config --local submodule.third_party/level-zero.update none
    git -C linux-npu-driver config --local submodule.third_party/level-zero-npu-extensions.url "${srcdir}/level-zero-vpu-extensions"
    git -C linux-npu-driver config --local submodule.third_party/vpux_elf.url "${srcdir}/vpux_plugin_elf"
    git -C linux-npu-driver config --local submodule.third_party/googletest.update none
    git -C linux-npu-driver config --local submodule.third_party/yaml-cpp.update none
    git -C linux-npu-driver config --local submodule.third_party/perfetto.url "${srcdir}/perfetto"
    git -C linux-npu-driver -c protocol.file.allow='always' submodule update
    
    patch -d linux-npu-driver -Np1 -i "${srcdir}/010-intel-npu-driver-fix-libdrm-header.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/020-intel-npu-driver-rename-installed-binaries.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/030-intel-npu-driver-disable-gtest-and-yaml.patch"
    patch -d linux-npu-driver -Np1 -i "${srcdir}/040-intel-npu-driver-fix-firmware-install-path.patch"
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
        -DLevelZero_INCLUDE_DIR:PATH='/usr/include' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    chmod 644 "${pkgdir}/usr/lib/firmware/updates/intel/vpu"/vpu_*.bin
    install -D -m644 10-intel-npu.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D linux-npu-driver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D linux-npu-driver/firmware/bin/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-firmware"
}
