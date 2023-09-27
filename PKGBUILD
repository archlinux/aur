#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=ltfat
pkgname=octave-$_pack
pkgver=2.6.0
pkgrel=1
pkgdesc="Octave toolbox for working with time-frequency analysis and synthesis."
arch=(any)
url="https://github.com/ltfat/ltfat"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.8.0')
makedepends=('fftw' 'lapack' 'blas' 'portaudio')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver-of.tar.gz
source=("https://github.com/ltfat/ltfat/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('14c0d9f171612c6eca0e8523b57bda7de920ead4a5b7005a3b4fbffe3333263e')

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
