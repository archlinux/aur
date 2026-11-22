# Maintainer: HanHaocheng <hanhaocheng@archlinux>
pkgname=deveco-devicetool
pkgver=4.0.0.400
pkgrel=1
pkgdesc='HUAWEI DevEco Device Tool for OpenHarmony device development (VS Code toolchain bundle)'
arch=('x86_64')
url='https://device.harmonyos.com/cn/develop/ide/'
license=('LicenseRef-Huawei-EULA')
depends=('python' 'unzip')
optdepends=('code: load the bundled DevEco Device Tool extensions')
options=('!strip')
source=("devicetool-linux-tool-${pkgver}.zip::https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_package_901_9/4e/v3/lGclRHBmTLWHOm_LkEJ46g/devicetool-linux-tool-${pkgver}.zip?HW-CC-KV=V1&HW-CC-Date=20230904T063206Z&HW-CC-Expire=315360000&HW-CC-Sign=9FCEEF20362FDAAE404DA2B838BF6EBDC5074446A4209F487E75059BB471EF6E")
sha256sums=('SKIP')

prepare() {
  unzip -q -o "$srcdir/devicetool-linux-tool-$pkgver.zip" -d "$srcdir/payload"
  chmod +x "$srcdir/payload/devicetool-linux-tool-$pkgver.sh"
  rm -rf "$srcdir/extracted"
  # makeself self-extractor: unpack the payload here, never execute the vendor installer
  sh "$srcdir/payload/devicetool-linux-tool-$pkgver.sh" --noexec --nox11 --target "$srcdir/extracted"
}

package() {
  install -d "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer"
  cp -r --no-preserve=ownership "$srcdir/extracted/." "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer/"

  # USB/JTAG udev rules shipped in the payload
  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m644 "$srcdir/extracted"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  # vendor EULA / privacy statement
  install -Dm644 "$srcdir/extracted/privacy_statement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/deveco-devicetool" <<'EOF'
#!/bin/sh
# vendor installer needs root and installs per-user VS Code plugins
exec sudo -E /opt/Huawei/DevEco-Device-Tool/installer/run.sh --system "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/deveco-devicetool"
}
