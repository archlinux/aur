# Maintainer: Card38753 <cccc38753@gmail.com>
pkgname=lazytyper-bin
_pkgname=LazyTyper
pkgver=1.8.7
_upstream_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="LazyTyper desktop client for AI dictation and transcription (official DEB repack)"
arch=('x86_64')
url="https://lazytyper.com"
_ghurl="https://github.com/oldcai/LazyTyper-releases"
license=('proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'alsa-lib' 'xdotool')
makedepends=('patchelf')
provides=("lazytyper=${pkgver}")
conflicts=('lazytyper' 'lazytyper-git' 'lazytyper-appimage')
options=(!strip)
source_x86_64=(
  "${_pkgname}-${_upstream_pkgver}-x86_64.deb::${_ghurl}/releases/download/v${_upstream_pkgver}-linux/LazyTyper_${_upstream_pkgver}_amd64.deb"
)
sha256sums_x86_64=('82a4ba7905ed450492a8f73f5878d2ca23a7a83fd2afaba25c79e0d677980b12')

package() {
  local deb_file="${srcdir}/${_pkgname}-${_upstream_pkgver}-x86_64.deb"
  local extract_dir="${srcdir}/deb-extract"

  rm -rf "${extract_dir}"
  install -d "${extract_dir}"
  bsdtar -xf "${deb_file}" -C "${extract_dir}"

  local data_tar
  data_tar="$(find "${extract_dir}" -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "${data_tar}" ]]; then
    echo "data.tar archive not found in ${deb_file}" >&2
    return 1
  fi
  bsdtar -xf "${data_tar}" -C "${pkgdir}"
  patchelf --replace-needed libxdo.so.3 libxdo.so.4 "${pkgdir}/usr/bin/LazyTyper"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/lazytyper" <<'EOF'
#!/usr/bin/env bash
export LD_LIBRARY_PATH="/usr/lib/LazyTyper${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

# Arch uses /usr/lib/webkit2gtk-4.1, while some upstream binaries may probe
# Debian multiarch paths first. Exporting WEBKIT_EXEC_PATH avoids runtime lookup issues.
if [[ -d /usr/lib/webkit2gtk-4.1 ]]; then
  export WEBKIT_EXEC_PATH="/usr/lib/webkit2gtk-4.1"
elif [[ -d /usr/lib/x86_64-linux-gnu/webkit2gtk-4.1 ]]; then
  export WEBKIT_EXEC_PATH="/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
fi

exec /usr/bin/LazyTyper "$@"
EOF

  if [[ -f "${pkgdir}/usr/share/applications/LazyTyper.desktop" ]]; then
    mv "${pkgdir}/usr/share/applications/LazyTyper.desktop" \
      "${pkgdir}/usr/share/applications/lazytyper.desktop"
    sed -i 's|^Exec=.*|Exec=/usr/bin/lazytyper|' \
      "${pkgdir}/usr/share/applications/lazytyper.desktop"
    sed -i 's|^Icon=.*|Icon=lazytyper|' \
      "${pkgdir}/usr/share/applications/lazytyper.desktop"
  fi

  for size in 32x32 128x128 256x256@2; do
    if [[ -f "${pkgdir}/usr/share/icons/hicolor/${size}/apps/LazyTyper.png" ]]; then
      install -Dm644 "${pkgdir}/usr/share/icons/hicolor/${size}/apps/LazyTyper.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/lazytyper.png"
    fi
  done
}
