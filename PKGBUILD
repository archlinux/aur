# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=mailpile-git
pkgver=r4977.2438e49
pkgrel=1
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features."
arch=('any')
license=('AGPL3')
depends=('python2-pillow' 'python2-lxml' 'python2-jinja' 'spambayes' 'python2-pgpdump')
url="http://www.mailpile.is"
provides=("mailpile")
conflicts=("mailpile")
source=('git://github.com/pagekite/Mailpile.git' 'fix-rootdir.patch')
md5sums=('SKIP' '777cd528c847876b6f720af8f21951db')

pkgver() {
  cd "${srcdir}/Mailpile"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

	# Fix path
	patch -p1 < fix-rootdir.patch

	cd "${srcdir}/Mailpile"

	# python2 fixes
	find . -type f -exec sed -i 's^bin/python^bin/python2^g' {} \;
	sed -i 's^python ^python2 ^g' Makefile

}

build() {

	cd "${srcdir}/Mailpile"

	# Compile bytecode
	printf '#!/bin/env python2\nimport compileall\ncompileall.compile_dir("mailpile", force=1)' > compile.py
	chmod +x compile.py
	./compile.py

}

package() {

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share"

	cp -r "${srcdir}/Mailpile/shared-data" "${pkgdir}/usr/share/mailpile"
	cp -r "${srcdir}/Mailpile/mailpile" "${pkgdir}/usr/share/mailpile/mailpile"
	cp "${srcdir}/Mailpile/mp" "${pkgdir}/usr/bin/"

	find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
	find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
	chmod 755 "${pkgdir}/usr/bin/mp"

}
