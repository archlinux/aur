# Maintainer: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# https://github.com/zizzfizzix/pkgbuilds
#
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=cfengine
pkgver=3.6.0
pkgrel=1
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='http://www.cfengine.org'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qdbm' 'openssl' 'pcre' 'libxml2')
makedepends=('which')
optdepends=('tokyocabinet' 'libvirt' 'postgresql-libs' 'libmariadbclient' 'acl')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://s3.amazonaws.com/cfengine.package-repos/tarballs/${pkgname}-${pkgver}.tar.gz"
        'cf-execd.service'
        'cf-monitord.service'
        'cf-serverd.service')
md5sums=('42b0d3a90a1b60bf25cf63ccd6366f59'
         'dba17dc5133b8fa86de11577120d46c5'
         'a2f9db31408f288cb934397ffb474db3'
         'ff28f7de9b81b4673082a2640a318896')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-workdir=/var/${pkgname} \
    --with-openssl \
    --with-pcre \
    --with-libacl=check \
    --with-libxml2 \
    --with-libvirt=check \
    --with-qdbm \
    --with-mysql=check \
    --with-tokyocabinet=check \
    --with-postgresql=check

  make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=$pkgdir install

	install -D -m644 ${srcdir}/cf-execd.service \
		${pkgdir}/usr/lib/systemd/system/cf-execd.service
	install -D -m644 ${srcdir}/cf-serverd.service \
		${pkgdir}/usr/lib/systemd/system/cf-serverd.service
	install -D -m644 ${srcdir}/cf-monitord.service \
		${pkgdir}/usr/lib/systemd/system/cf-monitord.service
}

# vim:set ts=2 sw=2 et:
