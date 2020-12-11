# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gauche-git
pkgver=0.9.10.r12887
pkgrel=1
epoch=4
pkgdesc="R7RS Scheme implementation developed to be a handy script interpreter"
arch=('i686' 'x86_64')
url='http://practical-scheme.net/gauche/index.html'
license=('BSD')
# gauche only needed if this is the first build of gauche-git,
# afterwards gauche-git will provide gauche
depends=('mbedtls' 'gdbm' 'libatomic_ops' 'gauche' 'slib') 
makedepends=('bash' 'git') 
provides=('gauche')
conflicts=('gauche')
source=('git+https://github.com/shirok/Gauche.git')
md5sums=('SKIP')
_gitname='Gauche'

pkgver() {
  cd "$_gitname"
  _appver=$(awk -F, '/AC_INIT/ {print $2}' configure.ac|tr -d [])
  printf %s.r%s $(echo $_appver) $(git rev-list --count HEAD)
}
  
build() {
  cd "$_gitname"
  LANG=C
  ./DIST gen
  CONFIG_SHELL=/bin/bash ./configure --prefix=/usr \
    --enable-multibyte=utf-8 --enable-threads=pthreads 
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
