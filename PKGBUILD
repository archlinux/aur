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
pkgver=0.2.6
pkgrel=1
pkgdesc="Functions to capture images from connected devices using Video4Linux (v4l)."
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=(GPL-3.0-or-later)
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
sha512sums=('9cca06ae7aa874bb042f6897856302ac967b18ba06f2c68f3cec940f0a588765c880297723992d87ce991195f9594b31ff1e1bc8717f3d28abe462f2d0b5a75f')

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
