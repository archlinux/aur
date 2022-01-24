#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#


_pack=informationtheory
pkgname=octave-${_pack}
pkgver=0.1.8
pkgrel=3
pkgdesc="Functions and routines for basic Information Theory definitions, and source coding"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('GPL')
groups=('octave-forge')
depends=('octave>=2.9.7')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('14878e3e3f6c5b3ef43e2e7addd09bfc48ab6e4fc022b80448851c3f714fe0086144b740a08b0c445e9a3df65256ce8983d39cdd79f371339f419fc893a3ae69')

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
