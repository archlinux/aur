# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: bionade24
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.9.0
pkgrel=1
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('x86_64')
depends=('libasound.so' 'gtk3' 'libvips' 'nodejs' 'nss' 'openjpeg2')
makedepends=('unzip')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
noextract=("upscayl-${pkgver}-linux.zip")

source=(
  "https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.zip"
  'upscayl-run'
)

sha512sums=(
  '86b0a69dfe8434a19f1819ada70d75e8d511ec42723d01a9eccf58b2c4864efe977dcca741e7463f24cb2e7778890e828c7dbeb189dd48b58b617a3e294c670a'
  '7a1a702418325085d6afab949efe7724c4db42dc5a165ade02ff5b1d755fdcac5b8292cf3ee26b04e85a8f41343e1a5d36dba72afc5c6731a3bc3ea49b6c2193'
)

prepare() {
  cd "$srcdir"
  unzip upscayl-${pkgver}-linux.zip -x resources/128x128.png -d upscayl
  sed -i 's| --enable-features=UseOzonePlatform --ozone-platform=wayland||' upscayl/resources/org.upscayl.Upscayl.desktop
}

package() {
  cd "$srcdir"

  # Licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  mv "$_pkgname"/LICENSE* "$pkgdir"/usr/share/licenses/$pkgname/

  # Launcher
  install -Dm755 upscayl-run "$pkgdir"/usr/bin/upscayl-run
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/pixmaps
  mv "$_pkgname"/resources/org.upscayl.Upscayl.desktop "$pkgdir"/usr/share/applications/
  mv "$_pkgname"/resources/512x512.png "$pkgdir"/usr/share/pixmaps/org.upscayl.Upscayl.png

  # App directory
  install -dm755 "$pkgdir"/usr/lib
  mv "$_pkgname" "$pkgdir"/usr/lib/
}
