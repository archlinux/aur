# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# The HarmonyOS SDK, cut out of Huawei's Command Line Tools archive so the IDE
# and the CLI tools can share one copy instead of keeping two ~5.7 GB trees.
#
# Acquisition matches deveco-commandline-tools: Huawei serves the zip only to
# logged-in users and signs every request, so provide it in one of three ways:
#   * DEVECO_CLT_URL='<signed url>' makepkg -si
#   * or let deveco-clt-url mint one:  deveco-clt-url --login-cookie
#   * or drop commandline-tools-linux-x64-<ver>.zip next to this PKGBUILD
# pkgver tracks the zip it was cut from (see version.txt inside the archive).
pkgname=deveco-sdk
pkgver=26.0.0.865
pkgrel=1
pkgdesc='HarmonyOS SDK for DevEco Studio / Command Line Tools (cut from the CLT archive)'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/download/command-line-tools-for-hmos'
license=('LicenseRef-Huawei-EULA')
depends=('glibc')
options=('!strip')
source=()
sha256sums=()

_zip_glob='commandline-tools-linux-x64-*.zip'

prepare() {
  local f line
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
      error "Command Line Tools archive not found."
      error ""
      error "  Option 1 (automatic, needs a browser session):"
      error "    deveco-clt-url --login-cookie   # then re-run this build"
      error "  Option 2 (manual link): DEVECO_CLT_URL='<signed url>' makepkg -si"
      error "  Option 3 (offline): place commandline-tools-linux-x64-<ver>.zip here"
      return 1
    fi
  fi
  rm -rf "$srcdir/clt"
  mkdir -p "$srcdir/clt"
  bsdtar -xf "$f" -C "$srcdir/clt"
}

package() {
  local _sdk=
  for _cand in "$srcdir/clt/sdk" "$srcdir/clt/command-line-tools/sdk"; do
    [[ -d "$_cand" ]] && _sdk=$_cand
  done
  if [[ -z "$_sdk" ]]; then
    error "no sdk/ directory inside the archive"
    find "$srcdir/clt" -maxdepth 2 -type d | head -10
    return 1
  fi
  install -d "$pkgdir/opt/deveco-sdk"
  cp -a --no-preserve=ownership "$_sdk/." "$pkgdir/opt/deveco-sdk/"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cat > "$pkgdir/usr/share/doc/$pkgname/README" <<'EOF'
HarmonyOS SDK, cut out of the HUAWEI Command Line Tools archive.
Installed to /opt/deveco-sdk; consumers point DEVECO_SDK_HOME / ide.harmonyos.sdk.location here.
EOF
}
