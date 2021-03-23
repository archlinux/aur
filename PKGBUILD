# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Severen Redwood <severen@shrike.me>

pkgname='ttf-monoid'
pkgver=0.61
pkgrel=6
pkgdesc='A customisable coding font'
arch=('any')
license=('MIT' 'custom:OFL')
depends=('fontconfig')
makedepends=('fontforge' 'python')
url='https://github.com/larsenwork/monoid'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "fontbuilder-python3.patch")
sha512sums=('2acae11b3d0a86ac1d0588de986fbcf13a83bdcb857b0eb1deaeae55615fdccbfd8f19b5618ee61abd1261c3f203cadcaa7b37f44f535a3fe462240602ab51dc'
            '7f06b8827ed12b3070512ae58424b92a05635eefe0dee0d6314f1b92230f431e2fde5a2d70adbff324bbcb4ce70b135ccda2a6dfaaeb7b6e4219a447034f00c0')

prepare () {
  cd "monoid-${pkgver}"

  # extract LICENSE from README
  sed -n '/Monoid is dual licensed/,/OTHER DEALINGS IN THE FONT SOFTWARE./p' \
    'Readme.md' > \
    'LICENSE'

  # patch fontbuilder script
  cd "Scripts"
  patch -sp1 < "${srcdir}/fontbuilder-python3.patch"
}

build () {
  cd "monoid-${pkgver}"

  # ensure python can find fontbuilder module
  export PYTHONPATH="$(pwd)/Scripts"

  # list of fonts to build
  # note: Monoid-Diacritic variants are buggy, so they are skipped
  FONT_FILES=(
    "Source/Monoid.sfdir"
    "Source/Monoid-Bold.sfdir"
    "Source/Monoid-Italic.sfdir"
    "Source/Monoid-Retina.sfdir"
    "Monoisome/Monoisome.sfdir"
  )

  # build fonts
  for FONT_FILE in "${FONT_FILES[@]}"; do
    python3 -c "import fontbuilder; fontbuilder.build('_build', '"${FONT_FILE}"');"
  done
}

package () {
  cd "monoid-${pkgver}"

  # create directories
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"

  # fonts
  install -m644 _build/*.ttf "${pkgdir}/usr/share/fonts/TTF"

  # license
  install -Dm644 LICENSE \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
