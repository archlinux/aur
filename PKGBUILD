# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: SanskritFritz (gmail)

pkgname=fish-git
_gitname="fish-shell"
pkgver=2012.01.31
pkgrel=1
epoch=1
pkgdesc="User friendly shell intended mostly for interactive use (gitorius.org legacy version)."
arch=('i686' 'x86_64')
url="http://gitorious.org/fish-shell"
license=("GPL" "LGPL" "BSD" "MIT")
depends=('ncurses' 'bc')
optdepends=('python2: make_completions script')
makedepends=('doxygen' 'git')
provides=('fish')
conflicts=('fish')
install=fish.install
source=("git://gitorious.org/fish-shell/fish-shell.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd $srcdir/$_gitname
	autoconf
	./configure --prefix=/usr --sysconfdir=/etc --docdir=/usr/share/doc/fish --without-xsel
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR="$pkgdir" install
	install -D -m644 user_doc/html/license.html "$pkgdir/usr/share/licenses/fish/license.html"

	install -m755 make_completions.py "$pkgdir/usr/bin/make_completions"
	sed -i "s/python/python2/" "$pkgdir/usr/bin/make_completions"
}
