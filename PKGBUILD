# Maintainer: Parker Reed (parker.l.reed@gmail.com)

pkgname=tvtime_patched
pkgver=1.0.2
pkgrel=4
pkgdesc="tvtime is a high quality television application for use with video capture cards. Added some patches (Xinemara, save matte settings, icon bug, ...)"
depends=('libpng' 'libxml2' 'freetype2' 'libxss' 'libxinerama' 'libxv' 'libsm' 'libxxf86vm')
source=(http://pkgs.fedoraproject.org/repo/pkgs/tvtime/tvtime-1.0.2.tar.gz/4b3d03afe61be239b08b5e522cd8afed/tvtime-$pkgver.tar.gz \
		tvtime-1.0.2-linuxheaders.patch \
		tvtime-1.0.2-gcc41.patch \
		tvtime-1.0.2-libsupc++.patch \
		tvtime-pic.patch \
		tvtime-1.0.2-xinerama.patch \
		tvtime-1.0.1-savematte.patch \
		tvtime-1.0.2-fullscreen-crash-fix.patch \
		tvtime-1.0.2-compiler-check.patch \
		tvtime-1.0.2-locale_t-fix.patch \
		tvtime-setpid.patch \
		tvtime-1.0.2-xscreensaver-fix.patch)
url='http://tvtime.sourceforge.net/'
provides=('tvtime')
conflicts=('tvtime')
arch=('i686' 'x86_64')
license=('GPL')
build() {
		cd $startdir/src/tvtime-$pkgver
		# Add patch to build with linux-headers-2.6.18 and later. Closes bug #159510
		patch -Np1 -i ${startdir}/tvtime-1.0.2-linuxheaders.patch
		# Fix for gcc 4.1.
		patch -Np1 -i ${startdir}/tvtime-1.0.2-gcc41.patch
		# Link to -lsupc++ rather than -lstdc++, this way the dependency over
		# libstdc++.so is dropped.
		patch -Np1 -i ${startdir}/tvtime-1.0.2-libsupc++.patch
		# Fix PIC handling on AMD64 systems when PIE is enabled.
		patch -Np1 -i ${startdir}/tvtime-pic.patch
		# Xinerama support.
		patch -Np1 -i ${startdir}/tvtime-1.0.2-xinerama.patch
		# With this patch tvtime saves the matte settings
		patch -Np1 -i ${startdir}/tvtime-1.0.1-savematte.patch
		# Fix a crash when switching to fullscreen
		patch -Np1 -i ${startdir}/tvtime-1.0.2-fullscreen-crash-fix.patch
		# Don't generate key events every 30 seconds (patch from
		# http://sourceforge.net/tracker/?func=detail&aid=2683274&group_id=64301&atid=506989)
		patch -Np1 -i ${startdir}/tvtime-1.0.2-xscreensaver-fix.patch
		# Don't explicitly check for CC and CXX, necessary build time deps are handled by pacman,
		# the original checks for CC break with e.g. CC="ccache gcc"
		patch -Np1 -i ${startdir}/tvtime-1.0.2-compiler-check.patch
		# Fix a redefinition of 'locale_t'
		patch -Np1 -i ${startdir}/tvtime-1.0.2-locale_t-fix.patch
		# set the pid for tvtime
		patch -Np1 -i ${startdir}/tvtime-setpid.patch
		# use 'tvtime' for the application icon see bug #66293
		sed -i -e "s/tvtime.png/tvtime/" docs/net-tvtime.desktop
        sed -i '1,1i#include <zlib.h>' src/pngoutput.c
		autoreconf -i
		./configure --prefix=/usr --mandir=/usr/share/man --localstatedir=/var --sysconfdir=/etc || return 1
		make || return 1
}

package() {
		cd $startdir/src/tvtime-$pkgver
		make DESTDIR="$pkgdir" install
		install -D -m644 docs/html/default.tvtime.xml $pkgdir/usr/share/tvtime/default.tvtime.xml || return 1
}
md5sums=('4b3d03afe61be239b08b5e522cd8afed'
         '1eb71dcde8371489162792ca14413e25'
         'c782789825dfa664e1f6fcc96ac7246c'
         'aa048fd12dfb176e544247148a53bfc7'
         '4bc08a98c7cc134accb89aea3018c2f6'
         '7716009f7064bdae850d1464e33f455d'
         'faa5a71384f339e871bab9feaebdac2a'
         'bc7995998857daf88d0fb75161abe9bd'
         '8844ceef4e2002807cb53c2510a37d9a'
         'dd3e388d0dacbe9d05c0a49ce9be147e'
         'f42cb93c11644229f9b77f26a4362c6d'
         'aed658a5da85bee9c107f339655c3209')
