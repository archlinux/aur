# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('texture')
pkgver=2.2
pkgrel=2
pkgdesc="WYSIWYG editor and reader for DAR/JATS (XML) scientific content"
arch=('i686' 'x86_64')
url='http://substance.io/texture/'
license=('MIT')
makedepends=('npm' 'jq' 'electron4')
depends=('nodejs' 'gtk3' 'nss' 'libxss' 'ffmpeg' 'flac'
         're2' 'libxslt' 'minizip' 'libevent' 'snappy' 'http-parser')
options=(!emptydirs)
source=(
  "texture-v$pkgver.tar.gz::"`
    `"https://github.com/substance/texture/archive/v$pkgver.tar.gz"
)
sha256sums=('d39833e54519486647c3fedba9bd067cb4e3500951d72b6a7a4d12cad4ce3b1e')

build() {
  electron_dist=/usr/lib/electron4
  electron_version=$(sed s/v// "$electron_dist"/version)
  cd "$srcdir/$pkgname-$pkgver"
  sed -ri \
    's/("electron": ").*(",)/\1'$electron_version'\2/' \
    package.json
  sed -i '/fork.*electron-builder/d' make.js
  sed -ri \
    -e '/electronVersion/i\    "electronDist": "/usr/lib/electron4",' \
    app/package.json.in
  npm install --production --cache "$srcdir"/npm-cache
  jq -r '
    .devDependencies
    | to_entries[]
    | select(.key | index(
        "substance-bundler", "font-awesome", "inter-ui", "electron-builder"
      ))
    | "\(.key)@\(.value)"
  ' < package.json | xargs npm install --cache "$srcdir"/npm-cache
  node make app
  npx electron-builder build --project app-dist
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
