#
# Contributor: Philipp Brüschweiler <blei42 gmail com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=image
pkgname=octave-$_pack
pkgver=2.2.2
pkgrel=2
pkgdesc="The Octave-forge Image package provides functions for processing images. The package also provides functions for feature extraction, image statistics, spatial and geometric transformations, morphological operations, linear filtering, and much more."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=3.8.0' 'octave-signal>=1.2.0' 'octave-general>=1.3.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
md5sums=('c02a05ba37ffb38ad2b59906a56c7807')

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
	octave -q -f --eval "$(cat <<-EOF
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
