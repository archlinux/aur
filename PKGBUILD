# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='natron'
pkgname="${_pkgname}-bin"
pkgver=2.4.0
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
conflicts=("${_pkgname}-compositor" "${_pkgname}-compositor-git")
noextract=("${_pkgname}-${pkgver}.tar.xz")
source=("${_pkgname}-${pkgver}.tar.xz::${_url_source}/releases/download/v${pkgver}/${_pkgname^}-${pkgver}-Linux-64-no-installer.tar.xz")
sha512sums=('416b166caf0d41131116adab3db4f0b5b5a2d5a5c79f5ffdaa6b8f0f54fef7ad79b34a70a0cae24271827340627298f113e3a8897f40d2f9fbef7a5d8e4c6a5b')

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
