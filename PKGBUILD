# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=halibut-git
pkgver=1.2.r39.gce45faf
pkgrel=1
pkgdesc="free document preparation system"
url="http://www.chiark.greenend.org.uk/~sgtatham/halibut/"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=('halibut')
provides=('halibut')
source=(git+https://git.tartarus.org/simon/halibut.git git+https://git.tartarus.org/simon/charset.git)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe  --tags | sed 's+-+.r+'|tr - .
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule.charset.url "$srcdir"/charset
  git submodule update
}

build() {
  cd ${pkgname%-git}
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make  
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/${pkgname}/LICENCE 
  install -Dm755 ${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  
  install -Dm644 doc/${pkgname%-git}.1 "$pkgdir"/usr/share/man/man1/${pkgname%-git}.1
  cd doc/manual
  for _i in ${pkgname%-git}.info* 
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/info/$_i 
  done
  for _i in ${pkgname%-git}{.ps,.pdf,.txt}
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/doc/${pkgname%-git}/$_i
  done
}
