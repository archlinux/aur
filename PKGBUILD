# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-powers-in-the-basement
pkgver=1.2.2.70665
pkgrel=1
pkgdesc='Point-and-click adventure, reminiscent of 80s and 90s classics. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-EULA')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
)
makedepends=('lgogdownloader')
options=('!strip')

source=(
  "${_shortname}_latest.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '2b94fff8bbe727317fed009fd312fa5ef05b0f898fe38edb21f553b934314aeb8747c15032b204c9b324ced4eca05c299b330a8ecb64d72171573ae6fdf7b9a4'
  '87c314fa56aca96bda633cfb469b7ee37ac30169f66b4487867fcad96993f57f66af4e709da8aad7969e8cdaac30cdf368cb66ca3e1844128b5404405d6bcc77'
  '3f19f5f8af4c69655fdfa8355f87263b9a96fc9b04c20575cc0ccb8e7c132e3fa28a8f3f26f47d526541e0204e181d923c82862e3bcbebe131220743feaa79d1'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/support/yad/32"
}

package() {
  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"

  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${_shortname}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/game/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
