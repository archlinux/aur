# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: michalzxc
# Contributor: nbags <neilbags@gmail.com>
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=fail2ban6
pkgver=0.9.6
pkgrel=2
provides=(fail2ban)
conflicts=(fail2ban)
pkgdesc='Bans IPs after too many failed authentication attempts (IPv6 supported based on crycode patch)'
url='http://www.fail2ban.org/'
license=('GPL')
arch=('any')
depends=('iptables' 'python-pyinotify' 'whois' 'sqlite' 'python-systemd')
makedepends=('python-setuptools')
checkdepends=('python-setuptools' 'python-coverage')
backup=(etc/fail2ban/fail2ban.conf
        etc/fail2ban/jail.conf
        etc/logrotate.d/fail2ban)
install=fail2ban.install
source=(fail2ban-$pkgver.tar.gz::https://github.com/fail2ban/fail2ban/archive/$pkgver.tar.gz
        failregex.patch
        filter.patch
        ip64tables
        ip64tables-allports.conf
        ip64tables-multiport.conf
        ip64set
        ip64tables-ipset-proto6-allports.conf)
md5sums=('8758789d40366f5e212b4e6b629297d1'
         '096da47cbf505d2cf6fb718d7df9f9a5'
         '0640491c11f56f91f1ce6fe31a3d84c2'
         '2ad1875d08cc53537e623cea334baa25'
         '1bb20dcd9db96e95c79cfe1e77f823dd'
         '7785327e2fae4b051be7a82e97318010'
         '6119045904445c559e9e53cb1a9c5fb0'
         'ecf4c03116e4570281f8e0f87d5b489b')

check() {
  cd fail2ban-$pkgver
  ./fail2ban-2to3
  coverage run bin/fail2ban-testcases || warning "Tests failed"
}

package() {
  cd fail2ban-$pkgver
  
  # patch crycode ipv6
  cd fail2ban/server
  patch < $srcdir/failregex.patch
  patch < $srcdir/filter.patch
  cd ../..
  
  python setup.py install --prefix /usr --root "$pkgdir" --optimize=1

  chmod 644 "$pkgdir/usr/lib/python3.6/site-packages/fail2ban-$pkgver-py3.6.egg-info"/*

  install -Dm644 files/fail2ban.service \
    "$pkgdir"/usr/lib/systemd/system/fail2ban.service
  install -Dm644 files/fail2ban-tmpfiles.conf \
    "$pkgdir"/usr/lib/tmpfiles.d/fail2ban.conf
  install -Dm644 files/fail2ban-logrotate \
    "$pkgdir"/etc/logrotate.d/fail2ban
  install -Dm644 files/bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/fail2ban

  # fix sendmail location
  sed -i 's/sbin/bin/g' "$pkgdir"/etc/fail2ban/action.d/sendmail*.conf

  install -Dm644 man/fail2ban.1 "$pkgdir"/usr/share/man/man1/fail2ban.1
  install -Dm644 man/fail2ban-client.1 \
    "$pkgdir"/usr/share/man/man1/fail2ban-client.1
  install -Dm644 man/fail2ban-regex.1 \
    "$pkgdir"/usr/share/man/man1/fail2ban-regex.1
  install -Dm644 man/fail2ban-server.1 \
    "$pkgdir"/usr/share/man/man1/fail2ban-server.1
  install -Dm644 man/jail.conf.5 "$pkgdir"/usr/share/man/man5/jail.conf.5

  # include ip64 files
  install -Dm755 $srcdir/ip64tables $pkgdir/usr/bin/ip64tables
  install -Dm644 $srcdir/ip64tables-allports.conf $pkgdir/etc/fail2ban/action.d/ip64tables-allports.conf
  install -Dm644 $srcdir/ip64tables-multiport.conf $pkgdir/etc/fail2ban/action.d/ip64tables-multiport.conf
  install -Dm755 $srcdir/ip64set $pkgdir/usr/bin/ip64set
  install -Dm644 $srcdir/ip64tables-ipset-proto6-allports.conf $pkgdir/etc/fail2ban/action.d/ip64tables-ipset-proto6-allports.conf

  rm -r "$pkgdir/run"
}
