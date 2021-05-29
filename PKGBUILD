# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Samadi van Koten <me at vktec dot co dot uk>

pkgname=ircd-hybrid
pkgver=8.2.38
pkgrel=1
pkgdesc='A lightweight, high-performance internet relay chat daemon.'
arch=('i686' 'x86_64')
url='http://www.ircd-hybrid.org/'
license=('GPLv2')
depends=("zlib" "pcre" "openssl")
optdepends=("anope: IRC services designed for flexibility and ease of use")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ircd-hybrid/ircd-hybrid/archive/${pkgver}.tar.gz"
	"$pkgname.service"
	"$pkgname.tmpfiles"
	"$pkgname.sysusers"
	"$pkgname.conf")
conflicts=("ircd")
provides=("ircd")
backup=("etc/ircd-hybrid/ircd.conf")
sha512sums=('6d7397d5be081e4f38e91cbf0b456a7891e752acf8a7897b725ee31d0bbc93f0b56d2892be9447211b2d5cdc8f2543cf89cedcda919c36bb48c36859ecce7e80'
            'cebd20d53d7e289ebfebaf5944bfb9a22a7dc6b013681157b4b254d86f917b9fc76a7d5100fe99c5cce74db2a96417c1f081df39b41b35860dc87348f07c2b02'
            'db9efc53012993577b4f5510898c788c7a70de9348d66e6b1a6826d519f47ca2a28689a60c3e6b5a30f33b3b4af058f4c2cca5f89ad02ef37f86286c0096314f'
            '41e50980eefa1f4b2cb39bc0ac6017f42ae5c8e9bc0ca3670432e181883b40b41765917c25fbd273af83c92237003ff955f69bef0851f8cf9eb84dfb384515fa'
            '706551c02765ed5203586ade3e73db8aa0552b21cf65094359dbc5ab5e4ef9ff6e8af32776e52adb2bca17a2eb83cf4df1fe6923689562b1696877ab30de3a98')
options=('libtool')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoconf
  ./configure \
    --prefix=/usr/ \
    --bindir=/usr/bin \
    --sysconfdir=/etc/${pkgname} \
    --localstatedir=/var \
    --datarootdir=/usr/share \
    --mandir=/usr/share/man \
    --includedir=/usr/include \
    --libdir=/usr/lib \
    --enable-epoll
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  
  # Install Hybrid sample configuration
  install -D -m 0660 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/${pkgname}/ircd.conf
  install -Dm644 "${srcdir}/$pkgname.service" "${pkgdir}"/usr/lib/systemd/system/$pkgname.service
  install -Dm644 "${srcdir}/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # Prepare extra directories
  install -d "${pkgdir}/var/log/ircd"
  install -d "${pkgdir}/var/lib/ircd"
  install -d "${pkgdir}/run/ircd"
  install -d -m 0750 "${pkgdir}/etc/${pkgname}/ssl"
}

# vim: ft=sh sw=2 ts=2 et
