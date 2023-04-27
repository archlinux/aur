# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2022
pkgver=2022.2.4
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('x86_64' 'aarch64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime>=8' 'sane')
source=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb"
        "$pkgname.desktop")
sha256sums=('41736c1f54fe22d577b3dafc0a7c20454a359a155b7bc2e412e9fd8149a55508'
            '597ce81a0a2728d867109fcd78122d2d0ad6a9ec0a31f0e9bc3b84b778d31d8e')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf data.tar.gz -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  # Extract license
  bsdtar xf "opt/$_pkgname/lib/pdfstudio.jar" resources/license.html

  # Remove bundled JRE
  rm -rf "opt/$_pkgname/jre"

  # Bump max JRE version from 19 to 20
  sed -i 's/19/20/g' "opt/$_pkgname/$_pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r "opt/$_pkgname/." "$pkgdir/opt/$pkgname/"

  install -Dm644 "opt/$_pkgname/.install4j/$_pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 resources/license.html -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
