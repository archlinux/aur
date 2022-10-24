# Maintainer: Denton Liu <liu.denton@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-git
_gitname="${pkgname%-git}"
pkgver=v3.10.0.r0.g3e2cb0a
pkgrel=1

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient"
arch=('any')
license=('GPL2')
provides=("$_gitname")
conflicts=("$_gitname")

backup=('etc/ddclient/ddclient.conf')

depends=('perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-digest-sha1'
         'net-tools' 'perl-data-validate-ip')
optdepends=('smtp-forwarder: email support requires sendmail binary')

source=(git+https://github.com/ddclient/ddclient.git
        ddclient.service)

sha256sums=('SKIP'
            '6133eefbb4315ee2a7b24044ba9c2d5c4f9d19381eab8071415bf4dc73c1cf09')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ddclient
  ./autogen
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/ddclient \
    --localstatedir=/var
  make
}

check() {
  cd ddclient
  make check
}

package() {
  # hack so that we can merge in changes from upstream without changing all the
  # $pkgname to $_gitname
  (
  pkgname="$_gitname"

  cd ddclient

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir"/ddclient.service "$pkgdir"/usr/lib/systemd/system/ddclient.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/ddclient/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/ddclient/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/ddclient/README.ssl
  install -Dm644 sample-etc_cron.d_ddclient "$pkgdir"/usr/share/doc/ddclient/sample-etc_cron.d_ddclient
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT

  )
}
