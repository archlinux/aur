# Maintainer: pounceandmiss <pounceandmiss@proton.me>
# Contributor: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
#
# Based on the AUR tcllib PKGBUILD.
#
# Tcllib for tcl9, installed into its prefix (/usr/lib/tcl9). The apps go to
# /usr/lib/tcl9/bin and run with tclsh9, so they do not clash with tcllib for
# tcl 8.6.

pkgname=tcl9-tcllib
_pkgname=tcllib
pkgver=2.0
pkgrel=1
pkgdesc='Set of pure-Tcl extensions (for tcl9)'
arch=(any)
url='https://core.tcl-lang.org/tcllib/'
license=(TCL)
depends=(tcl9)
_archive="$_pkgname-$pkgver"
source=("https://core.tcl-lang.org/tcllib/uv/$_archive.tar.gz")
sha256sums=('590263de0832ac801255501d003441a85fb180b8ba96265d50c4a9f92fde2534')

_prefix=/usr/lib/tcl9

package() {
	cd "$_archive"
	tclsh9 installer.tcl \
		-pkg-path "$pkgdir$_prefix/lib/$_pkgname$pkgver" \
		-app-path "$pkgdir$_prefix/bin" \
		-nroff-path "$pkgdir$_prefix/share/man/mann" \
		-example-path "$pkgdir/usr/share/doc/$pkgname" \
		-no-html -no-wait -no-gui
	install -Dm644 license.terms -t "$pkgdir/usr/share/licenses/$pkgname/"

	# To avoid conflict with Tcl 9.1's unicode command
	mv "$pkgdir$_prefix"/share/man/mann/{,tcllib-}unicode.n

	# Run the apps with Tcl 9 rather than whatever tclsh is first in PATH
	sed -i -e '1s|^#! */usr/bin/env tclsh$|#!/usr/bin/tclsh9|' \
		-e 's|^exec tclsh "\$0"|exec tclsh9 "$0"|' \
		"$pkgdir$_prefix"/bin/*
}
