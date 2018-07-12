# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=halibut  
pkgver=1.2
pkgrel=1
pkgdesc="free document preparation system"
url="http://www.chiark.greenend.org.uk/~sgtatham/halibut/"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('glibc')
source=(https://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1aedfb6240f27190c36a390fcac9ce732edbdbaa31c85ee675b994e2b083163f')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's+/usr/local+/usr+' Makefile
}

build() {
  cd $pkgname-$pkgver
  prefix=/usr make  
  cd doc
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE 
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname 
  cd doc
  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  for _i in $pkgname.info* 
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/info/$_i 
  done
  for _i in $pkgname{.ps,.pdf,.txt}
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/doc/$pkgname/$_i
  done
}
