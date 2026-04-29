# Maintainer: Findlay Feng <findlayfeng@gmail.com>

pkgname=("zephyr-sdk-hosttools-bin" "zephyr-sdk-cmake-modules" "zephyr-sdk-profile")
pkgver=1.0.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')
makedepends=('python' 'patchelf')
source=("profile-zephyr-sdk.sh" "profile-zephyr-sdk.ash")
sha256sums=('1f7d3c7246a572964db24c0845f9534b41fcf6769688a3d1ebb46a1158d89a7e'
            '8d723658578f4cd3f8cc884f9b6d2789acd8692f3fd5de4f61c6c6a06e2a413e')
sha256sums_x86_64=('ca9bc0ff66fafca1dac9d592a36d953cf16d096a9d09b1c0357f021cf9f6a7eb')
sha256sums_aarch64=('d79c5bfc68e679488659bea289a4026e52a64f03338875c8c9c850fff13cee30')

source_x86_64=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}_linux-x86_64_minimal.tar.xz")

source_aarch64=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}_linux-aarch64_minimal.tar.xz")

options=(!strip)

_installdir=/opt/zephyr-sdk

build() {
  cd "$srcdir"

  hosttools=$(find zephyr-sdk-$pkgver/hosttools/ -type f -name "zephyr-sdk-${CARCH}-hosttools-standalone-*.sh" | head -n 1)

  # Disables sanboxing on systems where libseccomp is available
  sed -i 's/xargs -n100 file/xargs -n100 file -S/' $hosttools
  $hosttools -y -R -S -d zephyr-sdk-$pkgver/hosttools/
  # Strip package build path from prefix path
  sed -i "s@\(relocate_sdk.py\s\+\)${srcdir}/zephyr-sdk-$pkgver/hosttools ${srcdir}/zephyr-sdk-$pkgver/hosttools@\1 ${_installdir}/hosttools ${_installdir}/hosttools@g" zephyr-sdk-$pkgver/hosttools/relocate_sdk.sh
  zephyr-sdk-$pkgver/hosttools/relocate_sdk.sh
}

package_zephyr-sdk-profile() {
  cd "$srcdir"

  install -Dm644 profile-zephyr-sdk.sh $pkgdir/etc/profile.d/zephyr-sdk.sh
  install -Dm644 profile-zephyr-sdk.ash $pkgdir/etc/profile.d/zephyr-sdk.ash
}

package_zephyr-sdk-cmake-modules() {
  depends=('cmake')

  cd "$srcdir"

  for f in $(find zephyr-sdk-$pkgver/cmake/ -type f -printf '%P\n'); do
    install -Dm644 zephyr-sdk-$pkgver/cmake/$f ${pkgdir}$_installdir/cmake/$f
  done

  install -Dm644 zephyr-sdk-$pkgver/sdk_version ${pkgdir}$_installdir/sdk_version

  # Manually install the CMake module, because upstream paths are no good:
  # file installed into $HOME and path is the package build path. Upstream
  # needs to support overridable path for the module and a -prefix argumnent
  # to distinguish destination copy dir from final system install path.
  local _cmake_fname=$(echo -n $_installdir | md5sum | cut -d' ' -f1)
  local _cmake_module_path="$pkgdir/usr/lib/cmake/Zephyr-sdk"
  mkdir -p "$_cmake_module_path"
  echo "$_installdir" > "$_cmake_module_path/${_cmake_fname}"
}

package_zephyr-sdk-hosttools-bin() {
  provides=("zephyr-sdk-hosttools")
  conflicts=("zephyr-sdk-hosttools")

  cd "$srcdir"

  for f in $(find zephyr-sdk-$pkgver/hosttools/sysroots/ -type f -printf '%P\n'); do
    install -D zephyr-sdk-$pkgver/hosttools/sysroots/$f ${pkgdir}$_installdir/hosttools/sysroots/$f
  done

  install -Dm644 zephyr-sdk-$pkgver/hosttools/version-x86_64-pokysdk-linux ${pkgdir}$_installdir/hosttools/version-x86_64-pokysdk-linux
}
