# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=mod_diary-git
pkgver=r25.0dfee1c
pkgrel=1
pkgdesc="A simple and lightweight blog system for Apache HTTPD Server"
license=('APACHE')
arch=('i686' 'x86_64')
url="https://github.com/hamano/apache-mod-diary"
depends=('apache' 'apr' 'discount' 'clearsilver' 'neon')
makedepends=('git')
install=${pkgname/%-git/}.install
source=('apache-mod-diary::git+https://github.com/hamano/apache-mod-diary.git'
'Makefile' 'modules.mk')
md5sums=('SKIP' 
'f5e06242128e16fda2c34983dfa5a752'
'9e3a805eca1b815839a5ae22649f2c69')
provides=('mod_diary' 'mod_diary-git')

pkgver() {
  cd "$srcdir"/apache-mod-diary
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

build() {
  cd "$srcdir"/apache-mod-diary
  cp $srcdir/{Makefile,modules.mk} .
  touch .deps
  make top_dir=/usr/lib/httpd
}

package() {
  cd "$srcdir"/apache-mod-diary
  install -d "$pkgdir"/usr/{bin,lib/httpd/modules}
  make top_dir=/usr/lib/httpd DESTDIR="$pkgdir" install
  install --mode=755 diary-mkindex "$pkgdir"/usr/bin
}

# vim:set ts=2 sw=2 et:
