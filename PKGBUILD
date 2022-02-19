# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Julien Sopena <jsopena.archlinux@free.fr>
# Contributor: Adam Nielsen <malvineous@shikadi.net>
pkgname=smcroute
pkgver=2.5.5
pkgrel=2
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://troglobit.com/smcroute.html"
license=('GPL2')
provides=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
depends=('libcap' 'bash')
source=("https://github.com/troglobit/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        'smcroute.conf'
        'smcroute.default')
md5sums=('6ed58b4887ccb737687b584f5794c7ed'
         'c230266bb9ba2a0d399f658ec2e46d88'
         '5ad63a25952f8b6f368c61111cf15967')
sha256sums=('2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3'
            'f0e3f8651b3b5ba5490a16b5ad21d19a2a641cb61d80742bc0b07ba97eef0b63'
            '92ad598fed09f8b4211f66929b16111f8bc6436d2f0d36d6325f7bf37425f159')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --runstatedir=/run \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # Make our config the main one, so /etc/smcroute.d is used by default.
  install -Dm644 "${srcdir}/smcroute.conf" "${pkgdir}/etc/smcroute.conf"

  # Put the upstream example config into /etc/smcroute.d but disable it by
  # ensuring it doesn't match *.conf
  install -Dm644 "smcroute.conf" "${pkgdir}/etc/smcroute.d/20-main.conf.example"

  # Copy our template for adjusting smcroute command line parameters.
  install -Dm644 "${srcdir}/smcroute.default" "${pkgdir}/etc/default/smcroute"

  # nothing useful here
  rm -fr "${pkgdir}/usr/share/doc"

  # Remove reference to /usr/share/doc from systemd service.
  sed -i '/\/usr\/share\/doc/ { D }' "${pkgdir}/usr/lib/systemd/system/smcroute.service"
}

# vim:set ts=2 sw=2 et:
