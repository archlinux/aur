# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# Huawei Command Line Tools is login-gated: the zip is only served behind a
# Huawei account via a signature-bearing, account-tied URL, so this package is
# intentionally NOT in the AUR (aurweb rejects sources it cannot fetch).
# Download 'commandline-tools-linux-x64-<ver>.zip' from
#   https://developer.huawei.com/consumer/cn/download/
# place it next to this PKGBUILD (rename to commandline-tools-linux-x64.zip),
# then run makepkg -si.
pkgname=deveco-commandline-tools
pkgver=6.1.1.460
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
    error "Download Command Line Tools from https://developer.huawei.com/consumer/cn/download/"
    error "and place it next to this PKGBUILD, then rerun makepkg."
    return 1
  fi
  rm -rf "$srcdir/clt"
  mkdir -p "$srcdir/clt"
  bsdtar -xf "$srcdir/commandline-tools-linux-x64.zip" -C "$srcdir/clt"
  if [[ -d "$srcdir/clt/command-line-tools" ]]; then
    _clt="$srcdir/clt/command-line-tools"
  else
    _clt="$srcdir/clt"
  fi
  chmod +x "$_clt/bin/"* 2>/dev/null || true
}

package() {
  local _clt
  if [[ -d "$srcdir/clt/command-line-tools" ]]; then
    _clt="$srcdir/clt/command-line-tools"
  else
    _clt="$srcdir/clt"
  fi

  install -d "$pkgdir/opt/deveco/command-line-tools"
  cp -r --no-preserve=ownership "$_clt/." "$pkgdir/opt/deveco/command-line-tools/"

  install -d "$pkgdir/usr/bin"
  local t
  for t in hvigorw ohpm hstack arktsdoc; do
    [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/$t" ]] &&
      ln -s "/opt/deveco/command-line-tools/bin/$t" "$pkgdir/usr/bin/$t"
  done
  [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/codelinter" ]] &&
    ln -s /opt/deveco/command-line-tools/bin/codelinter "$pkgdir/usr/bin/hcodelinter"
  [[ -e "$pkgdir/opt/deveco/command-line-tools/bin/Emulator" ]] &&
    ln -s /opt/deveco/command-line-tools/bin/Emulator "$pkgdir/usr/bin/hemulator"
  local _hdc
  _hdc=$(find "$pkgdir/opt/deveco/command-line-tools" -type f -name hdc 2>/dev/null | head -1)
  [[ -n "$_hdc" ]] && ln -s "${_hdc#$pkgdir}" "$pkgdir/usr/bin/hdc"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'Huawei Command Line Tools, installed to /opt/deveco/command-line-tools.' \
    '' \
    'Point DevEco CLI at it:' \
    '  export DEVECO_CLI_CLT_PATH=/opt/deveco/command-line-tools' > "$pkgdir/usr/share/doc/$pkgname/README"
}
