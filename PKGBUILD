# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgname=gtkhash-caja
pkgver=1.5
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums (Gtkhash with Caja filemanager plugin)"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'caja'
    'dconf'
    'gtk3'
    'libb2'
    'mbedtls'
    'nettle'
)

makedepends=(
    'intltool'
    'librsvg'
    'xdg-utils'
)
provides=(
  gtkhash
  ${pkgname}
)
conflicts=(
  gtkhash 
  gtkhash-nautilus 
  gtkhash-nemo
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
    -Dbuild-caja='true' \
    -Dbuild-nautilus='false' \
    -Dbuild-nemo='false' \
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

  install -Dm644 build/data/appdata/org.gtkhash.caja.metainfo.xml -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 build/data/caja/libgtkhash-properties-caja.caja-extension -t \
    "$pkgdir/usr/share/caja/extensions/"
#  install -Dm644 plugins/caja/extensions-2.0/libgtkhash-properties-caja.so -t \
#    "$pkgdir/usr/lib/caja/extensions-2.0/"
}
