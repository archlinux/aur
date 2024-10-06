#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=netcdf
pkgname=octave-$_pack
pkgver=1.0.18
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
source=("https://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
b2sums=('29e10174de76a3daafd1162c684924952f723d197e11b1005ee4cb832767dc2fa01f3108f94b8fe2c6484cdd80810b9febba21bac91f1ec388b5c3c77d885ec8')

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
