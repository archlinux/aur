# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.10.0
pkgrel=1
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient"
arch=('any')
license=('GPL2')
backup=('etc/ddclient/ddclient.conf')
depends=('perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-digest-sha1'
         'net-tools')
makedepends=('git')
optdepends=('smtp-forwarder: email support requires sendmail binary')
source=("git+https://github.com/ddclient/ddclient.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')
validpgpkeys=('53B26AEDC08246715E15504B236B6291555E8401') # Sandro Jäckel

build() {
  cd ${pkgname}
  ./autogen
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/ddclient \
    --localstatedir=/var
  make
}

#check() {
#  cd ${pkgname}
#  make VERBOSE=1 check
#}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install

  install -Dm644 sample-etc_systemd.service "$pkgdir"/usr/lib/systemd/system/ddclient.service
  install -d "$pkgdir"/var/cache/ddclient

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/ddclient/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/ddclient/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/ddclient/README.ssl
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
