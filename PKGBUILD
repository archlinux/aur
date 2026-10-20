# Maintainer: Ishan Parihar <ishanp at protonmail dot com>
pkgname=neverwrite-bin
pkgver=0.8.13
pkgrel=1
pkgdesc='The bastard son between Cursor and Obsidian - local-first knowledge workspace with AI'
arch=('x86_64')
url='https://neverwrite.app/'
license=('Apache-2.0')
depends=('alsa-lib' 'at-spi2-core' 'avahi' 'brotli' 'bzip2' 'cairo' 'dbus'
         'expat' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'glib2'
         'glycin' 'gmp' 'gnutls' 'graphite' 'gtk3' 'harfbuzz' 'icu' 'json-glib'
         'leancrypto' 'libcloudproviders' 'libcups' 'libdatrie' 'libdrm'
         'libepoxy' 'libffi' 'libgcc' 'libidn2' 'libp11-kit' 'libpng' 'libseccomp'
         'libstdc++' 'libtasn1' 'libthai' 'libunistring' 'libx11' 'libxau'
         'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext'
         'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxml2' 'libxrandr'
         'libxrender' 'mesa' 'nettle' 'nspr' 'nss' 'pango' 'pcre2' 'pixman'
         'sqlite' 'systemd-libs' 'tinysparql' 'util-linux-libs' 'wayland' 'zlib')
# The AppImage bundles its own Electron runtime and GTK/indicator plugins, so
# only the host libraries above are needed. fuse2/squashfuse are NOT required:
# the AppImage is installed unpacked-free via its embedded runtime.
optdepends=('libappindicator-gtk3: Tray icon support')
options=('!strip')
# Dummy VCS source so `yay -Syu` (devel:true) re-runs pkgver() every time.
source=("neverwrite-bin::git+https://aur.archlinux.org/neverwrite-bin.git"
        "neverwrite.desktop"
        "neverwrite.png")
sha256sums=('SKIP'
            '60e38a4b29806b1ab79b3db9afb90a4d27dadf89cff0311b3cf48bc900be4bcc'
            '6f201da8de1e9c712ef751a88470d4f83a5baf2b111329b0c589fb4a892a508f')
makedepends=('curl' 'git')

pkgver() {
  # Resolve the newest release WITHOUT the GitHub API.
  # The API allows only 60 requests/hour per IP unauthenticated; when that
  # quota is exhausted it returns a JSON error instead of a tag, and the old
  # implementation silently fell back to a hardcoded version. The
  # releases/latest redirect needs no auth and consumes no quota.
  #
  # Fallback chain: redirect -> API (with token if available) -> hardcoded.
  local _tag

  _tag=$(curl -fsSL -o /dev/null -w '%{url_effective}' \
    "https://github.com/jsgrrchg/NeverWrite/releases/latest" 2>/dev/null \
    | sed -n 's|.*/tag/v||p')

  if [[ -z "$_tag" ]]; then
    local _hdr=()
    [[ -n "${GH_TOKEN:-}" ]] && _hdr=(-H "Authorization: Bearer $GH_TOKEN")
    _tag=$(curl -fsSL "${_hdr[@]}" \
      "https://api.github.com/repos/jsgrrchg/NeverWrite/releases/latest" 2>/dev/null \
      | jq -r '.tag_name' 2>/dev/null | sed 's|^v||')
  fi

  if [[ -n "$_tag" && "$_tag" != "null" ]]; then
    printf "%s" "$_tag"
  else
    printf "%s" "0.3.6"
  fi
}

prepare() {
  # makepkg runs prepare() BEFORE pkgver(), so ${pkgver} is still the static
  # fallback here. Resolve the current upstream version ourselves.
  local _ver
  _ver=$(
    curl -fsSL -o /dev/null -w '%{url_effective}' \
      "https://github.com/jsgrrchg/NeverWrite/releases/latest" 2>/dev/null \
      | sed -n 's|.*/tag/v||p'
  )
  [[ -z "$_ver" ]] && _ver=$(
    curl -fsSL "https://api.github.com/repos/jsgrrchg/NeverWrite/releases/latest" 2>/dev/null \
      | jq -r '.tag_name' 2>/dev/null | sed 's|^v||'
  )
  [[ -z "$_ver" || "$_ver" == "null" ]] && _ver="0.3.6"

  local _img="NeverWrite-${_ver}-x64.AppImage"
  local _url="https://github.com/jsgrrchg/NeverWrite/releases/download/v${_ver}/${_img}"
  local _hdr=()
  [[ -n "${GH_TOKEN:-}" ]] && _hdr=(-H "Authorization: Bearer $GH_TOKEN")

  # The API is best-effort only (it can be rate-limited); the direct release
  # download URL always works and is the fallback.
  local _api
  _api=$(curl -fsSL "${_hdr[@]}" \
    "https://api.github.com/repos/jsgrrchg/NeverWrite/releases/tags/v${_ver}" 2>/dev/null \
    | jq -r --arg n "$_img" '.assets[]? | select(.name==$n) | .browser_download_url' 2>/dev/null)

  local _urls=()
  [[ -n "$_api" && "$_api" != "null" ]] && _urls+=("$_api")
  _urls+=("$_url")

  # Reuse a cached copy only if it is a valid AppImage (ELF magic).
  if [[ -f "$srcdir/$_img" ]] && head -c4 "$srcdir/$_img" | grep -q $'\x7f''ELF'; then
    echo "Using cached $_img"
  else
    rm -f "$srcdir"/NeverWrite-*-x64.AppImage 2>/dev/null || true
    local _fetched=0 _u
    for _u in "${_urls[@]}"; do
      echo "Trying $_u ..."
      if curl -fL -o "$srcdir/$_img" "$_u"; then
        if head -c4 "$srcdir/$_img" | grep -q $'\x7f''ELF'; then
          echo "Fetched $_img successfully"
          _fetched=1
          break
        else
          echo "Not an ELF binary, trying next"
          rm -f "$srcdir/$_img"
        fi
      else
        echo "curl failed, trying next"
        rm -f "$srcdir/$_img"
      fi
    done
    [[ $_fetched -eq 1 ]] || { echo "ERROR: failed to fetch $_img" >&2; exit 1; }
  fi

  chmod +x "$srcdir/$_img"
  echo "==> prepared neverwrite $_ver"
}

package() {
  local _img="NeverWrite-${pkgver}-x64.AppImage"

  # Install the AppImage
  install -Dm755 "$srcdir/$_img" "${pkgdir}/opt/neverwrite/${_img}"
  # Create wrapper script
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/neverwrite" <<EOF
#!/bin/sh
exec /opt/neverwrite/${_img} "\$@"
EOF

  # Install desktop file
  install -Dm644 "$srcdir/neverwrite.desktop" "${pkgdir}/usr/share/applications/neverwrite.desktop"

  # Install icon
  install -Dm644 "$srcdir/neverwrite.png" "${pkgdir}/usr/share/pixmaps/neverwrite.png"
}
