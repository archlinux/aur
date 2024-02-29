# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: bionade24
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.10.0
pkgrel=1
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
  'ae8c6ec5e4e5568c86ff41eea36d8f179e0ea8d9c5eeafdbd29d5aaeaf583cb94e30210ca68c5371d2f9c1f281c7f390c537ca223887f278ee321c30c06be964'
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
