# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.7.0
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://collision.geopjr.dev"
license=('BSD-2-Clause')
depends=('gc' 'libadwaita' 'pcre2')
makedepends=('crystal' 'gobject-introspection' 'shards' 'spglib')
checkdepends=('appstream')
optdepends=('python-nautilus: Add a shortcut to the Nautilus right-click menu')
conflicts=("$pkgname-hashes" 'hashbrown')
replaces=("$pkgname-hashes" 'hashbrown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GeopJr/Collision/archive/v$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('37af60e2a977eddad6633a949e02d9ab8fedd2a91348c7edb60e77e60702f1bc'
            'da920ec69e57f780613fddfa1cd0c9bb2b39a3cba6350f9060c2e91c5b15d3b5')

prepare() {
  cd "Collision-$pkgver"
  patch -Np1 -i ../Makefile.patch
}

build() {
  cd "Collision-$pkgver"
  export SHARDS_CACHE_PATH="$srcdir/shards-cache"
  export APP_ID="${_app_id}"
  export PREFIX='/usr'
  export PO_LOCATION='po'
  export LOCALE_LOCATION='/share/locale'

#  make

#  make desktop
  msgfmt --desktop --template data/${APP_ID}.desktop.in -d ${PO_LOCATION} -o data/${APP_ID}.desktop

#  make bindings
  shards install
  ./bin/gi-crystal

#  make build
  shards build -Dpreview_mt --release --no-debug

#  make gresource
  glib-compile-resources --sourcedir data --target data/${APP_ID}.gresource data/${APP_ID}.gresource.xml

#  make metainfo
  msgfmt --xml --template data/${APP_ID}.metainfo.xml.in -d ${PO_LOCATION} -o data/${APP_ID}.metainfo.xml
}

check() {
  cd "Collision-$pkgver"
  export SHARDS_CACHE_PATH="$srcdir/shards-cache"

#  make check test
  crystal spec -Dpreview_mt --order random

  make validate-appstream

  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "Collision-$pkgver"
  export PREFIX="$pkgdir/usr"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install_nautilus_extension

  install -Dm644 "data/${_app_id}.gresource.xml" -t "$pkgdir/usr/share/${_app_id}/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
