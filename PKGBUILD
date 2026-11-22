# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# Huawei serves Command Line Tools behind a logged-in download page whose URL is
# signature-bearing and rotates per session, so no public, stable URL exists and
# the source list is intentionally empty. Provide the archive at build time:
#
#   1. download it in a browser from
#      https://developer.huawei.com/consumer/cn/download/
#   2. copy the download link, then either
#        ./deveco-clt-url          # reads the link from the clipboard
#      or
#        DEVECO_CLT_URL='<signed url>' makepkg -si
#      or drop the zip next to this PKGBUILD.
#
# pkgver() derives the real version from the archive filename, so this PKGBUILD
# does not have to be edited for every upstream release.
pkgname=deveco-commandline-tools
pkgver=6.1.1.460
pkgrel=3
pkgdesc='HUAWEI Command Line Tools for HarmonyOS: hvigorw, ohpm, hstack, codelinter, SDK tools'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/'
license=('LicenseRef-Huawei-EULA')
depends=('glibc' 'java-runtime' 'nodejs')
optdepends=('deveco-cli: CLI front-end that consumes these tools via DEVECO_CLI_CLT_PATH')
options=('!strip')
source=()
sha256sums=()

_zip_glob=commandline-tools-linux-x64-*.zip

pkgver() {
  local f v
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -n "$f" ]]; then
    v=$(basename "$f" | sed -nE 's/^commandline-tools-linux-x64-([0-9][0-9.]*)\.zip$/\1/p')
    [[ -n "$v" ]] && { printf '%s' "$v"; return; }
  fi
  printf '%s' "${pkgver:-0}"
}

prepare() {
  local zip f
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -z "$f" ]]; then
    if [[ -n "${DEVECO_CLT_URL:-}" ]]; then
      f="$srcdir/$(basename "${DEVECO_CLT_URL%%\?*}")"
      [[ "$f" == *.zip ]] || f="$srcdir/commandline-tools-linux-x64.zip"
      msg "fetching $(basename "$f")"
      curl -fL --retry 3 -o "$f" "$DEVECO_CLT_URL"
    else
      error "No Command Line Tools archive found."
      error ""
      error "  Download it from https://developer.huawei.com/consumer/cn/download/"
      error "  then either copy the link and run"
      error "    DEVECO_CLT_URL='<signed url>' makepkg -si"
      error "  or place the zip next to this PKGBUILD."
      return 1
    fi
  fi
  rm -rf "$srcdir/clt"
  mkdir -p "$srcdir/clt"
  bsdtar -xf "$f" -C "$srcdir/clt"
  if [[ -d "$srcdir/clt/command-line-tools" ]]; then
    chmod +x "$srcdir/clt/command-line-tools/bin/"* 2>/dev/null || true
  else
    chmod +x "$srcdir/clt/bin/"* 2>/dev/null || true
  fi
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
