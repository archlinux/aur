#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=symbolic
pkgname=octave-$_pack
pkgver=2.2.1
pkgrel=1
pkgdesc="Adds symbolic calculation features to GNU Octave. These include common Computer Algebra System tools such as algebraic operations, calculus, equation solving, Fourier and Laplace transforms, variable precision arithmetic and other features.  Interna [...]"
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('custom')
groups=('octave-forge')
depends=()
makedepends=('python-sympy>=0.7.5' 'python')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive"
	'0001-Fix-configure-print-version-for-Python-3.patch')
noextract=("$_archive")
md5sums=('42dcee03f527b61fdf74b11ea3420488'
         'f00f13fe7ea65a4be3dcabb005050c80')

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
	tar xzf "$_archive"
	(
		cd "$_pack-$pkgver"
		patch -p1 -i ../0001-Fix-configure-print-version-for-Python-3.patch
	)
	_archive_patched=$_pack-$pkgver-patched.tar.gz
	tar czf "$_archive_patched" "$_pack-$pkgver"
	octave -q -f --eval "$(cat <<-EOF
		pkg local_list octave_packages;
		pkg prefix $_prefix $_archprefix;
		pkg install -verbose -nodeps $_archive_patched;
		EOF
		)"
}

package() {
	prefix=$pkgdir/usr/share/octave/packages
	archprefix=$pkgdir/usr/lib/octave/packages
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
}
