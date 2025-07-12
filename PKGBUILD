# Maintainer: Strykar <strykar@hotmail.com>

pkgname=hopm
pkgver=1.1.10
pkgrel=1
pkgdesc="Hybrid Open Proxy Monitor - an open proxy scanner designed for IRC networks"
arch=('x86_64')
url="https://github.com/ircd-hybrid/hopm"
license=('GPL-2.0-only')
depends=('openssl')
makedepends=('autoconf' 'make' 'gcc')
conflicts=('hopm' 'hopm-git')
backup=('etc/hopm.conf')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ircd-hybrid/hopm/archive/refs/tags/$pkgver.tar.gz"
  "hopm.service"
  "reference.conf.patch"
)
b2sums=('46fb3d414508a8113e95d96cef0649e9b333e1757139ba950969bb9690d5a240815b13acc701c919891dd43e207bd123d5753b9dd75032a04962883f29b1057c'
        '9fcb4b0dfa9c37910a58ddf7b85ffa0d0c7ac455710a42be81a866f63f4fbc135753405b3b85336e8194888af89d02983cc19c59a52ff1efe993d2dac56693a5'
        '15857c507fe05853b946935104550993b5e7ebc43d77d8281007507e161d8997e681226e3ef412d53a57c1f49f520db228f196ea2c1205f582d5c6893ea26cec')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://github.com/ircd-hybrid/hopm/pull/52
  patch -Np0 < "$srcdir/reference.conf.patch"

  # https://github.com/ircd-hybrid/hopm/issues/51
  sed -i 's|-DHOPM_LOGDIR="\\\"$(localstatedir)/log\\\""|-DHOPM_LOGDIR="\\\"/var/log/hopm\\\""|' Makefile.am

  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
  --prefix=/usr \
  --sysconfdir=/etc \
  --bindir=/usr/bin \
  --libdir=/usr/lib \
  --runstatedir=/run \
  --localstatedir=/var \
  --libexecdir=/usr/lib \
  --mandir=/usr/share/man \
  --infodir=/usr/share/info

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 src/hopm "$pkgdir/usr/bin/hopm"
  install -Dm644 doc/reference.conf "$pkgdir/etc/hopm.conf"
  install -Dm644 "$srcdir/hopm.service" "$pkgdir/usr/lib/systemd/system/hopm.service"

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/reference.conf "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 {README,NEWS,INSTALL} "$pkgdir/usr/share/doc/$pkgname/"
}
