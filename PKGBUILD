#!/bin/bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Jumps are op (jumpsareop@gmail.com)
# This is a fork of rxvt-unicode-pixbuf-patched.
# Added sixel and truecolor support.

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-pixbuf-sixel-patched
pkgver=9.31
pkgrel=0
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt), with pixbuf, sixel support, truecolors, fixed font spacing, fixed line spacing, vi-bindings for matcher and fixed opacity.'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo' 'gdk-pixbuf2' 'libptytty')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=("http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2"
		'urxvt.desktop'
		'urxvtc.desktop'
		'urxvt-tabbed.desktop'
		'font-width-fix.patch'
		'line-spacing-fix.patch'
		'background-opacity.patch'
		'matcher-vi-bindings.patch'
		'rxvt-unicode-sixel.patch'
		'rxvt-unicode-truecolor.patch')
sha1sums=(
	'44b31b4d9890aea4a6d66998bfb0c39e727fdf39'
	'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
	'62c4ffecfce6967def394dd4d418b68652372ea2'
	'cd204d608d114d39c80331efe0af0231ad6b7e18'
	'b88162cea68c03748a9a9ef71cda1af8e427e4de'
	'33d107d7f1d363fb98d0da225d4afec9644fb7b1'
	'e4bbdc1d2d8cae060473dcdf75bb1c952cb0dbdf'
	'ccf50bd1097a0558e2bf43a602a083960003e459'
	'dc01a8355b36d6efaea65716909ccd0f696f163f'
	'da6e363bb7a3dbc164b58d5b457a6e9e5703df73')

prepare(){
	cd "$_pkgname-$pkgver" || return 1

	for _patch in font-width-fix.patch line-spacing-fix.patch \
		background-opacity.patch matcher-vi-bindings.patch \
		rxvt-unicode-sixel.patch rxvt-unicode-truecolor.patch;do
			patch -p0 <../"$_patch"
	done
}

build(){
	cd "$_pkgname-$pkgver" || return 1

	# do not specify --with-terminfo (FS#46424)
	./configure \
		--prefix=/usr \
		--enable-everything \
		--enable-256-color \
		--enable-combining \
		--enable-fading \
		--enable-font-styles \
		--enable-iso14755 \
		--enable-keepscrolling \
		--enable-lastlog \
		--enable-mousewheel \
		--enable-next-scroll \
		--enable-perl \
		--enable-pointer-blank \
		--enable-rxvt-scroll \
		--enable-selectionscrolling \
		--enable-slipwheeling \
		--enable-smart-resize \
		--enable-startup-notification \
		--enable-transparency \
		--enable-unicode3 \
		--enable-utmp \
		--enable-wtmp \
		--enable-xft \
		--enable-xim \
		--enable-xterm-scroll \
		--enable-pixbuf \
		--enable-24-bit-color
	make
}

package() {

	# install freedesktop menu
	for _f in urxvt urxvtc urxvt-tabbed; do
		install -Dm644 "$_f.desktop" \
			"$pkgdir/usr/share/applications/$_f.desktop"
	done

	cd "$_pkgname-$pkgver" || return 1

	# workaround terminfo installation
	export TERMINFO="$srcdir/terminfo"
	install -d "$TERMINFO"
	make DESTDIR="$pkgdir" install

	# install the tabbing wrapper ( requires gtk2-perl! )
	sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
	install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
