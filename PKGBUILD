#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=ltfat
pkgname=octave-$_pack
pkgver=2.4.0
pkgrel=1
pkgdesc="The Large Time/Frequency Analysis Toolbox (LTFAT) is a Matlab/Octave toolbox for working with time-frequency analysis, wavelets and signal processing. It is intended both as an educational and a computational tool. The toolbox provides a large numbe [...]"
arch=(any)
url="https://octave.sourceforge.io/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.8.0')
makedepends=('fftw' 'lapack' 'blas' 'portaudio')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver-of.tar.gz
source=("https://github.com/ltfat/ltfat/releases/download/$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('fe37b31bc2dae97d1b5e1389d856cc354f21dcd77f5df67c2a025fdae8c8d5fe')

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
