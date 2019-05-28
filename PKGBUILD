# Maintainer: Matthew Barichello <matthewjbarichello@gmail.com>

_pkgname=stunnel
pkgname=$_pkgname-systemd-git
pkgver=5.54
pkgrel=2
pkgdesc="A program that allows you to encrypt arbitrary TCP connections inside SSL"
arch=('x86_64')
url='https://www.stunnel.org/'
license=('GPL2')
depends=('libnsl' 'openssl' 'systemd')
makedepends=('git' 'automake' 'pkgconf' 'libtool' 'autoconf-archive')
provides=($_pkgname)
conflicts=($_pkgname)
#backup=('/etc/stunnel/stunnel.conf-sample')
source=($pkgname::'git+https://github.com/matthewacon/stunnel'
        'stunnel@.service')
md5sums=('SKIP'
         'ca9e198adda46e3c31f45247b8439e74')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  autoreconf -i -v
  ./configure
  make -j`nproc`
  make check
}

package() {
#  _BASE_DIR="$(pwd)"
  #Systemd service
  install -Dm644 stunnel@.service "$pkgdir/usr/lib/systemd/system/stunnel@.service"
  #Docs
  _DOCS=(BUGS INSTALL CREDITS AUTHORS ChangeLog INSTALL.WCE INSTALL.W32 INSTALL.FIPS 'doc/stunnel.html' COPYRIGHT.GPL TODO 'doc/stunnel.pl.html' README PORTS COPYING)
  cd "$pkgname"
  for i in "${_DOCS[@]}"; do
   install -Dm644 "$i" "$pkgdir/usr/share/doc/stunnel/$i"
  done
  
  #Binaries
  install -Dm755 "src/stunnel" "$pkgdir/usr/bin/stunnel"
  install -Dm755 "src/stunnel3" "$pkgdir/usr/bin/stunnel3"

  #Library
  install -Dm644 "src/.libs/libstunnel.so" "$pkgdir/usr/lib/libstunnel.so"

  #Example config
  install -Dm 644 "tools/stunnel.conf-sample" "$pkgdir/etc/stunnel/stunnel.conf-sample"
 }
