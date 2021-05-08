# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname=gnunet
pkgver=0.14.1 
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking"
arch=('x86_64')
url="https://gnunet.org"
license=('GPL')
depends=('libextractor' 'sqlite' 'gnurl' 'libmicrohttpd' 'libidn' 'jansson' 'libsodium')
makedepends=('git' 'bluez-libs' 'python' 'glpk' 'libpulse' 'opus' 'gst-plugins-base-libs')
optdepends=('bluez-libs'
	    'python'
	    'glpk'
	    'libpulse'
	    'opus'
            'gst-plugins-base-libs: for gnunet-helper-audio-record')
backup=(etc/gnunetd.conf)
options=('!makeflags')
source=(http://ftpmirror.gnu.org/gnunet/gnunet-0.14.1.tar.gz{,.sig}
        gnunet.service
        defaults.conf)
validpgpkeys=('19647543F7861D3BF4E64FF7BF60708B48426C7E'
              '3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('4a3205c570c30756f1a8b1ad0f1a63d078a92f0fac8e543471d54f4552da18c2'
            'SKIP'
            '42a91cd5c291227a2b452f4131808d2393887991ec905159bc470e68548098ba'
            '582c617cfcb0b28e28c8ab42925307f79cf147f3231a9782c46893383c31b19e')

build() {
  cd $pkgname-$pkgver
  sed -i 's|contrib doc|doc|' Makefile.*
  ./configure --prefix=/usr \
    --without-mysql
  make
  make -C contrib
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C contrib install
  install -D -m0644 "$srcdir"/defaults.conf "$pkgdir"/etc/gnunetd.conf
  rm -rf "$pkgdir"/usr/include/libltdl "$pkgdir"/usr/lib/libltdl.* "$pkgdir"/usr/include/ltdl.h
  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
