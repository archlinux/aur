#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=parallel
pkgname=octave-$_pack
pkgver=3.1.3
pkgrel=2
pkgdesc="Parallel execution package. See also package mpi, maintained by Carlo de Falco. "
arch=(any)
url="https://octave.sourceforge.io/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=4.0.0' 'octave-struct>=1.0.12')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver-patched.tar.gz
source=(#"https://downloads.sourceforge.net/octave/$_archive"
        "$_archive::https://savannah.gnu.org/bugs/download.php?file_id=47160")
noextract=("$_archive")
sha256sums=('eb18d299ef1ca6fca06a7638d3a6cfe1e38f9cf1e730fef31a25370ec09026cc')

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
