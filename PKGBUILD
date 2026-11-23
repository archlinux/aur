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
pkgver=26.0.1.290
pkgrel=8
pkgdesc='HUAWEI Command Line Tools for HarmonyOS: hvigorw, ohpm, hstack, codelinter, SDK tools'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/'
license=('LicenseRef-Huawei-EULA')
depends=('glibc' 'java-runtime' 'nodejs')
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

  install -d "$pkgdir/opt/huawei/command-line-tools"
  cp -r --no-preserve=ownership "$_clt/." "$pkgdir/opt/huawei/command-line-tools/"

  # the upstream zip ships 0700/0750 modes meant for a root installer; make the
  # tree usable for normal users
  find "$pkgdir/opt/huawei/command-line-tools" \( -type f -o -type d \) -exec chmod 755 {} +

  install -d "$pkgdir/usr/bin"
  local t name src
  # Wrap *every* launcher the CLT ships, not a hand-picked list: 26.x added
  # api-compat, appanalyzer, arkts-lsp and codescanner next to the older ones.
  for src in "$pkgdir/opt/huawei/command-line-tools/bin/"*; do
    [[ -f "$src" ]] || continue
    t=$(basename "$src")
    case "$t" in
      codelinter) name=hcodelinter ;;
      Emulator)   name=hemulator ;;
      *)          name=$t ;;
    esac
    # These upstream launchers locate their payload via $(dirname "$0")/.. without
    # readlink, so a /usr/bin symlink resolves to /usr/hvigor/... and dies.
    # Exec the real path instead: the launcher then sees /opt/... as $0.
    printf '#!/bin/sh\nexec /opt/huawei/command-line-tools/bin/%s "$@"\n' "$t" > "$pkgdir/usr/bin/$name"
    chmod 755 "$pkgdir/usr/bin/$name"
  done
  local _hdc
  _hdc=$(find "$pkgdir/opt/huawei/command-line-tools" -type f -name hdc 2>/dev/null | head -1)
  if [[ -n "$_hdc" ]]; then
    printf '#!/bin/sh\nexec %s "$@"\n' "${_hdc#$pkgdir}" > "$pkgdir/usr/bin/hdc"
    chmod 755 "$pkgdir/usr/bin/hdc"
  fi

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'Huawei Command Line Tools, installed to /opt/huawei/command-line-tools.' \
    '' \
    'Point DevEco CLI at it:' \
    '  export DEVECO_CLI_CLT_PATH=/opt/huawei/command-line-tools' > "$pkgdir/usr/share/doc/$pkgname/README"
}
