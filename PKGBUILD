# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('texture')
pkgver=2.3
pkgrel=1
pkgdesc="WYSIWYG editor and reader for DAR/JATS (XML) scientific content"
arch=('any')
url='http://substance.io/texture/'
license=('MIT')
makedepends=('npm' 'jq' 'asar')
depends=('electron4')
options=(!emptydirs)
source=(
  "texture-v$pkgver.tar.gz::"`
    `"https://github.com/substance/texture/archive/v$pkgver.tar.gz"
  "entry.desktop"
  "run.sh"
)
sha256sums=('d06b806e11f0deea16208645b91b3d1fa90ad9d8eb95a4dbeb58ec8294001a3b'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --production --cache "$srcdir"/npm-cache
  jq -r '
    .devDependencies
    | to_entries[]
    | select(.key | index(
        "substance-bundler", "font-awesome", "inter-ui", "electron-builder"
      ))
    | "\(.key)@\(.value)"
  ' < package.json | xargs npm install --cache "$srcdir"/npm-cache
  sed -ri '/electron/d' package.json
  sed -ri '/electronVersion/d' app/package.json.in
  sed -ri '/examples\/|electronVersion/d' make.js
  node make app
  rm -rf app-dist/{*.map,build-resources,package-lock.json}
  find app-dist -name package.json -print0 | xargs -0 sed -i /_where/d
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  asar pack app-dist dist/texture.asar
  install -Dm644 dist/texture.asar "$pkgdir"/usr/lib/texture.asar
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 app/build-resources/icons/512x512.png \
                 "$pkgdir/usr/share/icons/hicolor/512x512/apps/texture.png"
  cd "$srcdir"
  install -Dm755 run.sh "$pkgdir"/usr/bin/texture
  install -Dm644 entry.desktop "$pkgdir/usr/share/applications/texture.desktop"
}
