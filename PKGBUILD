#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=audio
pkgname=octave-$_pack
pkgver=2.0.11
pkgrel=1
pkgdesc="Audio recording, processing and playing tools."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('GPL-3.0-or-later')
groups=('octave-forge')
depends=('octave>=4.0.0' 'rtmidi')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://github.com/gnu-octave/$pkgname/releases/download/release-$pkgver/$_archive")
noextract=("$_archive")
b2sums=('c477cb13d0f6ba09e68e28e930ce272f9503034093385a0ea30f6e40b15c793173ac534b0d1e54fb792ff8c38732cfbea037fa0b85bb99c34ff0191c796300f5')

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
		pkg install -verbose -nodeps -noauto $_archive;
		EOF
		)"
}

package() {
	prefix=$pkgdir/usr/share/octave/packages
	archprefix=$pkgdir/usr/lib/octave/packages
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
}
