# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

## options
: ${_autoupdate:=true}

_pkgname=eglantine
pkgname=eglantine-daily-pgo-bin
pkgver=20261112
pkgrel=1
pkgdesc="The Eglantine Nintendo Switch 2 emulator AppImage (PGO build)."
arch=('x86_64')
url="https://github.com/Djihads80/Eglantine"
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme')
makedepends=('clang' 'curl' 'gcc')
conflicts=('eglantine' 'eglantine-bin' 'eglantine-pgo-bin' 'eglantine-git')
provides=('eglantine')
options=('!strip' '!debug')

_source_main() {
  _appimage="${pkgname}-${pkgver}.AppImage"
  source_x86_64=(
    "${_appimage}::${url}/releases/download/daily-${pkgver}/eglantine-linux-x86_64-pgo.AppImage"
  )
sha256sums_x86_64=('181674e62a32ab48ad8fef3f77c2fab7058f21fda0c2facdebd6476f5378511d')
}

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  _desktop=$(find squashfs-root -maxdepth 1 -name "*.desktop" -print -quit)
  if [[ -n "$_desktop" ]]; then
    sed -i \
      -e "s|^Exec=.*|Exec=/usr/bin/eglantine|" \
      -e "s|^Icon=.*|Icon=eglantine|" \
      -e "s|^TryExec=.*|TryExec=eglantine|" \
      "$_desktop"
    install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/eglantine.desktop"
  fi

  _icon=$(find squashfs-root -maxdepth 1 \( -name "*.svg" -o -name "*.png" \) -print -quit)
  if [[ -n "$_icon" ]]; then
    _ext="${_icon##*.}"
    install -Dm644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eglantine.${_ext}"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/eglantine"
}

_update_version() {
  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response _pkgver_new
  _response=$(curl -Ssf "${url}/releases.atom" 2>/dev/null)

  # Extract release tags matching 'daily-YYYYMMDD' and pick the newest tag date
  _pkgver_new=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/daily-' \
      | sed -E 's@^.*/releases/tag/daily-([0-9]+)".*$@\1@' \
      | sort -rV \
      | head -n 1
  )

  if [[ -n "$_pkgver_new" ]] && [ $(vercmp "$_pkgver_new" "$pkgver") -gt 0 ]; then
    pkgver="$_pkgver_new"
  fi
}

# Auto-update version from GitHub releases, then set source arrays
_update_version
_source_main
