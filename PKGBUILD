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
url="https://octave.sourceforge.net/$_pack/"
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
source=("https://downloads.sourceforge.net/octave/$_archive"
		"fl_compose.patch")
noextract=("$_archive")
sha256sums=('5ec025ecdc05aede186fad48c28fe8053888e6571ba557a22173649f7c0c0a1d'
            'c957966877e08b5c7e21a57c57b713f8c30ddc65227b5ac1f3347ce835b11a97')

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
