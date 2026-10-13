# Maintainer: Alex Dujardin <contact@alexcrea.xyz>
pkgname=paintdotnet-wine-experimental
pkgver=5.200.9775.2252
pkgrel=7
pkgdesc="Experimental Paint.NET with wine specific changes"
arch=(x86_64)
url="https://github.com/paintdotnet/Paint.NET-on-WINE"
license=('LicenseRef-custom')
depends=('wine>=11.5' winetricks bash)
makedepends=(icoutils)
noextract=("${pkgname}-${pkgver}.zip")

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/paintdotnet/Paint.NET-on-Wine/releases/download/v${pkgver}/paint.net.${pkgver}.portable.x64.wine.EXPERIMENTAL.zip"
  "${pkgname}.sh"
  "${pkgname}.desktop"
)

sha256sums=('0ace05b4397139f502099ab429e302938efc21eaf7db45d078b7e204e5372c6f'
            '9fa34474da5247ff154aff6538db793bdd924d4608deb5486a2478586a83835d'
            '2344898406e25f5d8f2fef4ecb4313bbb48ffd69eb85983e32209ba19b5cecff')

build() {
  mkdir -p "$srcdir/paintdotnet"
  bsdtar -xf ${pkgname}-${pkgver}.zip -C "$srcdir/paintdotnet"

  icotool -x -w 256 -h 256 "$srcdir/paintdotnet/paintdotnet.ico"
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a "$srcdir/paintdotnet/." "$pkgdir/usr/share/$pkgname"

  install -Dm755 paintdotnet_5_256x256x32.png "$pkgdir/usr/share/$pkgname/paintdotnet_256x256x32.png"

  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  sed -i "s/pkgname/$pkgname/g" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s/pkgname/$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "paintdotnet/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
