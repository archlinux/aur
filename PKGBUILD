# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
depends=(
  'gcc-libs'
  'libxcb'
  'expat'
  'freetype2'
  'libxkbcommon'
  'fontconfig'
  'gtk3'
)
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/archive/v$pkgver.tar.gz")
sha512sums=('c16dfdb321ae19d3b5ca327d5576295baa9581134d2613e8bfeedcb4b406e17542489a9a74dca86b2716dfed468445cc23d05b03d563086238a2b98a5f07913f')
b2sums=('98e7fcdef3cf9751124c005d60edf92c4e20fca454ac84f7501d5d37ec948126eb50181f68bec7a18fee161a682cc1ba4aee57bccb190513235fa993c9d3feea')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --frozen --profile release-lto
}

package() {
  cd "$pkgname-$pkgver"

  find target/release-lto \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -vDm755 -t "$pkgdir/usr/bin/" {} +

  # extra desktop stuff
  install -vDm644 -t "$pkgdir/usr/share/applications" extra/linux/*.desktop
  install -vDm644 -t "$pkgdir/usr/share/metainfo" extra/linux/*.xml
  install -vDm644 extra/images/logo.png "$pkgdir/usr/share/pixmaps/dev.lapce.lapce.png"
}
