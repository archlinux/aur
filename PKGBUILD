# Maintainer: Han-Haocheng <1849397656@qq.com>
# Contributor: (add yours)
# Goodix GXFP5130 指纹栈（单包）：DKMS 内核模块 + 用户态工具 + udev 规则 + fprintd drop-in。
# 源码 = Han-Haocheng/gxfp5130-linux 固定 commit；libfprint 后端为独立包 libfprint-gxfp。
pkgname=gxfp5130
pkgver=0.1.0
pkgrel=1
pkgdesc='Goodix GXFP5130 eSPI fingerprint sensor: DKMS module, userspace tools, udev rules and fprintd service config'
arch=('x86_64')
url='https://github.com/Han-Haocheng/gxfp5130-linux'
license=('GPL-2.0-or-later')
depends=('dkms' 'linux-headers' 'mbedtls3')
makedepends=('cmake' 'make' 'gcc' 'mbedtls3')
install=gxfp5130.install

source=('gxfp5130-linux.tar.gz::https://codeload.github.com/Han-Haocheng/gxfp5130-linux/tar.gz/23bf6622b2530a08d5e67cbe479f6fd2873f10d7')
sha256sums=('1470f9f1a165316a0129b13577e38046258b099c8eccc6ecc4a426d16e411358')

build() {
  export MBEDTLS_PREFIX="${MBEDTLS_PREFIX:-/usr/lib/mbedtls3}"
  cmake -S "$srcdir/gxfp5130-linux-23bf6622b2530a08d5e67cbe479f6fd2873f10d7/userspace" -B "$srcdir/userspace-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH="$srcdir/gxfp5130-linux-23bf6622b2530a08d5e67cbe479f6fd2873f10d7/userspace/cmake" \
    -DMBEDTLS_PREFIX="$MBEDTLS_PREFIX" >/dev/null
  cmake --build "$srcdir/userspace-build" -j4 >/dev/null
}

package() {
  # 1) DKMS 内核模块源码
  dkms_src="$pkgdir/usr/src/gxfp-$pkgver"
  install -d "$dkms_src"
  cp -r "$srcdir/gxfp5130-linux-23bf6622b2530a08d5e67cbe479f6fd2873f10d7/kernel/." "$dkms_src/"
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
