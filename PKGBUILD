# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-drova-forsaken-kin
pkgver=1.3.3
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
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  'drova.bash'
)

sha512sums=('9eb269e4c27cc44a50016b309dde9e703a13176f1366c015b616d4e7025b3b6682898c2bad55b6863a0f3f10efc971a0bd100f8e468dd9c655e5e50ffdb308a6'
            '24307f395b6c472264a9e04b043de8d42eb9fb8916f1a165b6ec3836c1ccf8065be1e6ed06197489c79ffcd5c3e74fe099f78d876fb21f07f25d1993d508a8c5'
            'd4ede22ff2c33cbdb24b37a7ec76987c4150d98a134f706c164806a5712a288e297d177b34b336acbbd111c1d5f330480831c576e07350e1ac587c55db7f1c1f')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
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
