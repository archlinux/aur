# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-through-the-darkest-of-times
pkgver=1.04.03.1.40068
pkgrel=1
pkgdesc='Historical resistance strategy game set in the Third Reich. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.gog.com/game/through_the_darkest_of_times'
license=('custom')
depends=('wine' 'wine-mono' 'wine-gecko')
makedepends=('innoextract' 'imagemagick' 'lgogdownloader')
options=('!strip')
install="${pkgname}.install"

source=(
  "setup_through_the_darkest_of_times_${pkgver%.*}_(${pkgver##*.}).exe`
    `::gogdownloader://through_the_darkest_of_times/en1installer0"
  "${pkgname}.desktop"
  "launch_${pkgname}.bash"
)

sha512sums=(
  '818a1c425838cdbaf2b4d6ce87e2bab2d2e16c810d86ed089d1e0e51e09f3e1173822ea43d748fd6952dd03b4ff18a3da9391e9d3f2edfc4a97ab72f52dbaefd'
  'ba2f232ce143e1adf07ba178e2f69a07a16be4520777b78e2757a9b3a0005111526dc035ce7eba160651d5c846b474753db606507cee6f0a22872d27778d6b37'
  'd2266ebfc03f36bd84abd5a643ea8eedd8b9d9b1a6c7c5b1024dd477f82fbf69c69699359e318fb908282803f9045ab09dbb356f45e689bf50fc108cc894d172'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  mkdir -p "${srcdir}/${pkgname#gog-}"
  cd "${srcdir}/${pkgname#gog-}"
  innoextract -c -m --progress=1 \
    "${srcdir}/setup_through_the_darkest_of_times_${pkgver%.*}_(${pkgver##*.}).exe"
}

package() {
  echo >&2 'Querying GOG ID'
  _gog_id="$(
    innoextract -s --gog-game-id \
      "${srcdir}/setup_through_the_darkest_of_times_${pkgver%.*}_(${pkgver##*.}).exe"
  )"

  echo >&2 'Packaging game icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  # The compressed .ico consists of 7 pixmaps of different sizes.
  # Last image in the sequence is scaled up from a smaller icon
  # and therefore blurry, so pick the largest non-blurry icon.
  convert -delete 0,1,2,3,4,6 \
    "${srcdir}/${pkgname#gog-}/app/goggame-${_gog_id?}.ico" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  rm -rf \
    "${srcdir}/${pkgname#gog-}/app" \
    "${srcdir}/${pkgname#gog-}/commonappdata" \
    "${srcdir}/${pkgname#gog-}/__redist"
  mkdir -p "${pkgdir}/opt/"
  mv "${srcdir}/${pkgname#gog-}" "${pkgdir}/opt/${pkgname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/launch_${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname#gog-}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
