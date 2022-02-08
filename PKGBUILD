# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd-git"
pkgver=20220208.df61f07
pkgrel=1
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64')
url="https://gitlab.com/wyrd-calendar/"
license=('GPL2')
provides=('wyrd')
conflicts=('wyrd')
depends=('remind' 'ncurses' 'less' 'opam')
makedepends=('git' 'ocaml' 'camlp4' 'python'  'autoconf')
# doc: 'hevea' 'texlive-core' 'texlive-latexextra'
source=("git+https://gitlab.com/wyrd-calendar/wyrd.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
	git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

build() {
        cd "$srcdir/${pkgname%-git}"
        opam init -n
        opam install -y curses
        eval "$(opam env)"
        # Avoid compiling doc
        sed -i 's/$(MAKE) -C doc.*/echo "Not compiling doc"/' Makefile.in
        sed -i 's/.*doc\/wyrd.*//' Makefile.in
        ./prep-devtree.sh
        ./configure --exec-prefix=/usr --prefix=/usr --sysconfdir=/etc
        make clean
	make
}

package() {
        cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
