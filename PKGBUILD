# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname=track-designer
pkgver=2.0.1.6
pkgrel=2
pkgdesc="Plan and design LEGO train track and base plate layouts"
arch=('x86_64')
url="https://archive.org/details/legotd2"
license=('LicenseRef-track-designer')
depends=('wine')
makedepends=('unzip'
             'icoutils')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://archive.org/download/legotd2/td20.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "LICENSE")
sha256sums=('8bfbfa2ae6b1b31022d4ba3ab1b68917e6ea73f8ca1b456a9bd2561e51e68447'
            '27b79933c9b0a98c232046a5d67e286c3c7b0960ecf4ba9eb566438b66d538e1'
            '72f264168640016593168df959d8df9eccdeaf34a5856a025b210e4bc6deb39f'
            '1aa51e2d286bd52b20c3d956f47801b57592d1607d965c94495f98eeb8a56d56')

prepare() {
  # Extract with unzip due to otherwise unsupported compression method 'imploding'
  unzip -q "$pkgname-$pkgver.zip" -d "$srcdir/td20"

  # Extract icon from EXE
  cd "$srcdir"
  wrestool -x --output=icon.ico -t14 -n128 td20/TD.EXE
  icotool -x icon.ico
}

package() {
  install -Dd "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/td20"/* "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/icon_1_32x32x4.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
