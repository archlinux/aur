# Maintainer: Christoph Drexler <chrdr@gmx.at>
# Contributor: Joris Steyn <jorissteyn@gmail.com>

pkgname=firefox-extension-kwallet-kf5
pkgver=1.0
pkgrel=3
pkgdesc="An extension that allows Firefox to use KF5's Kwallet to store passwords"
arch=('i686' 'x86_64')
url='http://www.guillermomolina.com.ar/en/projects/63-firefox-kwallet5'
#url="http://kde-apps.org/content/show.php?content=173994"
source=("http://www.guillermomolina.com.ar/en/files/category/3-firefox-kde5-wallet?download=33")
license=('MPL' 'GPL' 'LGPL')
depends=('firefox' 'kwallet')
makedepends=('cmake' 'extra-cmake-modules' 'zip')
sha256sums=('bf4bbc2127a54e1187f8ba2b10de0ccf2d15d8ba7d936f00c3cd8e63554d6cad')

dirname="kde5wallet@guillermo.molina"

pkgver() {
  cd "$srcdir/$dirname"
  emversion=$(_extract_version_from_manifest)
  echo ${emversion}
}

build() {
  cd "$srcdir/$dirname"
  make -j1
}

package() {
  cd "$srcdir/$dirname"

  # Extract extension ID and version from manifest
  emid=$(_extract_id_from_manifest)
  dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"

  install -dm755 "$dstdir"
  cp -dr xpi/* "$dstdir"
}

_extract_id_from_manifest() {
  cd "$srcdir/$dirname/xpi"
  sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' \
      install.rdf | tr -d '\n'
}

_extract_version_from_manifest() {
  cd "$srcdir/$dirname/xpi"
  sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' \
      install.rdf | tr -d '\n'
}
