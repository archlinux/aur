# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: bionade24
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.9.9
pkgrel=4
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('libvips' 'openjpeg2' 'electron' 'nodejs')
makedepends=('unzip')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
noextract=("upscayl-${pkgver}-linux.zip")

source=(
  "https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.zip"
  "$_pkgname"
)

sha512sums=(
  '06f4a4439cbd7df9dba151530a42368f08d0fab5b145c1563a080aac1aac4b4a094a135f76b381b6a94a7d66d1071dccc647e9c69912cacfe3fe3157a211bf1c'
  'eae35fb7bef2b50512dec60fe1ab9e5bb7f4cd71931bd36951ee30a2d238299aeab88bac35aba4108ddd5c3e2cf6948a9cd144b0f3451e30c4f28b81d2e1e07a'
)

prepare() {
  cd "$srcdir"
  unzip ${_pkgname}-${pkgver}-linux.zip -x resources/128x128.png -d ${_pkgname}-${pkgver}
  printf '%s\n' 'Icon=org.upscayl.Upscayl' >> ${_pkgname}-${pkgver}/resources/org.upscayl.Upscayl.desktop
}

package() {
  cd "$srcdir"

  # Launcher script
  install -Dm755 "$_pkgname" "$pkgdir"/usr/bin/$_pkgname

  # Enter the package folder
  cd ${_pkgname}-${pkgver}/resources

  # XDG launcher
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/pixmaps
  mv org.upscayl.Upscayl.desktop "$pkgdir"/usr/share/applications/
  mv 512x512.png "$pkgdir"/usr/share/pixmaps/org.upscayl.Upscayl.png

  # App directory
  install -dm755 "$pkgdir"/opt/$_pkgname
  mv * "$pkgdir"/opt/${_pkgname}/
}
