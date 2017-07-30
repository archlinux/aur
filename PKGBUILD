# Maintainer: Gavin Troy <gavtroy@fastmail.fm>
# Based on heirloom-mailx PKGBUILD

pkgname=s-nail-git
pkgver=14.9.0_x15_g1dd0ed30
pkgrel=1
pkgdesc="Commandline utility for sending and receiving email"
arch=('i686' 'x86_64')
url="https://www.sdaoden.eu/code.html#s-nail"
license=('custom:BSD')
depends=('krb5' 'libidn' 'openssl')
makedepends=('git')
optdepends=('smtp-forwarder: alternatives for sending mail')
provides=('mailx' 'heirloom-mailx')
conflicts=('mailx' 'heirloom-mailx')
backup=('etc/mail.rc')
source=("git+https://git.sdaoden.eu/scm/s-nail.git")
sha1sums=('SKIP')

pkgver() {
	cd s-nail
	# pacman treats "_" like a ".", so use "_x" to seperate the git tag.
	# otherwise pacman may think XX.Y_git to XX.Y.Z_git is a downgrade
	git describe --tags | cut -c 2- | tr - _ | sed 's#_\([0-9]\)#_x\1#'
}

build() {
	cd s-nail
	CFLAGS+=" $CPPFLAGS"

	if check_option "debug" "y"; then
		config_target="CONFIG=DEVEL"
	fi

	make VAL_PREFIX=/usr \
	     VAL_SYSCONFDIR=/etc \
	     VAL_SYSCONFRC=mail.rc \
	     VAL_LIBEXECDIR=/usr/lib \
	     OPT_AUTOCC=0 \
	     LD_LIBRARY_PATH="$(fakeroot sh -c 'echo $LD_LIBRARY_PATH')" \
	     ${config_target:-} \
	     config

	make -f mk-config.mk _update-version ||:

	make build
}

package() {
	cd s-nail
	make DESTDIR="${pkgdir}" install

	ln -sf s-nail "${pkgdir}"/usr/bin/mail
	ln -sf s-nail "${pkgdir}"/usr/bin/mailx
	ln -sf s-nail.1.gz "${pkgdir}"/usr/share/man/man1/mail.1.gz
	ln -sf s-nail.1.gz "${pkgdir}"/usr/share/man/man1/mailx.1.gz

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
