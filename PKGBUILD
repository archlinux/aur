#
# Maintainer: Jonathan Liu <net147@gmail.com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=communications
pkgname=octave-$_pack
pkgver=1.2.1
pkgrel=4
pkgdesc="Digital Communications, Error Correcting Codes (Channel Code), Source Code functions, Modulation and Galois Fields"
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.4.0' 'octave-signal>=1.1.3')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive"
        'http://hg.octave.org/mxe-octave/raw-file/tip/src/of-communications-1-fixes.patch'
        'http://hg.octave.org/mxe-octave/raw-file/tip/src/of-communications-2-fixes.patch'
        'http://hg.octave.org/mxe-octave/raw-file/tip/src/of-communications-3-fixes.patch'
        'http://hg.octave.org/mxe-octave/raw-file/tip/src/of-communications-4-fixes.patch'
        'http://hg.octave.org/mxe-octave/raw-file/tip/src/of-communications-5-fixes.patch')
noextract=("$_archive")
md5sums=('cf5ad84af0c3221199b2e04109946562'
         '9b5fc56e7813708587b81af4343101dc'
         '0564ab7dd18107742a2687fda9d89e0c'
         '2fddcf6c224975303d9d34a3fafc959a'
         '73cd30da0010cb95b8f2ff85f800a484'
         'ffb814207a092811ec033670681478a7')

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
    rm -fr "$_pack-$pkgver"
    tar -xf "$_archive"
    cd "$_pack-$pkgver"
    patch -Np1 -i "$srcdir/of-communications-1-fixes.patch"
    patch -Np1 -i "$srcdir/of-communications-2-fixes.patch"
    patch -Np1 -i "$srcdir/of-communications-3-fixes.patch"
    patch -Np1 -i "$srcdir/of-communications-4-fixes.patch"
    patch -Np1 -i "$srcdir/of-communications-5-fixes.patch"
    cd ..
    tar -cf "patched.tar" "$_pack-$pkgver"
}

build() {
	_prefix="$srcdir"/install_prefix
	_archprefix="$srcdir"/install_archprefix
	mkdir -p "$_prefix" "$_archprefix"
	cd "$srcdir"
	_octave_run "$(cat <<-EOF
		pkg local_list octave_packages;
		pkg prefix $_prefix $_archprefix;
		pkg install -verbose -nodeps patched.tar;
		EOF
		)"
}

package() {
	prefix=$pkgdir/usr/share/octave/packages
	archprefix=$pkgdir/usr/lib/octave/packages
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
}
