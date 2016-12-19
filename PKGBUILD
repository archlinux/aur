#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=fl-core
pkgname=octave-$_pack
pkgver=1.0.0
pkgrel=4
pkgdesc="The package contains code for basic functions in Fuzzy Logic for Octave."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=2.9.7')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
_archive_patched=$_pack-$pkgver-patched.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive"
		"fl_compose.patch")
noextract=("$_archive")
md5sums=('930dd490d1d306e361a8529cb4c8ce54'
         'ccc0b8e4e4d694ab4f6128e92eb67c33')

_octave_run() {
	octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
	src=$1
	dst=$2
	mkdir -p "$(dirname "$dst")"
	cp -rT "$src" "$dst"
}

prepare() {
	cd "$srcdir"
	tar xzf "$_archive"
	patch -Np0 -i fl_compose.patch
	tar czf "$_archive_patched" "$_pack"
}

build() {
	_prefix="$srcdir"/install_prefix
	_archprefix="$srcdir"/install_archprefix
	mkdir -p "$_prefix" "$_archprefix"
	cd "$srcdir"
	_octave_run "$(cat <<-EOF
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
