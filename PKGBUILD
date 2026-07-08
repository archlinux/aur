#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=netcdf
pkgname=octave-$_pack
pkgver=1.0.20
pkgrel=1
pkgdesc="A MATLAB compatible NetCDF interface for Octave"
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('GPL-3.0-or-later')
groups=('octave-forge')
depends=('octave>=4.0.0')
makedepends=('netcdf')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://github.com/gnu-octave/octave-$_pack/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
b2sums=('f7638496995e22432860a131ca4caefdaa601fbbea6603a31896e61abd00d1305825b1841538865a8bed13f0f8fcf496520b9ad47239882b03946bd7da00418e')

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
