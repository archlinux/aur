#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=video
pkgname=octave-$_pack
pkgver=2.1.1
pkgrel=1
pkgdesc="A wrapper for ffmpeg's libavformat and libavcodec, implementing addframe, avifile, aviinfo and aviread."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('FreeBSD')
groups=('octave-forge')
depends=('octave>=4.4.1' 'libavcodec.so' 'libavformat.so' 'libswscale.so')
makedepends=('ffmpeg')
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://github.com/Andy1978/octave-video/releases/download/$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('6435b83e36cdb9ac50f2b64bcd721fdd42544ada6e2bac6987513b5364dc955a')

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
