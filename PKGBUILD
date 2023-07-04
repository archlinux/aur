#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=sparsersb
pkgname=octave-$_pack
pkgver=1.0.9
pkgrel=2
pkgdesc="Interface to the librsb package implementing the RSB sparse matrix format."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=4.4.0' 'librsb>=1.2.0.9')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
sha256sums=('b98bffc26fc031988106a24e05122d8ca7b6203fe960ac68112f93f0699fdcff')

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
    # fix build error with new version of octave
    tar xf $_archive
	cd "$srcdir/$_pack-$pkgver"
    sed -i "s|mex_get_ir|ridx|g" "src/sparsersb.cc"
    sed -i "s|mex_get_jc|cidx|g" "src/sparsersb.cc"
    cd "$srcdir"
    rm $_archive
    tar cf $_archive "$_pack-$pkgver"
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
