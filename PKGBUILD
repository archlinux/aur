# Maintainer: Bharadwaj Raju <bharadwaj.raju@keemail.me>
# Contributor: Daniel Sandman (shellkr) <revoltism+AUR$gmail.com>
# Contributor: doylefermi

pkgname=textsuggest-git
_gitname=${pkgname%-git*}
pkgver=r35.ccbcbc9
pkgrel=1
pkgdesc='Simple Linux utility to autocomplete words using rofi'
arch=('any')
url="https://gitlab.com/bharadwaj-raju/TextSuggest"
license=('GPL3')
depends=('python' 'dbus-c++' 'qt5-base' 'xdotool' 'xclip' 'libxcb')
makedepends=('git' 'gcc' 'make' 'automake')
provides=("$_gitname")
source=("$_gitname::git+https://gitlab.com/bharadwaj-raju/TextSuggest.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	sh build.sh
}

package() {

	cd "$srcdir/$_gitname"

    install -d "$pkgdir/usr/share/textsuggest"
    install -d "$pkgdir/usr/bin"

	cp -rf textsuggest/dictionaries/ "$pkgdir/usr/share/textsuggest/"

	install -d "$pkgdir/usr/share/textsuggest/processors"
	cp bin/math_expression "$pkgdir/usr/share/textsuggest/processors"
	cp bin/command "$pkgdir/usr/share/textsuggest/processors"

	install -D -m755 bin/textsuggest "$pkgdir/usr/bin/textsuggest"
	install -D -m755 bin/textsuggest-server "$pkgdir/usr/bin/textsuggest-server"

	chmod -R a+rwx "$pkgdir/usr/share/textsuggest/processors"

	install -D -m644 README.md "$pkgdir/usr/share/doc/textsuggest/README"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/textsuggest/COPYING"

	chmod -R a+rw "$pkgdir/usr/share/textsuggest"
	chmod -R a+rw "$pkgdir/usr/share/textsuggest/dictionaries"
	chmod -R a+rw "$pkgdir/usr/share/textsuggest/dictionaries/*"
	chmod a+x "$pkgdir/usr/bin/textsuggest"
	chmod a+x "$pkgdir/usr/bin/textsuggest-server"

}
