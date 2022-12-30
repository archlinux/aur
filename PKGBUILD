# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgname=gtkhash-nemo
pkgver=1.5
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums (Gtkhash with Thunar filemanager plugin)"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'dconf'
    'gtk3'
    'libb2'
    'mbedtls'
    'nemo'
    'nettle'
)

makedepends=(
    'appstream-glib'
    'intltool'
    'librsvg'
    'meson'
    'xdg-utils'
)
provides=(
  gtkhash
  ${pkgname}
)
conflicts=(
  gtkhash 
  gtkhash-caja
  gtkhash-nautilus
  gtkhash-thunar
)
source=("${url}/releases/download/v$pkgver/gtkhash-$pkgver.tar.xz")
sha256sums=('7102a192eca3e82ed67a8252a6850440e50c1dbea7c6364bda154ec80f8ff005')

prepare() {
  mkdir -p plugins
}

build() {
  arch-meson "gtkhash-$pkgver" build \
    -Dglib-checksums='true' \
    -Dlinux-crypto='true' \
    -Dmbedtls='true' \
    -Dnettle='true' \
    -Dbuild-caja='false' \
    -Dbuild-nautilus='false' \
    -Dbuild-nemo='true' \
    -Dbuild-thunar='false'
  meson compile -C build
}

check() {

  desktop-file-validate build/data/*.desktop
  appstream-util validate-relax --nonet build/data/appdata/*.appdata.xml
  appstream-util validate-relax --nonet build/data/appdata/*.metainfo.xml
}


package() {

  meson install -C build --destdir "$pkgdir"

  install -Dm644 build/data/appdata/org.gtkhash.nemo.metainfo.xml -t \
    "$pkgdir/usr/share/metainfo/"
#  install -Dm644 plugins/nemo/extensions-3.0/libgtkhash-properties-nemo.so -t \
#    "$pkgdir/usr/lib/nemo/extensions-3.0/"
}
