# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Dan Fuhry <dan@fuhry.us>
pkgname=kcrap-lnf
pkgver=0.2.3+grawity1
pkgrel=5
_krbver=1.16
arch=('i686' 'x86_64')
pkgdesc="Kerberos Challenge Response Authentication Protocol"
license=('MIT')
depends=('krb5' 'openssl-1.0')
url="http://www.spock.org/kcrap/"
conflicts=('kcrap')
provides=("kcrap=${pkgver%+*}")
replaces=('kcrap')
source=("git+https://github.com/grawity/kcrap-lnf"
        "git+https://github.com/krb5/krb5#tag=krb5-${_krbver}-final"
        "kcrap.service")
sha256sums=('SKIP'
            'SKIP'
            '100be82d33162072f2f1de79f4b7ac54baa6e1c673d986dee7ebf341920823d6')
backup=('etc/kcrap_server.conf')

prepare() {
  cd "${srcdir}/kcrap-lnf"
  autoreconf -fi
}

build() {
  cd "${srcdir}/kcrap-lnf"
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --with-mit-krb5-src="${srcdir}/krb5/src/include"        \
    CFLAGS="-I/usr/include/et -I/usr/include/openssl-1.0"   \
    LDFLAGS="-L/usr/lib/openssl-1.0"                        \
    LIBS="-lkadm5srv"                                       \
    ;
  make -j1
}

package() {
  cd "${srcdir}/kcrap-lnf"
  make install DESTDIR="${pkgdir}"
  install -Dm0644 "server/kcrap_server.conf" "${pkgdir}/etc/kcrap_server.conf"
  mv "${pkgdir}/usr/sbin/kcrap_server" "${pkgdir}/usr/bin/kcrap_server"
  rm -rf "${pkgdir}/usr/sbin"
  chmod -x "${pkgdir}/usr/include/kcrap.h"
  install -Dm0644 "${srcdir}/kcrap.service" "${pkgdir}/usr/lib/systemd/system/kcrap.service"
}

# vim: ft=sh:ts=2:sw=2:et:
