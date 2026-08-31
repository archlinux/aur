# Maintainer: ArchLars <aur@larsoyd.com>

pkgname=soundly
pkgver=2026.06.37_20260629.1214
pkgrel=1
pkgdesc='Sound effects search, audio editor and library manager'
arch=('x86_64')
url='https://getsoundly.com'
license=('LicenseRef-Soundly')
depends=(
  'alsa-lib'
  'bash'
  'desktop-file-utils'
  'glibc'
  'hicolor-icon-theme'
  'krb5'
  'libxcb'
  'libxkbcommon-x11'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
optdepends=(
  'kdotool: one-click spotting into Kdenlive and Studio One on Wayland'
  'wl-clipboard: one-click spotting into Kdenlive and Studio One on Wayland'
  'wmctrl: raise REAPER, DaVinci Resolve, or Ardour after spotting'
)
options=('!strip')
_source_url='https://storage.googleapis.com/soundly-linux-release/latest/soundly-linux-latest-deb.zip'
_terms_url='https://getsoundly.com/assets/Soundly-General-Terms-of-Use.pdf'
_archive_sha256='57c5b108e26814a37101a13e585e0e905805963f96280aff856f06824dd32e19'
_terms_sha256='0587c393077596b38045fddb4da29c186b9a04fb492ab4d53a1c37d04c9ef67b'
source=(
  "soundly-${pkgver}.zip::${_source_url}"
  "Soundly-Terms-of-Use.pdf::${_terms_url}"
)
sha256sums=(
  "${_archive_sha256}"
  "${_terms_sha256}"
)

package() {
  local deb data_member
  local -a debs data_members

  mapfile -t debs < <(find "$srcdir" -maxdepth 1 -type f -name 'soundly_*_amd64.deb' -print)
  if (( ${#debs[@]} != 1 )); then
    printf 'ERROR: expected exactly one soundly_*_amd64.deb, found %s\n' "${#debs[@]}" >&2
    return 1
  fi
  deb=${debs[0]}

  mapfile -t data_members < <(bsdtar -tf "$deb" | sed -n '/^data\.tar\./p')
  if (( ${#data_members[@]} != 1 )); then
    printf 'ERROR: expected exactly one data.tar archive in %s\n' "${deb##*/}" >&2
    return 1
  fi
  data_member=${data_members[0]}

  set -o pipefail
  bsdtar -xOf "$deb" "$data_member" | bsdtar -xf - -C "$pkgdir"

  install -Dm644 "$srcdir/Soundly-Terms-of-Use.pdf" \
    "$pkgdir/usr/share/licenses/$pkgname/Soundly-Terms-of-Use.pdf"
}
