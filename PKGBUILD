# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-git
pkgver=3.12.0.r96.g3c64fb6
pkgrel=1
pkgdesc='A GTK+ based e-mail client - git checkout'
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org/"
depends=('gtk2' 'gnutls' 'startup-notification' 'enchant' 'gpgme' 'libetpan' 'compface'
	'libsm' 'dbus-glib' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'spamassassin' 'bogofilter' 'valgrind'
	# dependencies for plugins
	'libsoup' 'libgdata' 'webkitgtk2' 'libnotify' 'libcanberra' 'poppler-glib' 'pygtk')
optdepends=('python2:           needed for some tools and python plugin'
	'perl:              needed for some tools and perl plugin'
	'spamassassin:      adds support for spamfiltering'
	'bogofilter:        adds support for spamfiltering'
	'libnotify:         for notification plugin'
	'libcanberra:       for notification plugin'
	'dbus:              for notification plugin'
	'libxml2:           for gtkhtml2_viewer and rssyl plugins'
	'curl:              for gtkhtml2_viewer, vcalendar, rssyl and spamreport plugins'
	'libarchive:        for archive plugin and various other plugins'
	'libytnef:          for tnef_parse plugin'
	'webkitgtk2:        for the fancy webkit html plugin'
	'libsoup:           for the fancy webkit html plugin'
	'libgdata:          for gdata plugin'
	'poppler-glib:      for pdf viewer plugin'
	'ghostscript:       for pdf viewer plugin')
replaces=('sylpheed-claws' 'claws-mail-extra-plugins')
conflicts=('claws-mail-extra-plugins' 'claws-mail')
provides=('claws' 'claws-mail')
install=claws-mail.install
source=('claws-mail::git://git.claws-mail.org/claws.git'
	'http://www.eworm.de/download/linux/claws-timestamp.patch'
	'http://www.eworm.de/download/linux/claws-git-version.patch')
sha256sums=('SKIP'
            'bbf29f10602a74d73f1a30d791ae49c3b1d5abf20c48db0f4c81b0dca7bc0078'
	    'd377a7a6278b84152cbb8095461223829c3a21e2ca2f35aa8862c058540b61d5')

pkgver() {
	cd claws-mail/

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

prepare() {
	cd claws-mail/

	# show timestamp in about dialog
	patch -Np1 < ${srcdir}/claws-timestamp.patch
	git update-index --assume-unchanged src/gtk/about.c

	# change length of git commit hash
	patch -Np1 < ${srcdir}/claws-git-version.patch
	git update-index --assume-unchanged configure.ac

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

	# add --enable-new-addrbook to the options to use the new address book
	# do not forget to add claws-contacts to the dependencies then
	./configure --disable-maintainer-mode \
		--prefix=/usr \
		--disable-static \
		--enable-silent-rules \
		--disable-jpilot \
		--enable-enchant \
		--enable-gnutls \
		--enable-ldap \
		--enable-crash-dialog \
		--enable-pgpmime-plugin \
		--enable-spamassassin-plugin \
		--enable-bogofilter-plugin \
		--enable-appdata
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
		install -D -m0755 ${FILE} ${pkgdir}/usr/lib/claws-mail/tools/${FILE}
	done
}

