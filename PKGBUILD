# Maintainer: Han-Haocheng <1849397656@qq.com>
# Contributor: (add yours)
# Goodix GXFP5130 指纹栈（单包）：DKMS 内核模块 + 用户态工具 + udev 规则 + fprintd drop-in。
# 源码 = 上游 Metrohan/gxfp5130-linux 的发布 tag（v${pkgver}）；libfprint 后端为独立包 libfprint-gxfp。
# 上游 v0.2.0 起自带 Arch 支持：mbedtls3（co-installable 包）与 DKMS 模块构建，见上游 README。
pkgname=gxfp5130
pkgver=0.2.0
pkgrel=1
pkgdesc='Goodix GXFP5130 eSPI fingerprint sensor: DKMS module, userspace tools, udev rules and fprintd service config'
arch=('x86_64')
url='https://github.com/Metrohan/gxfp5130-linux'
license=('GPL-2.0-or-later')
depends=('dkms' 'linux-headers' 'mbedtls3')
makedepends=('cmake' 'make' 'gcc' 'mbedtls3')
install=gxfp5130.install

source=("gxfp5130-linux.tar.gz::https://github.com/Metrohan/gxfp5130-linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('264a0e04a9128e7c9e7c089be50fc12602f9beb453897c22957d288561ab7b8f')

build() {
  # Arch 的 mbedtls3 是 co-installable 的独立包：CMake 配置在
  # /usr/lib/mbedtls3/cmake/MbedTLS，pkg-config 文件在 /usr/lib/mbedtls3/pkgconfig。
  # 上游 CMakeLists 用标准 find_package(MbedTLS)，这里把两者都指过去。
  export PKG_CONFIG_PATH="/usr/lib/mbedtls3/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
  cmake -S "$srcdir/gxfp5130-linux-${pkgver}/userspace" -B "$srcdir/userspace-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DMbedTLS_DIR=/usr/lib/mbedtls3/cmake/MbedTLS >/dev/null
  cmake --build "$srcdir/userspace-build" -j4 >/dev/null
}

package() {
  # 1) DKMS 内核模块源码（上游 kernel/dkms.conf 的 PACKAGE_VERSION 仍是 0.1.0，改写成本包版本）
  dkms_src="$pkgdir/usr/src/gxfp-$pkgver"
  install -d "$dkms_src"
  cp -r "$srcdir/gxfp5130-linux-${pkgver}/kernel/." "$dkms_src/"
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" "$dkms_src/dkms.conf"
  chmod -R u+w "$dkms_src" 2>/dev/null || true
  find "$dkms_src" -name '*.o' -delete 2>/dev/null || true
  find "$dkms_src" -name '.*.cmd' -delete 2>/dev/null || true
  rm -f "$dkms_src"/Module.symvers "$dkms_src"/modules.order 2>/dev/null || true
  make -C "$dkms_src" clean >/dev/null 2>&1 || true

  # 2) 用户态工具
  install -Dm755 "$srcdir/userspace-build/gxfp_capture" "$pkgdir/usr/bin/gxfp_capture"
  install -Dm755 "$srcdir/userspace-build/gxfp_psk_tool" "$pkgdir/usr/bin/gxfp_psk_tool"
  install -Dm755 "$srcdir/userspace-build/gxfp_recovery" "$pkgdir/usr/bin/gxfp_recovery"

  # 3) udev 规则
  install -d "$pkgdir/usr/lib/udev/rules.d"
  printf '%s\n' 'SUBSYSTEM=="misc", KERNEL=="gxfp", MODE="0660", TAG+="uaccess"' \
    > "$pkgdir/usr/lib/udev/rules.d/60-gxfp.rules"

  # 4) fprintd drop-in
  install -d "$pkgdir/usr/lib/systemd/system/fprintd.service.d"
  printf '%s\n' '[Service]' 'DeviceAllow=/dev/gxfp rw' \
    > "$pkgdir/usr/lib/systemd/system/fprintd.service.d/gxfp.conf"
}
