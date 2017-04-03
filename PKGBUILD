# $Id$
# Maintainer: Joey Pabalinas <alyptik@protonmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Committer: dorphell <dorphell@gmx.net>

pkgname=screen-git
_pkgname=screen
pkgver=v.4.2.1.580.gfbee2ab
pkgrel=1
pkgdesc='Full-screen window manager that multiplexes a physical terminal with true-color support'
url='https://www.gnu.org/software/screen/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'pam')
validpgpkeys=('2EE59A5D0C50167B5535BBF1B708A383C53EF3A4'
              '71AA09D9E8870FDB0AA7B61E21F968DEF747ABD7')
source=("${_pkgname}::git+http://git.savannah.gnu.org/git/screen.git"
        'tmpfiles.d'
        'pam.d')

sha256sums=('SKIP'
            '1f33ce4faca7bd05dd80403411af31e682d5d23e79558e884ae5a35f1dd96223'
            '971c25929ea97422c09e10679ab98e9e6c59295aae1a4a9970909d2206e23090')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!makeflags')

_ptygroup=5 #the UID of our PTY/TTY group

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags |sed 's/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}/src"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--enable-pam \
		--enable-utmp \
		--enable-telnet \
		--enable-socket-dir \
		--with-system_screenrc="/etc/screenrc" \
		--with-pty-mode="0622" \
		--with-pty-group="$_ptygroup" \
		--with-pty-rofs="yes"

	make
}

package() {
	cd "${srcdir}/${_pkgname}/src"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/pam.d" "${pkgdir}"/etc/pam.d/screen
	install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}"/usr/lib/tmpfiles.d/screen.conf

	install -Dm644 etc/etcscreenrc "${pkgdir}"/etc/screenrc
	install -Dm644 etc/screenrc "${pkgdir}"/etc/skel/.screenrc
}
