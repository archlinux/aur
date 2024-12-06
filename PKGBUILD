# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-drova-forsaken-kin
pkgver=1.1.5.78258
pkgrel=1
pkgdesc='Pixel art action RPG inspired by Celtic mythology and Gothic. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
  'zlib'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver%.*}_(${pkgver##*.}).sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  'drova.bash'
)

sha512sums=(
  '06e4237630b79d391f94b792b5423dd82db8695af9d93648508c0fc44470fa802a8ed33f3d70debb73ca76eb74eda545f03b92e8b5a4ef1b80ac9a5df963846f'
  '24307f395b6c472264a9e04b043de8d42eb9fb8916f1a165b6ec3836c1ccf8065be1e6ed06197489c79ffcd5c3e74fe099f78d876fb21f07f25d1993d508a8c5'
  '403cf1f0ebaf960e635b54b8c5650493612d41f5bd48fb05bbde1db192cc2e1476449283e764139e2704d7cb7e35e0c272a9d378a0a5b8311ba7207310dcafde'
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
    "${srcdir}"/data/noarch/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "${srcdir}/drova.bash" \
    "${pkgdir}/usr/bin/drova"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
