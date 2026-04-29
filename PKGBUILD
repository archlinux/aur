# Maintainer: Findlay Feng <findlayfeng@gmail.com>

_target="xtensa-mtk_mt8195_adsp_zephyr-elf"
pkgname=("zephyr-sdk-gnu-${_target}-bin" "zephyr-sdk-gnu-toolchain-${_target}-bin")
pkgver=1.0.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')

source_x86_64+=(zephyr-sdk-${pkgver}_toolchain_gnu_linux-x86_64_${_target}.tar.xz::"https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_gnu_linux-x86_64_${_target}.tar.xz")
source_aarch64+=(zephyr-sdk-${pkgver}_toolchain_gnu_linux-aarch64_${_target}.tar.xz::"https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_gnu_linux-aarch64_${_target}.tar.xz")

sha256sums_x86_64=('b60f15fb92b4ecbe0124b82906b368a36d68ff79c26ce2a89198e3f1d2763e77')
sha256sums_aarch64=('a4be0772b8f6e86e7b0728d373879984f8f42dcf1e68887f9db7de0785e8e277')

options=(!strip)

_installdir=/opt/zephyr-sdk

build() {
  cd "$srcdir"
}

_package_zephyr-sdk-gnu-toolchain-TARGET-bin() {
  local _target="TARGET"
  provides=('zephyr-sdk-gnu-toolchain-TARGET')

  cd "$srcdir"
  for f in $(find $_target -type f -printf '%P\n'); do
    install -D $_target/$f ${pkgdir}$_installdir/gnu/$_target/$f
  done
}

_package_zephyr-sdk-gnu-TARGET-bin() {
  provides=('zephyr-sdk-gnu-TARGET')

  depends=(
    'cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
    "zephyr-sdk-cmake-modules=${pkgver}" "zephyr-sdk-profile=${pkgver}" "zephyr-sdk-hosttools-bin=${pkgver}"
    "zephyr-sdk-gnu-toolchain-TARGET-bin=${pkgver}"
  )
  optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
            'pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
}

_package_gnu_toolchain_def=$(declare -f _package_zephyr-sdk-gnu-toolchain-TARGET-bin)
_package_gnu_toolchain_def=${_package_gnu_toolchain_def#_}
_package_gnu_def=$(declare -f _package_zephyr-sdk-gnu-TARGET-bin)
_package_gnu_def=${_package_gnu_def#_}

eval "${_package_gnu_toolchain_def//TARGET/${_target}}"
eval "${_package_gnu_def//TARGET/${_target}}"
