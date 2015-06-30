# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gergely Tamas <dice@mfa.kfki.hu>

pkgname=gq-git
pkgver=0.r1143.g76e1dea
pkgrel=5
pkgdesc='interactive graphical LDAP browser - git version'
conflicts=('gq')
provides=('gq')
url='http://sourceforge.net/projects/gqclient'
license=('GPL')
depends=('libxml2' 'gtk2' 'libgnome-keyring' 'libglade' 'libldap'
	'libgpg-error' 'libgcrypt' 'krb5' 'gnome-icon-theme')
makedepends=('intltool' 'git' 'gnome-common')
arch=('i686' 'x86_64')
install=gq.install
source=('gqclient::git://git.code.sf.net/p/gqclient/code'
	'http://www.eworm.de/download/linux/gq-glib.patch'
	'http://www.eworm.de/download/linux/gq-autogen.patch'
	'http://www.eworm.de/download/linux/gq-pane.patch')
sha256sums=('SKIP'
            '3bdd9115c0717073decf1ee36bd784fe33e850224aca7c7f13a17463e45f0d53'
            '59e6958736951642dfa60d212df1db163adfe36343fae9a9eb4c076c57d8e758'
            '0b444deca182ed960d19e0200f6af8a675a25644cac80db1a228046c3d54fb5c')

pkgver() {
	cd gqclient/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd gqclient/

	# compile fix
	patch -Np1 -i ${srcdir}/gq-glib.patch

	# fix for latest automake
	patch -Np1 -i ${srcdir}/gq-autogen.patch

	# just a small improvemant, change pane width
	patch -Np1 -i ${srcdir}/gq-pane.patch

	# use icon stock_addressbook from gnome-icon-theme
	sed -i '/^Icon=/c Icon=stock_addressbook' data/gq.desktop.in

	./autogen.sh \
		--prefix=/usr \
		--disable-debugging \
		--disable-update-mimedb \
		--with-kerberos5=yes
	make
}

package() {
	cd gqclient/

	make DESTDIR=${pkgdir} install
}

