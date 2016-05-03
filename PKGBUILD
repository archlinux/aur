# Maintainer: Nicolas LLOBERA <nllobera@gmail.com>
pkgname="hl-git"
pkgver=1.69
pkgrel=4
pkgdesc="Highlight (colorize) text data using regular expressions"

arch=('i686' 'x86_64')
url="https://github.com/mbornet-hl/hl"
license=('GPL3')

depends=('bash') # Dependency glibc included but already satisfied
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
	install -D -m 755 "$srcdir/hl/src/hl" "$pkgdir/usr/bin/hl"
	
	install -D -m 644 "$srcdir/hl/config_files/hl" "$pkgdir/etc/default/hl"
	
	install -d "$pkgdir/usr/lib/hl_bin"
	cp -R "$srcdir/hl/hl_bin" "$pkgdir/usr/lib"
	
	install -D -m 755 /dev/null "$pkgdir/etc/profile.d/hl.sh"
	echo '#!/bin/sh -f

export PATH=/usr/lib/hl_bin:${PATH}' > "$pkgdir/etc/profile.d/hl.sh"
	
	install -D -m 644 /dev/null "$pkgdir/usr/share/man/man1/hl.1.gz"
	gzip -9 -c "$srcdir/hl/man1/hl.1" > "$pkgdir/usr/share/man/man1/hl.1.gz"
	
	install -D -m 644 /dev/null "$pkgdir/usr/share/man/man5/hl.5.gz"
	gzip -9 -c "$srcdir/hl/man5/hl.5" > "$pkgdir/usr/share/man/man5/hl.5.gz"
}
