#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=geometry
pkgname=octave-$_pack
pkgver=4.0.0
pkgrel=2
pkgdesc="Library for geometric computing extending MatGeom functions. Useful to create, transform, manipulate and display geometric primitives."
arch=(any)
url="https://octave.sourceforge.io/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=4.2.0' 'octave-matgeom>=1.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.zip
source=("${_archive}::https://sourceforge.net/code-snapshots/hg/o/oc/octave/geometry/octave-geometry-04965cda30b5f9e51774194c67879e7336df1710.zip")
noextract=("$_archive")
sha256sums=('0819f5420da98b48a8d4d61c4ab0408b26237d4da7fd77b306053e544d4c9bf9')

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
