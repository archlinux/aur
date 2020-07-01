# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Severen Redwood <severen@shrike.me>

pkgname='ttf-monoid'
pkgver=0.61
pkgrel=5
pkgdesc='A customisable coding font'
arch=('any')
license=('MIT' 'custom:OFL')
depends=('fontconfig')
makedepends=('fontforge' 'python')
url='http://larsenwork.com/monoid/'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/larsenwork/monoid/archive/${pkgver}.tar.gz"
'fontbuilder-python3.patch')
sha512sums=('2acae11b3d0a86ac1d0588de986fbcf13a83bdcb857b0eb1deaeae55615fdccbfd8f19b5618ee61abd1261c3f203cadcaa7b37f44f535a3fe462240602ab51dc'
            '7f06b8827ed12b3070512ae58424b92a05635eefe0dee0d6314f1b92230f431e2fde5a2d70adbff324bbcb4ce70b135ccda2a6dfaaeb7b6e4219a447034f00c0')

prepare () {
  # Create LICENSE file
  cd "monoid-${pkgver}"
  sed -n '/Monoid is dual licensed/,/OTHER DEALINGS IN THE FONT SOFTWARE./p' \
    'Readme.md' > \
    'LICENSE'

  # Patch fontbuilder script
  cd "Scripts"
  patch -sp1 < "${srcdir}/fontbuilder-python3.patch"
}

build () {
  cd "monoid-${pkgver}"
  export PYTHONPATH="$(pwd)/Scripts"
  python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid.sfdir");'
  python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Bold.sfdir");'
  python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Italic.sfdir");'
  python3 -c 'import fontbuilder; fontbuilder.build("_build", "Source/Monoid-Retina.sfdir");'
}

package () {
  cd "monoid-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 _build/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
