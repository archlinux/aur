# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# Huawei serves Command Line Tools behind a logged-in download page whose URL is
# signature-bearing and rotates per session, so no public, stable URL exists and
# the source list is intentionally empty. Provide the archive at build time:
#
#   1. install the helper once and sign in once:
#        yay -S deveco-clt-url && deveco-clt-url --login-cookie
#   2. build; prepare() asks the helper for a signed URL automatically
#      (or pass one yourself: DEVECO_CLT_URL='<signed url>' makepkg -si,
#       or drop commandline-tools-linux-x64-<ver>.zip next to this PKGBUILD)
#
# The helper only mints a link for a session you already created in a browser;
# it is an optional convenience, not a build dependency.
#
# pkgver() derives the real version from the archive filename, so this PKGBUILD
# does not have to be edited for every upstream release.
pkgname=deveco-commandline-tools
pkgver=26.0.1.290
pkgrel=8
pkgdesc='HUAWEI Command Line Tools for HarmonyOS: hvigorw, ohpm, hstack, codelinter, SDK tools'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/command-line-tools-for-hmos'
license=('LicenseRef-Huawei-EULA')
depends=('glibc' 'java-runtime' 'nodejs')
optdepends=('deveco-clt-url: mint the signed download URL from a logged-in session')
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
  local zip f line
  local url=${DEVECO_CLT_URL:-}
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -n "$f" ]] && ! bsdtar -tf "$f" >/dev/null 2>&1; then
    warn "cached $(basename "$f") is truncated or corrupt; discarding it"
    rm -f "$f"
    f=
  fi
  if [[ -z "$f" ]]; then
    if [[ -z "$url" ]] && command -v deveco-clt-url >/dev/null 2>&1; then
      msg "DEVECO_CLT_URL is not set; asking deveco-clt-url for a signed link"
      if ! url=$(deveco-clt-url --version "$pkgver" 2>"$srcdir/deveco-clt-url.err"); then
        error "deveco-clt-url could not mint a download URL for $pkgver:"
        while IFS= read -r line; do error "  $line"; done < <(head -4 "$srcdir/deveco-clt-url.err")
        error "  sign in at https://developer.huawei.com/consumer/cn/download/command-line-tools-for-hmos"
        error "  then run: deveco-clt-url --login-cookie"
        return 1
      fi
      url=${url%%$'\n'*}
      [[ -n "$url" ]] || { error "deveco-clt-url returned an empty URL"; return 1; }
      msg "deveco-clt-url: got a signed URL"
    fi
    if [[ -n "$url" ]]; then
      f="$srcdir/$(basename "${url%%\?*}")"
      [[ "$f" == *.zip ]] || f="$srcdir/commandline-tools-linux-x64.zip"
      [[ "$(basename "$f")" == *"$pkgver"* ]] || warn "archive name does not mention pkgver $pkgver"
      msg "fetching $(basename "$f")"
      curl -fL --retry 3 -o "$f" "$url" || { error "download failed"; return 1; }
      bsdtar -tf "$f" >/dev/null 2>&1 || { error "downloaded archive is not a valid zip: $(basename "$f")"; return 1; }
    else
      error "No Command Line Tools archive found."
      error ""
      error "  Option 1 (automatic, needs a session created in a browser):"
      error "    yay -S deveco-clt-url"
      error "    deveco-clt-url --login-cookie   # paste the Cookie header from DevTools"
      error "    then re-run this build."
      error "  Option 2 (manual link):"
      error "    DEVECO_CLT_URL='<signed url>' makepkg -si"
      error "  Option 3 (offline): place commandline-tools-linux-x64-<ver>.zip here."
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
