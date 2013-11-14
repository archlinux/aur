# Maintainer: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# https://github.com/zizzfizzix/pkgbuilds
#
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=cfengine
pkgver=3.5.2
pkgrel=1
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='http://www.cfengine.org'
license=('GPL3')
options=('!libtool')
arch=('i686' 'x86_64')
depends=('qdbm' 'openssl' 'pcre' 'libxml2')
optdepends=('tokyocabinet' 'libvirt' 'postgresql-libs' 'libmariadbclient')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::http://cfengine.com/source-code/download?file=${pkgname}-${pkgver}.tar.gz"
        'cf-execd.service'
        'cf-monitord.service'
        'cf-serverd.service')
md5sums=('fa5a5270803fa24e9ab662aae6f73b4a'
         'bf64e1dedbcef5a74e3b585076135c87'
         'c56bde562ec29c1533433a320f4f4b5d'
         '2a3aed38b03b14335a70103e45d42ee8')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-workdir=/var/lib/${pkgname} \
    --with-openssl \
    --with-pcre \
    --with-libacl=check \
    --with-libxml2 \
    --without-libvirt \
    --with-qdbm \
    --without-mysql \
    --without-tokyocabinet \
    --without-postgresql

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

