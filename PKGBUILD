#Maintainer: Guoyi Zhang <myname at malacology dot net>
#Contributor: Fabio Zanini <fabio DOOT zanini AAT fastmail DOOT fm>

pkgname=aliview
_pkgname=AliView
pkgver=1.28
pkgrel=2
pkgdesc="Software for aligning viewing and editing dna/aminoacid sequences https://doi.org/10.1093/bioinformatics/btu531"
arch=('any')
url="http://www.ormbunkar.se/aliview/"
license=('GPL')
depends=('java-runtime=8')
makedepends=('maven' 'java-environment=8')
source=("$pkgname.tar.gz::https://github.com/AliView/AliView/archive/refs/tags/v${pkgver}.tar.gz"
	"$pkgname.patch::https://patch-diff.githubusercontent.com/raw/AliView/AliView/pull/123.patch"
	"${pkgname}2.patch::https://github.com/AliView/AliView/pull/125.patch")
sha256sums=('4af3459c6f29a002d8724c12b17d247673370c6fa10cb47adf55c18f57d9e139'
            '16053c6d6cc9948aed439519d11230fa088a3e8850af63f840fab54f7fec0ed7'
            '0452ddbbc2486c7632bf6f096215190a0bea2aae8c558da3fde8657a14f235bb')
prepare(){
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 < $srcdir/$pkgname.patch
  patch -p1 < $srcdir/${pkgname}2.patch
}

build(){
  cd $srcdir/$_pkgname-$pkgver
  mvn package
}

package(){
  cd $srcdir/$_pkgname-$pkgver
  cd aliview-linux
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm 755 aliicon_128x128.png $pkgdir/usr/share/$pkgname/aliicon_128x128.png
  cd $srcdir/$_pkgname-$pkgver
  cd target
  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
}
