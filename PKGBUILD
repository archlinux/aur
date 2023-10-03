# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2023
pkgver=2023.0.3
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('x86_64' 'aarch64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime>=9' 'sane')
source=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb"
        "$pkgname.desktop")
sha256sums=('250c79c892e3c16e154572ccfbf54d0d714df19707271971c8a0c8cdcfbe844b'
            'fdcba512d02c666e3f116afeb6811457483e09ad29f934b5bce13c862fd473d6')

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
