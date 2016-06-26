# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Rogof <rogof /at/ gmx /dot/ com>
# Contributor: Felix Hanley <felix /at/ seconddrawer /dot/ com /dot/ au>
# Contributor: Carlos Solis <csolisr /at/ azkware /dot/ net>

pkgname=multimarkdown
pkgver=5.3.0
pkgrel=1
pkgdesc="A superset of Markdown with various output formats"
arch=("i686" "x86_64")
url="http://fletcherpenney.net/multimarkdown/"
license=("GPL2" "MIT")
depends=("bash")
makedepends=("git" "glib2" "cmake")
optdepends=("texlive-most: LaTeX and PDF output support")
options=(!buildflags)
source=("multimarkdown::git+https://github.com/fletcher/MultiMarkdown-5.git#tag=$pkgver")
sha1sums=("SKIP")

prepare() {
	cd "$srcdir/multimarkdown"
	#git submodule init && git submodule update
	#touch greg/greg.c
	./link_git_modules
	./update_git_modules
}

build() {
	cd "$srcdir/multimarkdown"
	make
}

package() {
	cd "$srcdir/multimarkdown/scripts"
	mv ./markdown ./multimarkdown

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 multimarkdown \
		mmd2tex \
		mmd2pdf \
		mmd2opml \
		mmd2odf \
		mmd2all \
		"$pkgdir/usr/bin/"

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	cd ..
	cp -a submodules/documentation/* "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
