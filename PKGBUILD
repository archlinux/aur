# Maintainer: w568w <w568w at outlook dot com>
# Contributor: Ke Zhang <zhangke23 at m dot fudan dot edu dot cn>

pkgname=oleafly-bin
_upstream_name=Oleafly
pkgver=0.4.13
pkgrel=1
pkgdesc='Local-first AI research workspace for LaTeX, Typst, and Markdown (prebuilt)'
arch=('x86_64')
url='https://github.com/Oleafly/Oleafly'
license=(
  'AGPL-3.0-or-later'
  'Apache-2.0'
  'Artistic-2.0 OR GPL-1.0-or-later'
  'GPL-2.0-or-later'
  'MIT'
)
depends=(
  'bash'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'libxcrypt-compat'
  'webkit2gtk-4.1'
)
makedepends=('minisign')
optdepends=(
  'git: project version history, checkpoints, and remote repository sync'
  'python: optional bundled AI research skill scripts'
  'texlive-binextra: external latexmk engine support'
  'texlive-latex: LaTeX format and core packages for external latexmk builds'
)
provides=("oleafly=${pkgver}")
conflicts=('oleafly')
options=('!strip' '!debug')
source=(
  "${_upstream_name}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_upstream_name}_${pkgver}_amd64.deb"
  "${_upstream_name}_${pkgver}_amd64.deb.minisig.b64::${url}/releases/download/v${pkgver}/${_upstream_name}_${pkgver}_amd64.deb.sig"
  "oleafly-${pkgver}-LICENSE::https://raw.githubusercontent.com/Oleafly/Oleafly/v${pkgver}/LICENSE"
  "oleafly-${pkgver}-NOTICE::https://raw.githubusercontent.com/Oleafly/Oleafly/v${pkgver}/NOTICE"
  "oleafly-${pkgver}-THIRD_PARTY_LICENSES.md::https://raw.githubusercontent.com/Oleafly/Oleafly/v${pkgver}/THIRD_PARTY_LICENSES.md"
  'oleafly.pub'
)
noextract=("${_upstream_name}_${pkgver}_amd64.deb")
sha256sums=(
  '57b2449100124dae217518fe474e740ff6b81458990afcc5b7a4a0a0e0e970e4'
  'b137a9a6e8dc2f0fee7826b452756d66e3a11bc3762dc9ac52a4cedc66fee92b'
  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
  '63162ec77d20609025b4dd83ea0d5c4a002488748d4954675e30cf598beadb29'
  '31b64735b1f64e38a107e8631f315d918e9c5eff099114595de62790463d7067'
  'bb414de32bcdfd4cc9de5c2299b2a8c877e32e70e68c3bfebc6d7f6aa104a7dc'
)

prepare() {
  local deb_name="${_upstream_name}_${pkgver}_amd64.deb"
  local sig_b64_name="${deb_name}.minisig.b64"
  local deb_file="${srcdir}/${deb_name}"
  local sig_b64_file="${srcdir}/${sig_b64_name}"
  local pub_file="${srcdir}/oleafly.pub"

  [[ -f "$deb_file" ]] || { printf 'ERROR: Missing DEB payload: %s\n' "$deb_file" >&2; return 1; }
  [[ -f "$sig_b64_file" ]] || { printf 'ERROR: Missing Minisign signature: %s\n' "$sig_b64_file" >&2; return 1; }
  [[ -f "$pub_file" ]] || { printf 'ERROR: Missing pinned Minisign public key: %s\n' "$pub_file" >&2; return 1; }

  local tmp_sig verify_out
  tmp_sig="$(mktemp)"
  if ! base64 -d "$sig_b64_file" > "$tmp_sig"; then
    rm -f "$tmp_sig"
    printf 'ERROR: Failed to decode Base64 Minisign signature: %s\n' "$sig_b64_file" >&2
    return 1
  fi

  if ! verify_out="$(minisign -Vm "$deb_file" -p "$pub_file" -x "$tmp_sig" 2>&1)"; then
    printf '%s\n' "$verify_out" >&2
    rm -f "$tmp_sig"
    printf 'ERROR: Minisign signature verification failed for %s\n' "$deb_name" >&2
    return 1
  fi
  rm -f "$tmp_sig"
  printf '%s\n' "$verify_out"

  local trusted_comment tok has_file=0 has_ver=0
  local -a tokens=()
  trusted_comment="$(awk '/^Trusted comment:[[:space:]]*/ { sub(/^Trusted comment:[[:space:]]*/, ""); print; exit }' <<<"$verify_out")"
  read -r -a tokens <<<"$trusted_comment"
  for tok in "${tokens[@]}"; do
    [[ "$tok" == "file:${deb_name}" ]] && has_file=1
    [[ "$tok" == "version:${pkgver}" ]] && has_ver=1
  done
  if (( ! has_file || ! has_ver )); then
    printf 'ERROR: Minisign trusted comment mismatch for %s (%s)\n' "$deb_name" "$pkgver" >&2
    return 1
  fi

  local ar_dir="${srcdir}/deb-ar"
  local root_dir="${srcdir}/deb-root"

  rm -rf "$ar_dir" "$root_dir"
  mkdir -p "$ar_dir" "$root_dir"

  bsdtar -xf "$deb_file" -C "$ar_dir"

  local data_tar
  data_tar="$(find "$ar_dir" -maxdepth 1 -type f -name 'data.tar*' | head -n 1)"
  [[ -n "$data_tar" ]] || { printf 'ERROR: Could not locate data.tar.* inside %s\n' "$deb_file" >&2; return 1; }

  bsdtar -xf "$data_tar" -C "$root_dir"
}

