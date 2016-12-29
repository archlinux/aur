#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=secs2d
pkgname=octave-$_pack
pkgver=0.0.8
pkgrel=4
pkgdesc="A Drift-Diffusion simulator for 2d semiconductor devices"
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL')
groups=('octave-forge')
depends=('octave>=2.9.17')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
_archive_patched=$_pack-$pkgver-patched.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive"
		"octave_map.patch")
noextract=("$_archive")
md5sums=('fd4d93f4d4ebed9ceae0d7aed88c18bf'
         'c9cfc1bcf2a7fa1f0c5c582d0f8c7445')

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
	patch -Np0 -i octave_map.patch
	tar czf "$_archive_patched" "$_pack-$pkgver"
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
