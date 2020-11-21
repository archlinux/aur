# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>

pkgname=tsunami-udp
pkgver=1.8.1
pkgrel=1
pkgdesc="Ultra-Fast UDPDTP"
arch=('any')
url="https://github.com/forcegk/tsunami-udp"
license=('Copyright 2002 Indiana University')
depends=()
optdepends=()
conflicts=('tsunami-udp')
provides=('tsunami-udp')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

# In case there is some activity on the repo (which I doubt will happen)
# pkgver() {
#   cd "${srcdir}/${pkgname}/"
#   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }
 
build() {
  cd "${srcdir}/${pkgname}/"

  # Replacing the ./recompile.sh behaviour
  rm -f configure
  rm -f Makefile
  rm -f Makefile.in
  rm -f */Makefile
  rm -f */Makefile.in
  rm -rf */.deps
  rm -rf autom4te.cache

  echo "Running autoreconf..."
  autoreconf -i -f -s
  
  echo "Configuring..."
  ./configure

  echo "Compiling..."
  make clean
  make -j $(getconf _NPROCESSORS_ONLN)
}
 
 
package() {
  cd "${srcdir}/${pkgname}/"
  make DESTDIR="${pkgdir}" install

  # Install the license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
