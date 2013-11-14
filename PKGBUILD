# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Christian Berendt <christian@thorlin.de>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=cfengine
pkgver=3.5.0
pkgrel=2
pkgdesc="automated suite of programs for configuring and maintaining Unix-like computers."
url="http://www.cfengine.org"
license=('GPL3')
arch=('i686' 'x86_64')
# depends on a bunch of things because of specific bundles, should be
# modular! Trying to have as little here as possible
depends=('qdbm' 'openssl' 'pcre'  'acl' 'libxml2')
# do not depend on things which are not packages, only in AUR, sadly qdbm
# is required (as one of them is required)
# also libvirt makes sence for hosting servers, but not applicances (it
# has far too many dependencies on X11 libraries)
# database support is considered optional, enable if needed
optdepends=('tokyocabinet' 'libvirt' 'postgresql-libs' 'libmariadbclient')

source=(
  "${pkgname}-${pkgver}.tar.gz::http://cfengine.com/source-code/download?file=${pkgname}-${pkgver}.tar.gz"
  "cf-execd.service"
  "cf-monitord.service"
  "cf-serverd.service"
)
md5sums=('06ceba929f4d67e25599cf27d6e45cc0'
         'bf64e1dedbcef5a74e3b585076135c87'
         'c56bde562ec29c1533433a320f4f4b5d'
         '2a3aed38b03b14335a70103e45d42ee8')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Remove one (or both) of the --with-mysql and/or --with-postgresql
	# lines if you want to reduce dependency chain"
	./configure \
		--prefix=/usr \
		--with-openssl \
		--with-pcre \
		--without-libvirt \
		--with-libacl=check \
		--with-libxml2 \
		--without-postgresql \
		--without-mysql \
		--with-workdir=/srv/cfengine \
		--with-qdbm \
		--without-tokyocabinet

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

