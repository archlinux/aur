# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: MutantMonkey <mutantmonkey@gmail.com>
# Contributor: Madek <gonzaloseguel@gmail.com>

pkgname=nini
_pkgname=Nini
pkgver=1.1.0
pkgrel=6
pkgdesc="An uncommonly powerful .NET configuration library designed to help build highly configurable applications quickly"
arch=('any')
url="http://nini.sourceforge.net/"
license=('MIT')
depends=('mono')
source=(https://downloads.sourceforge.net/$pkgname/$_pkgname-$pkgver.zip
        $pkgname-1.1.pc 
        $_pkgname.snk.txt)
sha512sums=('ae366e06ce30b04cb4afb57f4f78f6fab2c12a784abec6edc57f7c775df4887cbef0ca3eb290d1187c82a68a4ea2c4264bf20f5574475d3fcfe5d23958a9ab46'
            '77266f3620a58846c41ecbca80f99a0ba50f64a980654ba842e293b9919b6fba076b849de657dc9675e92037fad9f43f693f8528255ef08113c5c22aa481f028'
            '265bd99e3932615d0ec866849d59a579e5f831c5cba03e788c64f06a4fb9c7b46e78808a95a0d8b59124b3935d70236ebc33fe807baae166c37e0466783a4d5f')

build() {
  cd $_pkgname
  base64 -d ../$_pkgname.snk.txt>$_pkgname.snk
  mcs -t:library -out:Bin/$_pkgname.dll -keyfile:$_pkgname.snk \
      -r:System,System.Data,System.Xml \
      Source/{AssemblyInfo,Config/*,/Ini/*,/Util/*}.cs
}

package() {
  cd $_pkgname
  gacutil -i Bin/$_pkgname.dll -package $_pkgname -root "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/$pkgname-1.1.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname-1.1.pc"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
