# Maintainer: Sergey Shatunov <me@aur.rocks>
# Contributor: Denton Liu <liu.denton@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-git
_pkgname="${pkgname%-git}"
pkgver=v4.0.0.r1.g50e8d2e
pkgrel=2
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient"
arch=('any')
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/ddclient/ddclient.conf')
depends=('perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-digest-sha1'
         'net-tools')
makedepends=('git')
#checkdepends=('perl-http-daemon' 'perl-test-mockmodule' 'perl-test-warnings' 'perl-plack')
optdepends=('smtp-forwarder: email support requires sendmail binary')
source=("git+https://github.com/ddclient/ddclient.git")
sha512sums=('SKIP')
validpgpkeys=('53B26AEDC08246715E15504B236B6291555E8401') # Sandro Jäckel

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./autogen
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

check() {
  cd "$_pkgname"
  # perl-plack currently broken in aur, so disable tests for now
  #make VERBOSE=1 check
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 sample-etc_systemd.service "$pkgdir"/usr/lib/systemd/system/ddclient.service
  install -d "$pkgdir"/var/cache/ddclient

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/ddclient/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/ddclient/README.md
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT

  # https://github.com/ddclient/ddclient/blob/50e8d2ed0072462dd1a00268593242d7ae809531/ddclient.in#L1912
  # ddclient.conf should be root:ddclient with 640 permissions
  chmod 640 "$pkgdir"/etc/ddclient/ddclient.conf
  echo 'g ddclient - -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'z /etc/ddclient/ddclient.conf 0640 root ddclient - -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
