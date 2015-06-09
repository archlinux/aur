# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: WallaceIT
_pkgname=mongoose
pkgname=$_pkgname-git
pkgver=5.5_20140120.r34.g057c2d4
pkgrel=1
pkgdesc="Small and quick-to-use web server; https/php/cgi support - git development version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mongoose/"
license=('MIT')
depends=('openssl')
makedepends=('git')
optdepends=('php-cgi: for php support')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/mongoose/mongoose.conf')
source=("$_pkgname::git+https://github.com/cesanta/mongoose.git" "$_pkgname.conf" "$_pkgname.service")
#source=("$_pkgname::git+https://github.com/valenok/mongoose.git" "$_pkgname.conf" "$_pkgname.service")
md5sums=('SKIP'
         '0a84c31ce93fa230251e40eff0e2d556'
         '30c2fad1e3130a913b3d8beadbccbdf0')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  gcc -shared -fPIC -DNS_ENABLE_SSL $CFLAGS $LDFLAGS mongoose.c -o libmongoose.so -lssl
  cd examples/web_server
  make web_server
}

package() {
  cd "$_pkgname"
  install -Dm755 "examples/web_server/web_server" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 mongoose.h "$pkgdir/usr/include/$_pkgname.h"
  install -Dm755 libmongoose.so "$pkgdir/usr/lib/libmongoose.so"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  
  install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/etc/mongoose/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  #install -d "$pkgdir/usr/share/$_pkgname"
  
}

# vim:set ts=2 sw=2 et:
