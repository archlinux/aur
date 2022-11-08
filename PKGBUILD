#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=mapping
pkgname=octave-${_pack}
pkgver=1.4.2
pkgrel=1
pkgdesc="Simple mapping and GIS .shp .dxf and raster file functions"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=5.2.0' 'octave-io>=2.2.7' 'octave-geometry>=4.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('1f44e65f2034708a09a249d86f97eb841c6aba85ebfdd0dee9821c41e18cf9eb7ff7ac817f36863c1c37f3067931dd42d5bae7e521bd5ea1aba61a64079693ec')

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
