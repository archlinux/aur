# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=lldpd-git
pkgver=0.7.6.50
pkgrel=1
pkgdesc="LLDP daemon for GNU/Linux implementing both reception and sending"
arch=('i686' 'x86_64')
url="https://vincentbernat.github.com/lldpd/"
license=('custom:"ISC"')
depends=('libxml2' 'net-snmp' 'libevent' 'libbsd' 'jansson' 'libseccomp')
makedepends=('git')
provides=('lldpd')
conflicts=('lldpd')
options=('!libtool')
install=lldpd.install
source=("git://github.com/vincentbernat/lldpd.git"
	'lldpd-service.patch'
	'lldpd.install'
	'LICENSE')
md5sums=('SKIP'
         'bb01e71d16a33cf028d0a0ce4ccc6a86'
         '0b06475bc2048aa29fb1d8c660446f87'
         '8ae98663bac55afe5d989919d296f28a')
_gitname=lldpd

pkgver() {
  cd $_gitname
  git describe --tags --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $_gitname
  patch -Np2 -b -z .orig -i "$srcdir/lldpd-service.patch"
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-snmp \
    --with-xml \
    --with-json \
    --with-seccomp \
    --with-privsep-chroot=/run/lldpd
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
