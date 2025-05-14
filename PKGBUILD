# Maintainer: Lennard Hofmann <lennard.hofmann@web.de>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=gnubc-git
pkgver=r16.d6397df
pkgrel=1
pkgdesc='Fork of GNU bc with small improvements'
arch=('x86_64')
url='https://github.com/nlitsme/gnubc'
license=('MIT')
makedepends=('ed' 'git')
conflicts=('bc')
source=("git+https://github.com/nlitsme/gnubc")
sha512sums=('SKIP')

pkgver() {
	cd gnubc
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd gnubc
	sh ./autogen.sh
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info
		# --with-readline  # I recommend rlwrap instead for persistent history

	make -j1
}

check () {
	cd gnubc

	# This gives me some minor precision errors :shrug:
	echo "quit" | ./bc/bc -l Test/checklib.b
}

package() {
	cd gnubc

	make DESTDIR="${pkgdir}" install
	install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