package() {
  local root="${srcdir}/deb-root"

  # Main executables and co-packaged tectonic-biber (keep upstream /usr/bin layout
  # so oleafly-core resolves ../libexec/oleafly and ../lib/Oleafly/resources)
  install -Dm755 -t "$pkgdir/usr/bin" \
    "$root/usr/bin/oleafly-cli" \
    "$root/usr/bin/oleafly-desktop" \
    "$root/usr/bin/tectonic-biber"

  # Launcher wrapper: default to XWayland when available under Wayland to avoid
  # WebKitGTK 2.54 + GTK3 transparent-window repaint issues, while respecting
  # explicit user GDK_BACKEND overrides.
  install -Dm755 /dev/stdin "$pkgdir/usr/lib/Oleafly/oleafly-desktop-launch" <<'EOF'
#!/bin/sh
if [ -z "${GDK_BACKEND:-}" ] && [ -n "${WAYLAND_DISPLAY:-}" ] && [ -n "${DISPLAY:-}" ]; then
  export GDK_BACKEND=x11
fi
exec /usr/bin/oleafly-desktop "$@"
EOF

  # CLI/GUI dispatcher preserving upstream /usr/bin/oleafly behavior with the
  # same Wayland -> XWayland fallback for GUI launches (including `oleafly open`)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/oleafly" <<'EOF'
#!/bin/sh
if [ -z "${GDK_BACKEND:-}" ] && [ -n "${WAYLAND_DISPLAY:-}" ] && [ -n "${DISPLAY:-}" ]; then
  export GDK_BACKEND=x11
fi
if [ "$#" -eq 0 ]; then
  exec /usr/bin/oleafly-desktop
fi
exec /usr/bin/oleafly-cli "$@"
EOF

  # Bundled compilation engines expected under /usr/libexec/oleafly
  install -Dm755 -t "$pkgdir/usr/libexec/oleafly" \
    "$root/usr/libexec/oleafly/pandoc" \
    "$root/usr/libexec/oleafly/tectonic" \
    "$root/usr/libexec/oleafly/typst"

  # Bundled templates, language server archives, skills, and catalogs
  install -dm755 "$pkgdir/usr/lib/Oleafly"
  cp -r --preserve=mode,timestamps --no-preserve=ownership \
    "$root/usr/lib/Oleafly/resources" \
    "$pkgdir/usr/lib/Oleafly/"

  # Desktop entries and AppStream metainfo
  install -Dm644 -t "$pkgdir/usr/share/applications" \
    "$root/usr/share/applications/Oleafly.desktop" \
    "$root/usr/share/applications/oleafly-url-handler.desktop"
  install -Dm644 -t "$pkgdir/usr/share/metainfo" \
    "$root/usr/share/metainfo/com.oleafly.app.metainfo.xml"

  # File manager integrations (KDE Dolphin KIO service menu & Nemo action)
  install -Dm644 -t "$pkgdir/usr/share/kio/servicemenus" \
    "$root/usr/share/kio/servicemenus/oleafly-open-folder.desktop"
  install -Dm644 -t "$pkgdir/usr/share/nemo/actions" \
    "$root/usr/share/nemo/actions/oleafly-open-folder.nemo_action"

  # Route desktop/file-manager launches through the XWayland-safe launcher
  sed -i 's|^Exec=/usr/bin/oleafly-desktop|Exec=/usr/lib/Oleafly/oleafly-desktop-launch|' \
    "$pkgdir/usr/share/applications/Oleafly.desktop" \
    "$pkgdir/usr/share/applications/oleafly-url-handler.desktop" \
    "$pkgdir/usr/share/kio/servicemenus/oleafly-open-folder.desktop" \
    "$pkgdir/usr/share/nemo/actions/oleafly-open-folder.nemo_action"

  # Hicolor application icons
  local size
  for size in 32x32 64x64 128x128 256x256 256x256@2 512x512; do
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/${size}/apps" \
      "$root/usr/share/icons/hicolor/${size}/apps/oleafly-desktop.png"
  done

  # Upstream AGPL-3.0-or-later license, attribution notice, and third-party license notices
  install -Dm644 "$srcdir/oleafly-${pkgver}-LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/oleafly-${pkgver}-NOTICE" \
    "$pkgdir/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 "$srcdir/oleafly-${pkgver}-THIRD_PARTY_LICENSES.md" \
    "$pkgdir/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES.md"
  find "$root/usr/lib/Oleafly/resources/licenses" -maxdepth 1 -type f \
    -exec install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}/third-party" {} +
}
