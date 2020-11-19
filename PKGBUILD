# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='natron'
pkgname="${_pkgname}-bin"
_pkgver=2.3.15
pkgver=2.3.15.1
pkgrel=1
pkgdesc='Node-graph video compositor'
arch=('x86_64')
url='https://natrongithub.github.io'
_url_source='https://github.com/NatronGitHub/Natron'
license=('GPL2')
depends=('glu' 'hicolor-icon-theme')
makedepends=('gendesk' 'imagemagick')
options=('!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}.tar.xz")
source=("${_pkgname}-${pkgver}.tar.xz::${_url_source}/releases/download/v${_pkgver}/${_pkgname^}-${pkgver}-Linux-64-no-installer.tar.xz")
sha256sums=('3d5dd363382dfaae52b6868ec5a2a4baa7bba1226a8c0f76201e1849d9fb8cb9')

prepare() {
  gendesk -f -n \
    --pkgname="${_pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${_pkgname^}" \
    --comment="${pkgdesc}" \
    --exec="${_pkgname^}" \
    --icon="${_pkgname}" \
    --categories='Graphics' \
    --mimetypes='application/x-natron'

  cat << EOF > "x-${_pkgname}.xml"
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-${_pkgname}">
    <comment>${_pkgname^} Project File</comment>
    <icon name="${_pkgname}"/>
    <glob-deleteall/>
    <glob pattern="*.ntp"/>
  </mime-type>
</mime-info>
EOF
}

package() {
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dvm644 "x-${_pkgname}.xml" -t "${pkgdir}/usr/share/mime/application"

  install -dv "${pkgdir}/"{"opt/${_pkgname}",'usr/bin'}
  tar -xvf "${_pkgname}-${pkgver}.tar.xz" --strip-components=1 -C "${pkgdir}/opt/${_pkgname}"
  ln -sfv "/opt/${_pkgname}/${_pkgname^}" -t "${pkgdir}/usr/bin"

  for i in 16 22 24 32 48 64 96 128 256; do
    convert "${pkgdir}/opt/${_pkgname}/Resources/pixmaps/${_pkgname}Icon256_linux.png" \
      -resize "${i}x${i}" "${srcdir}/icon_app${i}.png"
    install -Dvm644 "${srcdir}/icon_app${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
  for i in 16 22 24 32 48 64 96 128 256; do
    convert "${pkgdir}/opt/${_pkgname}/Resources/pixmaps/${_pkgname}ProjectIcon_linux.png" \
      -resize "${i}x${i}" "${srcdir}/icon_mime${i}.png"
    install -Dvm644 "${srcdir}/icon_mime${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/${_pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
