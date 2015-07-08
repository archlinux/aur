# Maintainer: Gavin Troy <gavtroy@fastmail.fm>
# Based on heirloom-mailx PKGBUILD

pkgname=s-nail-git
pkgver=14.8.3_x15_g47a1a5c
pkgrel=1
pkgdesc="Commandline utility for sending and receiving email"
arch=('i686' 'x86_64')
url="http://sdaoden.users.sourceforge.net/code.html#s-nail"
license=('custom:BSD')
depends=('krb5' 'libidn' 'openssl')
makedepends=('git')
optdepends=('smtp-forwarder: alternatives for sending mail')
provides=('mailx' 'heirloom-mailx')
conflicts=('mailx' 'heirloom-mailx')
backup=('etc/mail.rc')
source=("git+https://gitlab.com/s-nail/s-nail.git")
sha1sums=('SKIP')

pkgver() {
	cd s-nail
	# pacman treats "_" like a ".", so use "_x" to seperate the git tag.
	# otherwise pacman may think XX.Y_git to XX.Y.Z_git is a downgrade
	gitver=$(git describe --tags | cut -c 2-)
	gitver=${gitver//-/_}; echo ${gitver/_/_x}
}

build() {
	cd s-nail
	CFLAGS+=" $CPPFLAGS"

	if check_option "debug" "y"; then
		config_target="CONFIG=DEVEL"
	fi

	make PREFIX=/usr \
	     SYSCONFDIR=/etc \
	     SYSCONFRC=/etc/mail.rc \
	     LIBEXECDIR=/usr/lib \
	     MAILSPOOL=/var/spool/mail \
	     WANT_AUTOCC=0 \
	     ${config_target:-} \
	     config

	make -f mk.mk _update-version

	make build
}

package() {
	cd s-nail
	make DESTDIR="${pkgdir}" chown=/usr/bin/true packager-install

	ln -sf s-nail "${pkgdir}"/usr/bin/mail
	ln -sf s-nail "${pkgdir}"/usr/bin/mailx
	ln -sf s-nail.1.gz "${pkgdir}"/usr/share/man/man1/mail.1.gz
	ln -sf s-nail.1.gz "${pkgdir}"/usr/share/man/man1/mailx.1.gz

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
