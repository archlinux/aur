# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# DevEco Device Tool is login-gated: the download link is signature-bearing and
# account-bound, so it must not live in a public PKGBUILD. Download
# 'devicetool-linux-tool-4.0.0.400.zip' from
#   https://device.harmonyos.com/cn/develop/ide
# place it next to this PKGBUILD, then run makepkg -si.
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
source=('devicetool-linux-tool.zip')
sha256sums=('SKIP')

prepare() {
  if [[ ! -f "$srcdir/devicetool-linux-tool.zip" ]]; then
    error "Missing $srcdir/devicetool-linux-tool.zip"
    error "Download DevEco Device Tool from https://device.harmonyos.com/cn/develop/ide"
    error "and place it next to this PKGBUILD, then rerun makepkg."
    return 1
  fi
  unzip -q -o "$srcdir/devicetool-linux-tool.zip" -d "$srcdir/payload"
  chmod +x "$srcdir/payload/"*.sh
  rm -rf "$srcdir/extracted"
  sh "$srcdir/payload/"*.sh --noexec --nox11 --target "$srcdir/extracted"
}

package() {
  install -d "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer"
  cp -r --no-preserve=ownership "$srcdir/extracted/." "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer/"

  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m644 "$srcdir/extracted"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 "$srcdir/extracted/privacy_statement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/deveco-devicetool" <<'EOF'
#!/bin/sh
# vendor installer needs root and installs per-user VS Code plugins
exec sudo -E /opt/Huawei/DevEco-Device-Tool/installer/run.sh --system "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/deveco-devicetool"
}
