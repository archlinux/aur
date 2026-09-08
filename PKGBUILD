# Maintainer: terpinedream
# Parallel AUR packaging of Bashd. Scripts come from a GitHub tag of main;
# this PKGBUILD keeps Arch paths (/usr/share/bashd, profile.d, PATH wrappers).
# Do not use `make install` here.

pkgname=bashd
pkgver=2.0.1
pkgrel=1
pkgdesc="Bash helper toolkit for file organization, renaming, and navigation"
arch=('any')
url="https://github.com/terpinedream/Bashd"
license=('GPL-3.0-only')
depends=('bash' 'coreutils')
optdepends=(
  'figlet: ASCII headers for bashd --chart'
  'wl-clipboard: clipboard on Wayland'
  'xclip: clipboard on X11'
  'xsel: clipboard on X11'
  'openssh: archive / pullfrom / pushto'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('953d388936505b30ac77c5045bb446d11a00984fc5faff180c2d37a8aacf25cd')

_repo="Bashd"

package() {
  local _bd="${srcdir}/${_repo}-${pkgver}"
  if [[ ! -d "$_bd" ]]; then
    _bd=$(find "$srcdir" -maxdepth 1 -type d ! -path "$srcdir" | head -1)
  fi

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bashd/core"
  install -d "${pkgdir}/usr/share/bashd/helpers"
  install -d "${pkgdir}/usr/share/bashd/extra"

  install -Dm755 "${_bd}/scripts/bashd" "${pkgdir}/usr/bin/bashd"
  install -Dm644 "${_bd}/scripts/bashd-init.sh" "${pkgdir}/usr/share/bashd/bashd-init.sh"
  local _lib
  for _lib in _bashd_log _bashd_files _bashd_clip _bashd_remote; do
    install -Dm644 "${_bd}/scripts/${_lib}" "${pkgdir}/usr/share/bashd/${_lib}"
  done

  local _f
  for _f in "${_bd}/scripts/core/"*; do
    install -Dm755 "$_f" "${pkgdir}/usr/share/bashd/core/$(basename "$_f")"
  done
  for _f in "${_bd}/scripts/helpers/"*; do
    install -Dm755 "$_f" "${pkgdir}/usr/share/bashd/helpers/$(basename "$_f")"
  done
  for _f in "${_bd}/scripts/extra/"*; do
    install -Dm755 "$_f" "${pkgdir}/usr/share/bashd/extra/$(basename "$_f")"
  done

  install -Dm644 "${_bd}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # PATH wrappers so core/extra commands work without aliases.
  # CD helpers (hop, crush, …) stay out of /usr/bin — they need bashd-init.sh.
  _wrap() {
    printf '#!/bin/sh\nexec bashd %s "$@"\n' "$1" > "${pkgdir}/usr/bin/$2"
    chmod 755 "${pkgdir}/usr/bin/$2"
  }
  for _f in "${pkgdir}/usr/share/bashd/core/"* "${pkgdir}/usr/share/bashd/extra/"*; do
    _wrap "$(basename "$_f")" "$(basename "$_f")"
  done

  # Compat names from the 0.1.x AUR package
  _wrap pfx prefix
  _wrap wrap bfold
  _wrap wrap cram
  _wrap uwrap ufold

  install -d "${pkgdir}/etc/profile.d"
  printf '%s\n' '[ -f /usr/share/bashd/bashd-init.sh ] && . /usr/share/bashd/bashd-init.sh' \
    > "${pkgdir}/etc/profile.d/bashd.sh"
  chmod 644 "${pkgdir}/etc/profile.d/bashd.sh"
}
