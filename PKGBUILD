# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# Huawei serves Command Line Tools behind a logged-in download page whose URL is
# signature-bearing and rotates per session, so no public, stable URL exists.
# The source list is therefore intentionally empty: provide the zip's signed URL
# at build time, either as DEVECO_CLT_URL=<url> makepkg -si, or by dropping the
# zip next to the PKGBUILD as commandline-tools-linux-x64.zip.
pkgname=deveco-commandline-tools
pkgver=6.1.1.460
pkgrel=2
pkgdesc='HUAWEI Command Line Tools for HarmonyOS: hvigorw, ohpm, hstack, codelinter, SDK tools'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/'
license=('LicenseRef-Huawei-EULA')
depends=('glibc' 'java-runtime' 'nodejs')
optdepends=('deveco-cli: CLI front-end that consumes these tools via DEVECO_CLI_CLT_PATH')
options=('!strip')
source=()
sha256sums=()
_zip=commandline-tools-linux-x64.zip

prepare() {
  if [[ ! -f "$srcdir/$_zip" ]]; then
    if [[ -n "${DEVECO_CLT_URL:-}" ]]; then
      msg "fetching $srcdir/$_zip from DEVECO_CLT_URL"
      curl -fL --retry 3 -o "$srcdir/$_zip" "$DEVECO_CLT_URL"
    else
      error "No Command Line Tools archive found."
      error ""
      error "  1. sign in at https://developer.huawei.com/consumer/cn/download/"
      error "     and copy the 'Command Line Tools' Linux download link"
      error "  2. either place the zip next to this PKGBUILD as $_zip"
      error "     or pass the link:"
      error "       DEVECO_CLT_URL='<signed url>' makepkg -si"
      return 1
    fi
  fi
  rm -rf "$srcdir/clt"
  mkdir -p "$srcdir/clt"
  bsdtar -xf "$srcdir/$_zip" -C "$srcdir/clt"
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
