# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.3.4
pkgrel=1
pkgdesc='Contra-esque action game with retro cartoon visuals. GOG version, uses Wine.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=('bash' 'wine' 'wine-mono' 'wine-gecko')
makedepends=('imagemagick' 'innoextract' 'lgogdownloader')
optdepends=('gog-cuphead-the-delicious-last-course: The Delicious Last Course DLC')
options=('!debug' '!strip')
install="${pkgname}.install"
source=(
    "setup_${_shortname}_${pkgver//./_}.exe::gogdownloader://${_shortname}/en1installer0"
    "setup_${_shortname}_${pkgver//./_}-1.bin::gogdownloader://${_shortname}/en1installer1"
    'launch_gog-cuphead.bash'
    'gog-cuphead.desktop'
)
sha512sums=('0d2689dfe47ab38257d43cdc5b4d09300a9b8e0c117bd0d2075584d8b8a4a9876b7e3b3ec535021a09ef403017887b160e6a7cdd0929e7fd3d726a91846cfe40'
            '200f503b8aa32e60a034e21c1b1ada5df2c9273d082545b408f3ccd8b216d8ef79246ce164cea2b498900602641eb47868f02d141eeb7bc0304e86fe1e88f70b'
            '090081b2e86fa38a3b5d3d8f97dbc21abfe1450a895cd6bfae5b66361963ea697cb8e8f82af1594ae75804ac475196989e4afca489513c2d7a47c73d02667ca2'
            'fed3afa22b61cd16241d1cec4057f998b5d1db93659e6c45a8f6d58101fc5ba18e8de65e4170e69d615d881dae2d4643ebc7452f4399c6f87b5cda099722a003')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

_gog_id='1963513391'

prepare() {
  mkdir -p "${_shortname}"
  cd "${_shortname}"
  innoextract -c -m --progress=1 "../setup_${_shortname}_${pkgver//./_}.exe"
}

package() {
  echo >&2 'Packaging game icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  # The compressed .ico consists of 7 pixmaps of different sizes.
  # Last image in the sequence is scaled up from a smaller icon
  # and therefore blurry, so pick the largest non-blurry icon.
  magick \
    "${srcdir}/${_shortname}/app/goggame-${_gog_id}.ico" \
    -delete 0,1,2,3,4,6 \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  rm -rf \
    "${srcdir}/${_shortname}/app" \
    "${srcdir}/${_shortname}/commonappdata" \
    "${srcdir}/${_shortname}/__redist"
  mkdir -p "${pkgdir}/opt/"
  mv "${srcdir}/${_shortname}" "${pkgdir}/opt/${pkgname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/launch_${pkgname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
