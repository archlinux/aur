# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerhard Brauer <gerbra@archlinux.de>

pkgname=nbd-git
pkgver=3.15.2.r95.g286630e
pkgrel=1
pkgdesc="tools for network block devices, allowing you to use remote block devices over TCP/IP - git checkout"
arch=('i686' 'x86_64')
url="http://nbd.sourceforge.net"
license=('GPL')
depends=('glib2' 'gnutls')
backup=('etc/nbd-server/config')
makedepends=('git' 'docbook-utils' 'docbook-sgml' 'docbook-xml')
conflicts=('nbd')
provides=('nbd')
source=('nbd::git://git.code.sf.net/p/nbd/code'
	'config'
	'nbd.service'
	'sysusers_nbd.conf')
sha256sums=('SKIP'
            'ee2e9fbbeb8a8b9b71d16b6f32eb41788f6def9d00cc4a47897ed3cb97cdde7c'
            '7f57d8764f9bf974ed407835467141ff54c9ed05471312a20437b398834c1f0c'
            '11bbab28111c519d043bd96934e16508fe1483c9741e781eea9b9544b111505d')

pkgver() {
	cd nbd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

build(){
  cd nbd/

  ./autogen.sh

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-syslog

  make
}

package() {
  cd nbd/

  make DESTDIR="${pkgdir}" install
  install -D -m644 systemd/nbd@.service "${pkgdir}"/usr/lib/systemd/system/nbd@.service

  install -D -m644 "${srcdir}"/config "${pkgdir}"/etc/nbd-server/config
  install -D -m644 "${srcdir}"/nbd.service "${pkgdir}"/usr/lib/systemd/system/nbd.service
  install -D -m644 "${srcdir}"/sysusers_nbd.conf "${pkgdir}"/usr/lib/sysusers.d/nbd.conf

  install -D -m644 doc/README "${pkgdir}"/usr/share/doc/nbd/README
}

