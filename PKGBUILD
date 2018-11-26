# Maintainer: Spencer Harmon <spencer dot harmon at higher-state dot com>

pkgname="ulam-git"
pkgver=3.0.12.r130.g0f2c4869
pkgrel=4
epoch=
pkgdesc="Github version of ulam compiler and MFM simulator"
arch=('any')
url="https://github.com/elenasa/ULAM/wiki"
license=('(L)GPL3')
groups=()
depends=('make'
	'gcc'
	'gcc6'
	'binutils'
	'perl'
	'sdl'
	'sdl_image'
	'sdl_ttf'
	'perl-crypt-openssl-rsa'
	'perl-capture-tiny')
makedepends=('git')
optdepends=('perl-splat-git: Support for the SPLAT programming language')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags')
install=
changelog=
source=("git://github.com/daveackley/MFM"
        "git://github.com/daveackley/ULAM")
noextract=()
md5sums=('SKIP' 'SKIP')
pkgver(){
	cd $srcdir/ULAM
	git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
#	use gcc6 for compilation; note that this does not affect compilation of ulam libraries (still uses gcc)
	perl -0777 -i -pe 's/(NATIVE_GCC:=).+/$1gcc-6/' MFM/config/Makevars.mk
	perl -0777 -i -pe 's/(NATIVE_GPP:=).+/$1g++-6/' MFM/config/Makevars.mk

#	ensure build directory is correct
	perl -0777 -i -pe 's/ifndef BUILDDIR\n\s(.+\n)endif\n/$1/' MFM/config/Makecommon.mk

#	ensure path is correct in ulam.tmpl (note that latter ENV{PATH} uses bash expansion)
#	this is effectively a workaround for perlsec, so proceed with caution
	perl -0777 -i -pe 's/(delete.+\n)/$1\$ENV{PATH} = "$ENV{PATH}";\n/' ULAM/src/drivers/ulam/ulam.tmpl

#	change non-portable uname flag from -i to -m
	perl -0777 -i -pe 's/(uname -)i/$1m/' MFM/src/drivers/mfzrun/mfzrun.tmpl

	make -C MFM
	make -C ULAM

	perl ULAM/share/perl/extractDistro.pl bin . "$srcdir/ulam" ulam
	perl ULAM/share/perl/extractDistro.pl src . "$srcdir/ulam" ulam
}

build() {
	make -C ulam
}

package() {
	make -C "$srcdir/ulam" DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/bin"
	for f in `ls "$pkgdir/usr/lib/ulam/ULAM/bin"`; \
		do ln -sf "/usr/lib/ulam/ULAM/bin/$f" "$pkgdir/usr/bin/";done
	for f in `ls "$pkgdir/usr/lib/ulam/MFM/bin"`; \
		do ln -sf "/usr/lib/ulam/MFM/bin/$f" "$pkgdir/usr/bin/";done
}
