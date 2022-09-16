# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='Uno Calculator'
_pkgname='uno-calculator'
pkgname="${_pkgname}-bin"
pkgrel=1
pkgdesc='Uno port of Windows Calculator'
arch=('x86_64')
url='https://snapcraft.io/uno-calculator'
_url_source='https://api.snapcraft.io/api/v1/snaps/download'
license=('APACHE')
depends=('hicolor-icon-theme')
makedepends=('gendesk' 'imagemagick' 'squashfs-tools' 'jq' 'curl')
options=('staticlibs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}-x86_64.snap")


# get snap info from snapcraft.io
_snap_stable_pkgs_info="$(curl -sL -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/uno-calculator | jq '.["channel-map"] | .[] | select(.channel.risk == "stable") | select(.channel.architecture == "amd64")')"
pkgver=$(jq -r ".version" <<< "${_snap_stable_pkgs_info}" |  sed "s|-uno||g")
_source_url="$(jq -r '.download.url' <<< "${_snap_stable_pkgs_info}")"
#_source_sha384="$(jq -r '.download | .["sha3-384"]' <<< "${_snap_stable_pkgs_info}")"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.snap::${_source_url}")
sha384sums_x86_64=("SKIP")
unset _source_url _source_sha384


prepare() {
  echo -e "#!/bin/sh\ncd /opt/${_pkgname} && exec ./Calculator.Skia.Gtk \"\$@\"" > "${_pkgname}"
  gendesk -f -n \
    --pkgname="${_pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${_name}" \
    --comment="${pkgdesc}" \
    --exec="${_pkgname}" \
    --icon="${_pkgname}" \
    --categories='Utility'
}

package() {
  mkdir -pv "${pkgdir}/opt/${_pkgname}"
  unsquashfs -force -linfo -dest "${pkgdir}/opt/${_pkgname}" "${_pkgname}-${pkgver}-x86_64.snap"

  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  for i in 16 22 24 32 48 64 96 128; do
    convert "${pkgdir}/opt/${_pkgname}/meta/gui/icon.png" -resize "${i}x${i}" "${srcdir}/icon${i}.png"
    install -Dvm644 "${srcdir}/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  rm -rf "${pkgdir}/opt/${_pkgname}/"{'data-dir','gnome-platform','meta','snap'}
}

# vim: ts=2 sw=2 et:
