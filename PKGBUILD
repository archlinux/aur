# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar at gmail dot com>

pkgname=scratch3
pkgver=3.27.0
pkgrel=2
pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("any")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=(electron11)
makedepends=(p7zip)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20$pkgver%20Setup.exe"
        "https://raw.githubusercontent.com/LLK/scratch-desktop/develop/LICENSE"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml"
        "$pkgname-icons.tar.gz")
noextract=("Scratch%20$pkgver%20Setup.exe")
sha512sums=('e4fdf649f1c9256b00e9d6eb07b4b9850799fcad2bf2e1ea5d1e0033b3f9ecc0de9a61931d9b85789c5f7a38710ef7ed97c6a6bc8fb1e5acf093d5c1a0bf1716'
			'4922e4903b96b7f1e6286110bb64256201702ca0921cbd5ecbe462db3ac9f6e7213ca0495d0ccb66cd8ba90a1e137f4581c7a35e4cad689edbe2cfe8144384c0'
			'6cc5ab074b5e26361a6b80b0b98fe8a7804544577f11ec8b59c76b6d52b8c2916ac3f7eb09b8767a21915f7de91da220b55d9b50ceb32432c2d02969175d97f9'
			'5396e2052cabe4e9843d4f4bdfded59074775d12f80111df90da35bb8c450dbbce4f0314cba7efc602b4dcc1b22ad7ab2559e1c64d134d3f111b95ebd3cd656a'
			'389a65bb69d457e02b41621d88a52a3c1d52b0040a1c30a0bf2df6d30dd45a1ec1708ff0bc31c90a003be300315af253f5e0eb203bf45b6c362e4f3cdfda96d1'
			'97f392577c8bc7508d290e6775743fb40f4e492ce244fe8f93983d6d9a1160a0ab6e217790a0f2adcec46455f0e07357b472a499343ca6beb8c3dd7d740e2515')

prepare() {
   cd "$srcdir/"
## Extract files from "Scratch%20$pkgver%20Setup.exe" with 7za
## in order to get only the needed files.
   7za x -aoa -y "Scratch%20$pkgver%20Setup.exe" resources/ -o$pkgname/

## Adjust folder's attributes
   chmod 755 $pkgname/resources/{,static/{,assets/}}

## Copy the electron files needed for scratch.
   cp -rf /usr/lib/electron11/* $srcdir/$pkgname/

## This file is useless
   rm $pkgname/resources/default_app.asar

## We don't need, if any, windows/dos file executables, remove them.
   find $srcdir/$pkgname/ -type f -name "*.exe" -delete
   find $srcdir/$pkgname/ -type f -name "*.dll" -delete
}

package() {
   install -Dm755 "${pkgname}.sh" $pkgdir/usr/bin/$pkgname
   install -Dm644 "${pkgname}.desktop" $pkgdir/usr/share/applications/${pkgname}.desktop
   install -Dm644 "${pkgname}.xml" $pkgdir/usr/share/mime/packages/${pkgname}.xml
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -Dm644 "sd3.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
   install -Dm644 "ch3.svg" $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-scratch3-sprite.svg

   install -dm755 "${pkgdir}/usr/share/$pkgname"
   cp -r $srcdir/$pkgname -t "$pkgdir/usr/share"
}
