# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# Huawei Command Line Tools (CLT) is login-gated: the zip is only offered from
# https://developer.huawei.com/consumer/cn/download/ behind a Huawei account and
# a short-lived signed URL, so makepkg cannot fetch it. Download
# 'commandline-tools-linux-x64.zip' (>= 26.0.0) from the page above and place it
# next to this PKGBUILD, then run makepkg -si.
pkgname=deveco-commandline-tools
pkgver=26.0.0.851
pkgrel=1
pkgdesc='HUAWEI Command Line Tools for HarmonyOS: hvigorw, ohpm, hstack, codelinter, SDK tools'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/'
license=('LicenseRef-Huawei-EULA')
depends=('glibc' 'java-runtime' 'nodejs')
optdepends=('deveco-cli: CLI front-end that consumes these tools via DEVECO_CLI_CLT_PATH')
options=('!strip')
source=('commandline-tools-linux-x64.zip')
sha256sums=('SKIP')

prepare() {
  if [[ ! -f "$srcdir/commandline-tools-linux-x64.zip" ]]; then
    error "Missing $srcdir/commandline-tools-linux-x64.zip"
    error "Download Command Line Tools (>= 26.0.0) from https://developer.huawei.com/consumer/cn/download/"
    error "and place it next to this PKGBUILD, then rerun makepkg."
    return 1
  fi
  rm -rf "$srcdir/clt"
  mkdir -p "$srcdir/clt"
  bsdtar -xf "$srcdir/commandline-tools-linux-x64.zip" -C "$srcdir/clt"
  chmod +x "$srcdir/clt/command-line-tools/bin/"* 2>/dev/null
}

package() {
  install -d "$pkgdir/opt/deveco/command-line-tools"
  cp -r --no-preserve=ownership "$srcdir/clt/command-line-tools/." "$pkgdir/opt/deveco/command-line-tools/"

  install -d "$pkgdir/usr/bin"
  local t
  for t in hvigorw ohpm hstack; do
    [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/$t" ]] &&
      ln -s "/opt/deveco/command-line-tools/bin/$t" "$pkgdir/usr/bin/$t"
  done
  # generic names get an "h" prefix to avoid collisions
  [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/codelinter" ]] &&
    ln -s /opt/deveco/command-line-tools/bin/codelinter "$pkgdir/usr/bin/hcodelinter"
  [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/Emulator" ]] &&
    ln -s /opt/deveco/command-line-tools/bin/Emulator "$pkgdir/usr/bin/hemulator"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n'     'Huawei Command Line Tools, installed to /opt/deveco/command-line-tools.'     ''     'Point DevEco CLI at it:'     '  export DEVECO_CLI_CLT_PATH=/opt/deveco/command-line-tools'     'or pass the installed bin/ tools directly.' > "$pkgdir/usr/share/doc/$pkgname/README"

  install -Dm644 "$srcdir/clt/command-line-tools/README.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt" 2>/dev/null || true
}
