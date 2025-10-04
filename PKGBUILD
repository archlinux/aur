# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.3.9
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
sha512sums=('3bdb2698b7101fddad7f49ed5074d885eadfc7cda472d037f9d6f70376d4b820412e200a951bd5327d599cf0f07dab5beae55cb04c38f6c0c584733187ef55d3'
            '7bf63ab1c6c5330d2f2276de6b8d078cc015433ad53902381ea2428d2ddb5d84fd90454076166e5f3507961482c8a94902faaadc15956d08e255184e116de19f'
            '69d2e58e4f06d4f3810a29d970c7df72c68989eb9371bbd63f4d56561e294c4fddd0a32c3975cd10d532c4125762a2dd64ab4734b36e4628ee382867c04aae90'
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
