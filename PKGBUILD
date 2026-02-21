#
# Maintainer: Stanislav Timoshko <s4kkkk@mail.ru>
#
# A temporary patch package that fixes bugs caused by incompatibilities 
# with the current ffmpeg version in arch repos. It will be deleted after 
# upstream fixes this bug.
#
# Original package URL: https://aur.archlinux.org/packages/octave-video
#

_pack=video
pkgname=octave-$_pack-tmp-patched
pkgver=2.1.3
pkgrel=1
pkgdesc="A wrapper for ffmpeg's libavformat and libavcodec, implementing addframe, avifile, aviinfo and aviread."
arch=(any)
url="https://gnu-octave.github.io/packages/$_pack/"
license=('GPL-3.0-or-later AND BSD-3-Clause')
groups=('octave-forge')
depends=('octave>=4.4.1' 'libavcodec.so' 'libavformat.so' 'libswscale.so')
makedepends=('ffmpeg')
optdepends=()
provides=('octave-video')
conflicts=('octave-video')
replaces=('octave-video')
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("https://github.com/Andy1978/octave-video/releases/download/$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('7c6e25251929f11c96ba1f66efbca735c45468b7804e5652575d4894cb2833c2')

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
    tar -xvf $_archive
    rm $_archive

    cp "$startdir/new_ffmpeg_version_fix.patch" "$srcdir/$_pack-$pkgver/"
    cd $_pack-$pkgver
    patch -p0 < "new_ffmpeg_version_fix.patch"
    cd "$srcdir"
    tar -cvzf $_archive $_pack-$pkgver
    rm -rf $srcdir/$_pack-$pkgver

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
