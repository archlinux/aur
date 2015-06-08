# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

pkgname='ovirt-guest-agent'
pkgver='1.0.10'
pkgrel='3'
pkgdesc='The oVirt Guest Agent'
arch=('any')
url='http://wiki.ovirt.org/Category:Ovirt_guest_agent'
depends=('systemd' 'python2' 'python2-dbus' 'python2-gobject2' 'dbus-glib' 'python2-ethtool' 'usermode')
makedepends=('pam' 'libtool' 'python2' 'python2-pep8' 'pep8')
license='ASL 2.0'
install='ovirt-guest-agent.install'
source=('ovirt-guest-agent.install'
	'ovirt-guest-agent.service'
	'https://evilissimo.fedorapeople.org/releases/ovirt-guest-agent/1.0.10/ovirt-guest-agent-1.0.10.3.tar.bz2')
sha256sums=('10c5dc2fa265e6944d9316003fb04163ff005debddd3e86ad4ce3e4ec00ee893'
	    '545235630d6da51b547c1e8c177ddbf9f57aa81017b8683274a449d46e765cc4'
	    'd11e1a6a9a36a2e318cfc7f063f22a30b29594284f31e5a5903bbd3984c1070b')
backup=('etc/ovirt-guest-agent.conf')

build() {
  cd "$pkgname-$pkgver.$pkgrel"
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --includedir=/usr/include/security \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-pam-prefix=/etc \
    --without-gdm \
    --without-kdm \
    --enable-securedir=/usr/lib/security
  make
}

package() {
  pushd "$pkgname-$pkgver.$pkgrel"
  make DESTDIR="$pkgdir" install
  popd
  install -dm775 -o 175 -g 175 "$pkgdir/var/log/ovirt-guest-agent"
  rm "$pkgdir/usr/lib/systemd/system/ovirt-guest-agent.service"
  install -Dm644 "ovirt-guest-agent.service" "$pkgdir/usr/lib/systemd/system/ovirt-guest-agent.service"
  sed -i 's/bin\/python/bin\/python2/g' "$pkgdir/usr/share/ovirt-guest-agent/ovirt-guest-agent.py"
  sed -i 's/env python/env python2/g' "$pkgdir/usr/share/ovirt-guest-agent/diskmapper"
  sed -i 's/bin\/python/bin\/python2/g' "$pkgdir/usr/share/ovirt-guest-agent/LockActiveSession.py"
}
