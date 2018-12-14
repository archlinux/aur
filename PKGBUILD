# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-git
pkgver=3.17.2.r1.g8f5e5040e
pkgrel=1
pkgdesc='A GTK+ based e-mail client - git checkout'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://www.claws-mail.org/'
depends=('gtk2' 'gnutls' 'startup-notification' 'enchant' 'gpgme' 'libetpan' 'compface'
	'libsm' 'dbus-glib' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'spamassassin' 'bogofilter' 'valgrind'
	# dependencies for plugins
	'libgdata' 'libnotify' 'libcanberra' 'poppler-glib' 'pygtk' 'dillo'
	# deps to build the docs
	'docbook-utils' 'texlive-core' 'texlive-formatsextra')
optdepends=('python2:           needed for some tools and python plugin'
	'perl:              needed for some tools and perl plugin'
	'spamassassin:      adds support for spamfiltering'
	'bogofilter:        adds support for spamfiltering'
	'libnotify:         for notification plugin'
	'libcanberra:       for notification plugin'
	'dbus:              for notification plugin'
	'libxml2:           for rssyl plugins'
	'curl:              for vcalendar, rssyl and spamreport plugins'
	'libarchive:        for archive plugin and various other plugins'
	'libytnef:          for tnef_parse plugin'
	'libgdata:          for gdata plugin'
	'poppler-glib:      for pdf viewer plugin'
	'ghostscript:       for pdf viewer plugin'
	'dillo:             for html viewer plugin')
replaces=('sylpheed-claws' 'claws-mail-extra-plugins')
conflicts=('claws-mail-extra-plugins' 'claws-mail')
provides=('claws' 'claws-mail')
source=('claws-mail::git://git.claws-mail.org/claws.git')
sha256sums=('SKIP')

pkgver() {
	cd claws-mail/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd claws-mail/

	# fixes for python2
	sed -i 's@^#!.*python.*@#!/usr/bin/python2@' tools/*.py
	git update-index --assume-unchanged tools/*.py
}

build() {
	cd claws-mail/

	# run autogen without options - it runs ./configure for us, but we need to fix python first
	NOCONFIGURE=1 ./autogen.sh

	# fixes for python2
	export PYTHON="/usr/bin/python2"
	sed -i 's:python -c:python2 -c:g' configure

	# add --enable-alternate-addressbook to the options to use the
	# new/alternate address book
	# do not forget to add claws-contacts to the dependencies then
	./configure \
		--prefix=/usr \
		--disable-jpilot \
		--disable-maintainer-mode \
		--disable-manual \
		--disable-static \
		--enable-bogofilter-plugin \
		--enable-crash-dialog \
		--enable-enchant \
		--enable-gnutls \
		--enable-ldap \
		--enable-pgpmime-plugin \
		--enable-silent-rules \
		--enable-spamassassin-plugin
		#--help
	make

	# build extra tools
	cd tools/
	make
}

package() {
	cd claws-mail/

	make DESTDIR="${pkgdir}" install

	# install extra tools
	# all executables and .conf files ; only top directory
	cd tools
	for FILE in $(find -maxdepth 1 -type f -and -perm /111 -or -name '*.conf'); do
		install -D -m0755 ${FILE} "${pkgdir}"/usr/lib/claws-mail/tools/${FILE}
	done
}

