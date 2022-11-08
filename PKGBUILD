#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=geometry
pkgname=octave-$_pack
pkgver=4.0.0
pkgrel=3
pkgdesc="Library for geometric computing extending MatGeom functions. Useful to create, transform, manipulate and display geometric primitives."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('custom')
groups=('octave-forge')
depends=('octave>=4.2.0' 'octave-matgeom>=1.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://downloads.sourceforge.net/octave/$_archive"
        "4.0.0_to_tip.diff")
#noextract=("$_archive")
sha256sums=('1ad2403c01948ebac55d67f9048f79ae28bb99802ef65376c94e981cfb49adfe'
            '753a384acac9f7a38c86682ca67d80a714e79cd694e7a2beba5a4606aca70e4c')

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
    patch -Np0 -i 4.0.0_to_tip.diff
    tar cf $_pack-tip.tar.gz $_pack-$pkgver
}

build() {
	_prefix="$srcdir"/install_prefix
	_archprefix="$srcdir"/install_archprefix
	mkdir -p "$_prefix" "$_archprefix"
	cd "$srcdir"
	_octave_run "$(cat <<-EOF
		pkg local_list octave_packages;
		pkg prefix $_prefix $_archprefix;
		pkg install -verbose -nodeps $_pack-tip.tar.gz;
		EOF
		)"
}

package() {
	prefix=$pkgdir/usr/share/octave/packages
	archprefix=$pkgdir/usr/lib/octave/packages
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
}
