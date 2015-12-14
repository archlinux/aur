#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=octcdf
pkgname=octave-$_pack
pkgver=1.1.8
pkgrel=4
pkgdesc="A NetCDF interface for octave. This interface is depreciated. Please use the netcdf package instead (possibly in combination with ncarray)."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL')
groups=('octave-forge')
depends=('octave>=3.4.0')
makedepends=('netcdf')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
md5sums=('981f0937cdf45415f966ea1886ba8136')

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
