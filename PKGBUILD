# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname="krohnkite"
pkgname="kwin-scripts-krohnkite"
pkgver=0.9.9.2
pkgrel=2
pkgdesc="A dynamic tiling extension for KWin"
url="https://codeberg.org/anametologin/krohnkite"
license=('MIT')
arch=('any')

makedepends=(
  'typescript'
)
source=("https://codeberg.org/anametologin/krohnkite/archive/$pkgver.tar.gz")
sha256sums=('618a5d7b6b552026b6ed4db62422f3ec82969e989d4b5d9c816c405e4924e138')


build() {
  mkdir -p pkg
  cd "$_pkgname-$pkgver"

  # krohnkite.js
  tsc
  install -Dm644 krohnkite.js ../pkg/contents/code/script.js

  # metadata.json
  install -Dm644 res/metadata.json ../pkg/metadata.json
  sed -E -e 's&\$VER&'${pkgver}'&' \
    -e 's&\$REV&'${pkgver}'&' \
    -i ../pkg/metadata.json

  # other files
  install -Dm644 res/main.js ../pkg/contents/code/main.js
  install -Dm644 res/config.xml ../pkg/contents/config/main.xml
  install -Dm644 res/config.ui ../pkg/contents/ui/config.ui
  install -Dm644 res/main.qml ../pkg/contents/ui/main.qml
  install -Dm644 res/popup.qml ../pkg/contents/ui/popup.qml
  install -Dm644 res/shortcuts.qml ../pkg/contents/ui/shortcuts.qml
}

package() {
  depends+=(
    'kwin'
  )

  install -dm755 "$pkgdir/usr/share/kwin/scripts/$_pkgname"
  cp -ra "pkg/." "$pkgdir/usr/share/kwin/scripts/$_pkgname/"

  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
