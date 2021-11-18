# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar@gmail.com>

pkgname=scratch3
pkgver=3.27.0
pkgrel=1
pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("any")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=(electron11)
makedepends=(p7zip icoutils)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20$pkgver%20Setup.exe"
        "https://raw.githubusercontent.com/LLK/scratch-desktop/develop/LICENSE"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
noextract=("Scratch%20$pkgver%20Setup.exe")
sha512sums=('e4fdf649f1c9256b00e9d6eb07b4b9850799fcad2bf2e1ea5d1e0033b3f9ecc0de9a61931d9b85789c5f7a38710ef7ed97c6a6bc8fb1e5acf093d5c1a0bf1716'
			'4922e4903b96b7f1e6286110bb64256201702ca0921cbd5ecbe462db3ac9f6e7213ca0495d0ccb66cd8ba90a1e137f4581c7a35e4cad689edbe2cfe8144384c0'
			'6cc5ab074b5e26361a6b80b0b98fe8a7804544577f11ec8b59c76b6d52b8c2916ac3f7eb09b8767a21915f7de91da220b55d9b50ceb32432c2d02969175d97f9'
			'5396e2052cabe4e9843d4f4bdfded59074775d12f80111df90da35bb8c450dbbce4f0314cba7efc602b4dcc1b22ad7ab2559e1c64d134d3f111b95ebd3cd656a'
			'1a08bbdf31f2789b1ec04a131c1f61e2652f6ab8297fb4e821a93463c87fc2940b48b29207e2b45ac54a34e547cba60a9db67aabff9c2ba517f932118cb892b1')

prepare() {
  cd "$srcdir/"
# Extract files from "Scratch%20$pkgver%20Setup.exe" with 7za otherwise there are errors.
  7za x -aoa -y "Scratch%20$pkgver%20Setup.exe" resources/ -o$pkgname/

# Adjust folder's attributes
  chmod 755 $pkgname/resources/{,static/{,assets/}}

# Copy the electron files needed for scratch.
  cp -rf /usr/lib/electron11/* $srcdir/$pkgname/

# This file is useless
  rm $pkgname/resources/default_app.asar

# We don't need, if any, windows/dos file executables, remove them.
  find $srcdir/$pkgname/ -type f -name "*.exe" -delete
  find $srcdir/$pkgname/ -type f -name "*.dll" -delete

# Extract icon resource file from exe file using 'wrestool' from icoutils
  wrestool -x --type=14 "Scratch%20$pkgver%20Setup.exe" > ${pkgname}.ico

# The ico file stores a set of 15 icons
# (sizes: 16, 20, 24, 30, 32, 36, 40, 48, 60, 64, 72, 80, 96, 256, 512).
# 'icotool' from icoutils fails to extract most of them [incorrect total
# size of bitmap] if done one by one [ie: --index=N].
  icotool -x ${pkgname}.ico

# We don't need these files
  rm ${pkgname}_2_20x20x32.png
  rm ${pkgname}_5_30x30x32.png
  rm ${pkgname}_8_40x40x32.png
  rm ${pkgname}_11_60x60x32.png
  rm ${pkgname}_14_80x80x32.png

  mv ${pkgname}_1_16x16x32.png $pkgname-16.png
  mv ${pkgname}_3_24x24x32.png $pkgname-24.png
  mv ${pkgname}_6_32x32x32.png $pkgname-32.png
  mv ${pkgname}_7_36x36x32.png $pkgname-36.png
  mv ${pkgname}_9_48x48x32.png $pkgname-48.png
  mv ${pkgname}_12_64x64x32.png $pkgname-64.png
  mv ${pkgname}_13_72x72x32.png $pkgname-72.png
  mv ${pkgname}_15_96x96x32.png $pkgname-96.png
  mv ${pkgname}_4_256x256x32.png $pkgname-256.png
  mv ${pkgname}_10_512x512x32.png $pkgname-512.png
}

package() {
  install -Dm755 "${pkgname}.sh" $pkgdir/usr/bin/$pkgname
  install -Dm644 "${pkgname}.desktop" $pkgdir/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${pkgname}.xml" $pkgdir/usr/share/mime/packages/${pkgname}.xml
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "${pkgdir}/usr/share/$pkgname"
  cp -r $srcdir/$pkgname -t "$pkgdir/usr/share"

#   install -Dm644 "${pkgname}.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  for i in 16 24 32 36 48 64 72 96 256 512; do
    install -Dm644 "$pkgname-${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}
