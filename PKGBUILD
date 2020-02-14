# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('texture')
pkgver=2.2
pkgrel=1
pkgdesc="WYSIWYG editor and reader for DAR/JATS (XML) scientific content"
arch=('i686' 'x86_64')
url='http://substance.io/texture/'
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs' 'gtk3' 'nss' 'libxss')
options=(!emptydirs)
source=(
  "texture-v$pkgver.tar.gz::"`
    `"https://github.com/substance/texture/archive/v$pkgver.tar.gz"
)
sha256sums=('d39833e54519486647c3fedba9bd067cb4e3500951d72b6a7a4d12cad4ce3b1e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  jq -r '
    .devDependencies
    | to_entries[]
    | select(.key | index(
        "substance-bundler"
      ))
    | "\(.key)@\(.value)"
  ' < package.json \
  | npm install --cache "$srcdir"/npm-cache .
  npm run release
}

package() {
  mkdir -p "$pkgdir"/opt/texture "$pkgdir"/usr/bin
  cp -a "$srcdir/$pkgname-$pkgver"/app-dist/build/linux-unpacked/* \
        "$pkgdir"/opt/texture
  ln -s /opt/texture/texture "$pkgdir"/usr/bin/texture
  install -Dm644 "$srcdir/$pkgname-$pkgver"/LICENSE.md \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  find "$pkgdir" -name package.json -print0 | xargs -0 sed -i /_where/d
  chown -R root:root "$pkgdir"
}
