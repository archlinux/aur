#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=stk
pkgname=octave-$_pack
pkgver=2.8.1
pkgrel=1
pkgdesc=" The STK is a (not so) Small Toolbox for Kriging. Its primary focus is on the interpolation/regression technique known as kriging, which is very closely related to Splines and Radial Basis Functions, and can be interpreted as a non-parametric Bayesi [...]"
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=4.0.1')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver-octpkg.tar.gz
source=("https://github.com/stk-kriging/stk/releases/download/$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('c138ccf4b51c0bc0448f74cdc40cfcefb2ea26fba8c5652c7bd3c86685869c85')

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
