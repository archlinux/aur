# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=mod_python2-legacy
pkgver=3.3.1
pkgrel=1
pkgdesc="An Apache 2.2 module that embeds the Python2 interpreter within the server"
arch=('i686' 'x86_64')
url="http://www.modpython.org/"
license=('APACHE')
depends=('apache22' 'python2')
conflicts=('mod_python' 'mod_python2')
install="mod_python.install"
source=("http://archive.apache.org/dist/httpd/modpython/mod_python-$pkgver.tgz"
	"compile.patch"
	"python-2.7.patch")
options=('!strip')
md5sums=('a3b0150176b726bd2833dac3a7837dc5'
         '4786c158223c2d3a94f3b6e69826b522'
         '71ce82d93d2685c62f5a0c17fe37985f')

build() {
  cd "$srcdir/mod_python-$pkgver"
  patch -Np0 -r - -i ../compile.patch || true
  patch -Np1 -r - -i ../python-2.7.patch || true
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  sed -i -e "s#-Wl[^ ]*#$LDFLAGS#g" src/Makefile
  make
}

package() {
  cd "$srcdir/mod_python-$pkgver"
  make DESTDIR="$pkgdir" install
}
