#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#Maintainer: Giuseppe Borzi <gborzi@gmail.com>

_pack=femoctave
pkgname=octave-$_pack
pkgver=2.1.8
pkgrel=1
pkgdesc="A simple FEM package for solving scalar problems in one or two space dimensions"
arch=('x86_64')
url="https://github.com/andreasstahel/femoctave"
license=('GPL-3.0-or-later')
groups=('octave-forge')
depends=('octave>=4.2.0')
optdepends=('triangle<=1.6')
install=$pkgname.install
_archive=v.$pkgver.tar.gz
source=("https://github.com/AndreasStahel/FEMoctave/archive/refs/tags/$_archive")
noextract=("$_archive")
sha256sums=('890346b7c389f9f91c1d9ab3efddab00312cd9621deaf6e7f60d790dbd605bf6')

_octave_run() {
	octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
	src=$1
	dst=$2
	mkdir -p "$(dirname "$dst")"
	cp -rT "$src" "$dst"
}

build() {
	_prefix="$srcdir"/install_prefix
	_archprefix="$srcdir"/install_archprefix
	mkdir -p "$_prefix" "$_archprefix"
	cd "$srcdir"
	_octave_run "$(cat <<-EOF
		pkg local_list octave_packages;
		pkg prefix $_prefix $_archprefix;
		pkg install -verbose -nodeps $_archive;
		EOF
		)"
}

package() {
	prefix=$pkgdir/usr/share/octave/packages
	archprefix=$pkgdir/usr/lib/octave/packages
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
}
