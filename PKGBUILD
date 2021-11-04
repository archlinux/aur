# vim:set ts=2 sw=2 et:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor : gls < ghostlovescorebg at gmail dot com >

pkgname=csync2
pkgver=2.0
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Asynchronous cluster syncronisation tool based on librsync and inspired by Unison"
url="http://oss.linbit.com/csync2/"
license=('GPL')
makedepends=('texlive-latexextra' 'sqlite' 'git')
depends=('librsync' 'gnutls')
optdepends=('sqlite: for sqlite backend')
source=("https://github.com/LINBIT/csync2/archive/refs/tags/${pkgname}-${pkgver}.tar.gz"
        'csync2.socket'
        'csync2@.service'
        'csync2-rm-ssl-cert')
sha256sums=('a1c6b0364eb9f19986a92fccd369bae29aa5aa55300e0664dadaf80d80de23ff'
            'ccb6ac225d2a4b490d47c87d835c1f2fb8caa5a21c46cf117cce0253c05c8eb1'
            'c51e1ca1b41e0204d73e036727f8122d2420e8b044ec50ae9fe8fc07a0712a43'
            'f63ccb9d5dd4da556eec7920aed21925d8809d4fb6c081b22e82cc87c617567f')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver}

  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/csync2 \
    --localstatedir=/var
  make V=0
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}

  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 ../'csync2.socket' "$pkgdir/usr/lib/systemd/system/csync2.socket"
  install -Dm644 ../'csync2@.service' "$pkgdir/usr/lib/systemd/system/csync2@.service"
  install -Dm755 ../'csync2-rm-ssl-cert' "$pkgdir/usr/bin/csync2-rm-ssl-cert"
  rm -fr "${pkgdir}"/var
  install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf <<-END
    d /var/lib/${_pkgname} 0755 root root -
END
}
