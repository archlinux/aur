# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='Uno Calculator'
_pkgname='uno-calculator'
pkgname="${_pkgname}-bin"

pkgver=1.2.4.725
pkgrel=1
_snap_id='ZZjSue7jjdQXHsNz5RI9BH3Pf3UnRo0V_15'

pkgdesc='Uno port of Windows Calculator'
arch=('x86_64')
url='https://platform.uno/blog/windows-calculator-on-linux-via-uno-platform/'
_url_source='https://api.snapcraft.io/api/v1/snaps/download'
license=('APACHE')
depends=('hicolor-icon-theme')
makedepends=('gendesk' 'imagemagick' 'squashfs-tools')
options=('staticlibs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}-x86_64.snap")

# https://snapcraft.io/uno-calculator
# curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/uno-calculator | jq
source_x86_64=("${_pkgname}-${pkgver}-x86_64.snap::${_url_source}/${_snap_id}.snap")
sha256sums_x86_64=('dbeef8687f3fa4404bd35f57aa4c86034f89d89f71fab0152e69817f16ed5c03')

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
