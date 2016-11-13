# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: skydrome <skydrome@tormail.org>

pkgname=tlsdate-git
pkgver=0.0.13
pkgrel=1
epoch=1
pkgdesc='Secure rdate replacement to update local time over HTTPS'
url='https://github.com/ioerror/tlsdate'
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl' 'ca-certificates' 'dbus' 'zlib' 'libevent' 'libseccomp')
makedepends=('git')
backup=('etc/conf.d/tlsdate'
        'etc/tlsdate/tlsdated.conf')
provides=('tlsdate')
conflicts=('tlsdate')
options=('emptydirs')
install=tlsdate.install
source=(${pkgname}::git+https://github.com/ioerror/tlsdate
        tlsdate.conf.d
        tlsdate.service
        no_sslv3.patch)
sha512sums=('SKIP'
            '0639dd4c7f4df14465da7a5efc8a59fa59bb0155ed0f453cab9cbcc74f22c320080b71ad5361ff2ebf83d64e8c205fbe605deb69a0cb503be5412eff5f1ac220'
            '2b06abe8d7bc2133ca4f8d7cfbf63de4c2fad8356ea8d3f53e6d1c161c2ff86089c4d64f7de7ca6c6222db254ecaaccbc4706012fee50319d83860bfb3a2eab0'
            '038590ebef55adae75a82fd4f697306ea56f9486f1b7ff1f9eb4c292f8ea2a960b720db72e100d1bb70f5b5e1391369a1fd9ce2e8b756e79152937289c159294')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed -r 's|tlsdate-(.+)|\1|'|sed 's|-|+|g'
}

prepare() {
  cd ${pkgname}
  patch -p1 < "${srcdir}/no_sslv3.patch"
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      --sysconfdir=/etc \
      --with-dbus-client-group=tlsdate \
      --with-unpriv-group=tlsdate \
      --with-unpriv-user=tlsdate \
      --without-polarssl
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${srcdir}/tlsdate.conf.d" "${pkgdir}/etc/conf.d/tlsdate"
  install -Dm 644 "${srcdir}/tlsdate.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -d "${pkgdir}/var/cache/tlsdated"
}

# vim: ts=2 sw=2 et:
