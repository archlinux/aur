# Contributor: Miguel de Val-Borro <miguel.deval [at] gmail [dot] com>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xephem
pkgver=4.0.0
pkgrel=3
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="http://www.clearskyinstitute.com/xephem/xephem.html"
license=('custom:MIT')
depends=('libxmu' 'openmotif' 'perl' 'openssl')
source=("http://www.clearskyinstitute.com/xephem/$pkgname-$pkgver.tgz"
	"http://www.clearskyinstitute.com/xephem/contrib/xephem-3.7.7_openssl.patch"
       licenseinfo.patch)
sha256sums=('abc90e795b7076be3b5c2247162e1c853265b2d81c3399767ab569a5653f6301'
            '64365b25ac142ebcc9dc286a14f7b3c37aeb44ffcdc629d776b183099259b3f4'
            'bb7bd33bbe3b1c87dfcebb752c85daef2821340952f1bfab16d49f2e9f107730')

prepare() {
  cd ${pkgname}-${pkgver}/GUI/$pkgname
  chmod u+w Makefile net.h netmenu.c sunmenu.c ucac.c usno.c xephem.h \
	auxil/mpcorb2edb.pl fallbacks.c webdbmenu.c 
  patch -p5 -i ../../../xephem-3.7.7_openssl.patch
  cd ../..
  patch -Np1 < "$srcdir"/licenseinfo.patch
}

build() {
  cd ${pkgname}-${pkgver}/GUI/$pkgname
  export MAKEFLAGS+="-j1"
  make MOTIF=/usr/lib/ 
}

package() {
  cd ${pkgname}-${pkgver}/GUI/$pkgname
  install -Dm755  "$srcdir"/${pkgname}-${pkgver}/GUI/$pkgname/xephem "$pkgdir"/usr/bin/$pkgname
  
  install -d "$pkgdir"/usr/share/$pkgname

  cp -R auxil    "$pkgdir"/usr/share/$pkgname/
  cp -R catalogs "$pkgdir"/usr/share/$pkgname/
  cp -R fifos    "$pkgdir"/usr/share/$pkgname/
  cp -R fits     "$pkgdir"/usr/share/$pkgname/
  cp -R gallery  "$pkgdir"/usr/share/$pkgname/
  cp -R help     "$pkgdir"/usr/share/$pkgname/
  cp -R lo       "$pkgdir"/usr/share/$pkgname/

  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1

  install -d "$pkgdir"/usr/share/X11/app-defaults
  echo "XEphem.ShareDir: /usr/share/xephem" > "$pkgdir"/usr/share/X11/app-defaults/XEphem
  
  install -Dm644 "$srcdir"/${pkgname}-${pkgver}/Copyright \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
