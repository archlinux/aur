# Maintainer: Findlay Feng <findlayfeng@gmail.com>

pkgname=("zephyr-sdk-llvm-bin" "zephyr-sdk-llvm-toolchain-bin")
pkgver=1.0.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')

source_x86_64+=(zephyr-sdk-${pkgver}_toolchain_llvm_linux-x86_64.tar.xz::"https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_llvm_linux-x86_64.tar.xz")
source_aarch64+=(zephyr-sdk-${pkgver}_toolchain_llvm_linux-aarch64.tar.xz::"https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_llvm_linux-aarch64.tar.xz")

sha256sums_x86_64=('6de38597ccab887a9e602db068d1bea374f9bb5a8243d7386722553667ec175c')
sha256sums_aarch64=('fcb1667c5324799fcc29da976d1262efaf6548ae6ab04d9f8d579b2aacd03667')

options=(!strip)

_installdir=/opt/zephyr-sdk

build() {
  cd "$srcdir"
}

package_zephyr-sdk-llvm-bin() {
  depends+=('cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
    "zephyr-sdk-cmake-modules=${pkgver}" "zephyr-sdk-profile=${pkgver}" "zephyr-sdk-hosttools-bin=${pkgver}"
    "zephyr-sdk-llvm-toolchain-bin=${pkgver}"
  )
  provides=("zephyr-sdk-llvm")
  optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
            'pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
}

package_zephyr-sdk-llvm-toolchain-bin() {
  provides=("zephyr-sdk-llvm-toolchain")

  cd "$srcdir"
  mkdir -p ${pkgdir}$_installdir/
  cp -a "${srcdir}/llvm" ${pkgdir}$_installdir/
}

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master
# $ source zephyr-env.sh
# $ cd samples/hello_world
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_cortex_a53 ..
# $ ninja run

# Alternative using West:
#
# $ west init testws
# $ cd testws
# $ west update
# $ cd zephyr
# $ west build --pristine=always -b qemu_cortex_a53 samples/hello_world
# $ cd build
# $ ninja run

# Expected output for -b qemu_cortex_m3:
#
#       *** Booting Zephyr OS version 2.4.99  ***
#       Hello World! qemu_cortex_a53

# More info: https://docs.zephyrproject.org/latest/getting_started/index.html
