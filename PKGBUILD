# Maintainer: Nicolas LLOBERA <nllobera@gmail.com>
pkgname="hl-git"
pkgver=1.69
pkgrel=3
pkgdesc="Highlight (colorize) text data using regular expressions"

arch=('i686' 'x86_64')
url="https://github.com/mbornet-hl/hl"
license=('GPL3')

depends=('glibc')
makedepends=('gcc' 'git' 'gzip' 'flex' 'make')

source=("git+https://github.com/mbornet-hl/hl")
md5sums=(SKIP)

pkgver() {
  #cat "$srcdir/hl/src/cr_main.c" | grep -Eo 'Version [[:digit:]]+.[[:digit:]]+' | cut -d ' ' -f2
  cat "$srcdir/hl/src/cr_main.c" | grep -Po '(?<=Version )[[:digit:]]+.[[:digit:]]+'
}

build() {
	cd "$srcdir/hl/src"
	rm hl
	# remove the inline keyword (https://github.com/mbornet-hl/hl/issues/4)
	sed "s/inline //g" -i cr_main.c
	make
}

package() {
	install -d "$pkgdir/usr/bin"
	install -m755 "$srcdir/hl/src/hl" "$pkgdir/usr/bin"
	
	install -d "$pkgdir/etc/default"
	install -m644 "$srcdir/hl/config_files/hl" "$pkgdir/etc/default"
	
	gzip -9 -c "$srcdir/hl/man1/hl.1" > "$srcdir/hl/man1/hl.1.gz"
	install -d "$pkgdir/usr/share/man/man1"
	install -m644 "$srcdir/hl/man1/hl.1.gz" "$pkgdir/usr/share/man/man1"
	
	gzip -9 -c "$srcdir/hl/man5/hl.5" > "$srcdir/hl/man5/hl.5.gz"
	install -d "$pkgdir/usr/share/man/man5"
	install -m644 "$srcdir/hl/man5/hl.5.gz" "$pkgdir/usr/share/man/man5"
}
