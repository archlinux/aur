# Submitter: Dknight
# Contributor: Maksim Sipos <msipos@mailc.net>
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=statistics
pkgname=octave-$_pack
pkgver=1.5.3
pkgrel=1
pkgdesc="Additional statistics functions for Octave."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=6.1.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("$_pack-$pkgver.tar.gz::https://github.com/gnu-octave/statistics/archive/refs/tags/release-$pkgver.tar.gz")
noextract=("$_archive")
sha256sums=('f0081d7872ea2eaeafef00a162c78e03e62eb16e98063bc45f8454e4e949c61b')

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
