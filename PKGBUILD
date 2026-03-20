#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=instrument-control
pkgname=octave-$_pack
pkgver=0.10.0
pkgrel=1
pkgdesc="Low level I/O functions for serial, i2c, parallel, tcp, gpib, vxi11 and usbtmc interfaces."
arch=('x86_64')
url="https://gnu-octave.github.io/packages/$_pack/"
license=('GPL-3.0-or-later')
groups=('octave-forge')
depends=('octave>=4.0.0')
makedepends=('rpcsvc-proto')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://github.com/gnu-octave/$_pack/releases/download/release-$pkgver/$_archive")
sha256sums=('04715ef60e9f0cad86a82ebe7a623d198a6d2071c0e67d9d921935b1d1f9e854')
noextract=("$_archive")

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
