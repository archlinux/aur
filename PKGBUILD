#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=image-acquisition
pkgname=octave-${_pack}
pkgver=0.2.2
pkgrel=4
pkgdesc="The Octave-forge Image Aquisition package provides functions to capture images from connected devices. Currently only v4l2 is supported"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.8.0')
makedepends=('v4l-utils>=0.8.8' 'fltk>=1.1.0')
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("$_archive")
sha512sums=('2b17c7cfbfae079469465b3b4d4284062d4f440805a25515b5340acd53cf7654a88e660d01239c596ccfcff424692e3108416f9ea6804130fc20fd7fccea09c5')

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
	_octave_run "$(
		cat <<-EOF
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
