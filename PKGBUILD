# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname="krohnkite"
pkgname="kwin-scripts-krohnkite"
pkgver=0.9.9.2
pkgrel=1
pkgdesc="A dynamic tiling extension for KWin"
url="https://github.com/anametologin/krohnkite"
license=('MIT')
arch=('any')

makedepends=(
  'typescript'
)
source=("https://github.com/anametologin/krohnkite/archive/$pkgver.tar.gz")
sha256sums=('7a956b6cce1802f3ebd38beb0e6e9f895c3499462cdc52a25d6b74d4bccf2f3f')


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
