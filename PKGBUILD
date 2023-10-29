# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: bionade24
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.9.1
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
  'e801283a268378770c3b0b338eb691e12f4daadd91ac71fe564f37d3a4712037c738b9d802335dda2f2791dd03130a95f0de71d6e1937592ca5861af8da34191'
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
