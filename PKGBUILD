# Maintainer: ArchLars <aur@larsoyd.com>

pkgname=soundly
pkgver=2026.06.37_20260629.1214
pkgrel=2
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
_archive_sha256='57c5b108e26814a37101a13e585e0e905805963f96280aff856f06824dd32e19'
_terms_sha256='0587c393077596b38045fddb4da29c186b9a04fb492ab4d53a1c37d04c9ef67b'

# Soundly's Terms require these files to be downloaded manually. Before
# building, use a normal web browser to download the Debian / Ubuntu archive
# and the Terms of Use, then place both files beside this PKGBUILD using the
# exact filenames below:
# https://storage.googleapis.com/soundly-linux-release/latest/soundly-linux-latest-deb.zip
# https://getsoundly.com/assets/Soundly-General-Terms-of-Use.pdf
source=(
  'local://soundly-linux-latest-deb.zip'
  'local://Soundly-General-Terms-of-Use.pdf'
)
sha256sums=(
  'SKIP'
  "${_terms_sha256}"
)

verify() {
  local archive='soundly-linux-latest-deb.zip'
  local actual_sha256 archive_pkgver control deb_member
  local -a deb_members deb_versions

  mapfile -t deb_members < <(bsdtar -tf "$archive" | sed -n '/^soundly_[^/]*_amd64\.deb$/p')
  if (( ${#deb_members[@]} != 1 )); then
    printf 'ERROR: expected exactly one soundly_*_amd64.deb in %s, found %s\n' "$archive" "${#deb_members[@]}" >&2
    return 1
  fi
  deb_member=${deb_members[0]}

  set -o pipefail
  if ! control=$(bsdtar -xOf "$archive" "$deb_member" | bsdtar -xOf - 'control.tar.*' | bsdtar -xOf - '*control'); then
    printf 'ERROR: could not read control metadata from %s\n' "${deb_member##*/}" >&2
    return 1
  fi

  mapfile -t deb_versions < <(sed -n 's/^Version:[[:space:]]*//p' <<< "$control")
  if (( ${#deb_versions[@]} != 1 )) || [[ -z ${deb_versions[0]} ]]; then
    printf 'ERROR: expected exactly one Version metadata field in %s\n' "${deb_member##*/}" >&2
    return 1
  fi
  archive_pkgver=${deb_versions[0]//-/_}

  if [[ $archive_pkgver != "$pkgver" ]]; then
    printf 'ERROR: %s contains Soundly %s, but PKGBUILD requires %s; download the current Debian / Ubuntu archive again from https://storage.googleapis.com/soundly-linux-release/latest/soundly-linux-latest-deb.zip\n' "$archive" "${deb_versions[0]}" "$pkgver" >&2
    return 1
  fi

  actual_sha256=$(sha256sum "$archive")
  actual_sha256=${actual_sha256%% *}
  if [[ $actual_sha256 != "$_archive_sha256" ]]; then
    printf 'ERROR: checksum mismatch for %s; download the archive again\n' "$archive" >&2
    return 1
  fi
}

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

  install -Dm644 "$srcdir/Soundly-General-Terms-of-Use.pdf" \
    "$pkgdir/usr/share/licenses/$pkgname/Soundly-Terms-of-Use.pdf"
}
