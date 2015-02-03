# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-extension-privacy-badger-git
_gitname=privacybadgerfirefox
pkgver=0.2.5.7.g5150b3e
pkgrel=1
pkgdesc='Blocks spying ads and invisible trackers.'
license=('custom:GPLv3+')
arch=('any')
url=https://www.eff.org/privacybadger
depends=('firefox')
makedepends=('addon-sdk' 'git' 'python')
conflicts=('firefox-extension-privacybadger')
source=('git://github.com/EFForg/privacybadgerfirefox')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe |sed 's/-/./g'
}

build() {
  cd $_gitname
  /opt/addon-sdk/bin/cfx xpi
}

package() {
  cd $_gitname

  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  unzip -qo -d xpi privacybadgerfirefox.xpi
  cd xpi

  local emid=$(python -c \
"import xml.etree.ElementTree as ET
tree = ET.parse('install.rdf')
root = tree.getroot()
print(root[0][0].text)")
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"$emid"

  find -empty -type d -delete # remove empty dirs

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
