# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=linpac-git
pkgver=0.28
pkgrel=1
pkgdesc="Amateur Radio AX.25 chat and PBBS program using Linux's AX.25 stack"
arch=('x86_64')
url="https://sourceforge.net/projects/linpac/"
license=('GPLv2')
depends=('libax25' 'ax25-apps' 'ncurses5-compat-libs' 'perl')
makedepends=('git')
conflicts=()
provides=('linpac')
replaces=('linpac')
source=(git+'https://git.code.sf.net/p/linpac/linpac')
sha256sums=('SKIP')

package() {
	cd ${pkgname%-git}

	sed -i '/maxx = stdscr->_maxx;/c\maxx = getmaxx(stdscr) -1;' src/applications/mailer/mail_screen.cc
	sed -i '/maxy = stdscr->_maxy;/c\maxy = getmaxy(stdscr) -1;' src/applications/mailer/mail_screen.cc
	sed -i '/main_window->_clear = TRUE;/c\clearok(main_window, TRUE);' src/applications/mailer/mail_screen.cc
	sed -i '/setIConfig("mon_end_line", stdscr->_maxy);/c\setIConfig("mon_end_line", getmaxy(stdscr) -1);' src/linpac.cc
	sed -i '/setIConfig("max_x", stdscr->_maxx);/c\setIConfig("max_x", getmaxx(stdscr) -1);' src/linpac.cc

	autoreconf --install
	./configure
	make install DESTDIR=$pkgdir
}
