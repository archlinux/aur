# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andrea Pierangeli <andrea.pierangeli@gmail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgbase=pjproject
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=2.13
pkgrel=1
pkgdesc='Open source SIP stack and media stack'
arch=(x86_64 aarch64 armv7h i686)
url='https://www.pjsip.org/'
license=(GPL)
_pkgdepends=(alsa-lib
             ffmpeg
             libsamplerate
             libsrtp
             libyuv
             openssl
             opus
             portaudio
             speex
             util-linux)
_libdepends=(python)
makedepends=("${_pkgdepends[@]}"
             "${_libdepends[@]}"
             e2fsprogs
             python-{build,installer}
             python-setuptools
             python-wheel
             swig)
_archive="$pkgbase-$pkgver"
_repourl="https://github.com/pjsip/$pkgbase"
source=("$_archive.tar.gz::$_repourl/archive/$pkgver.tar.gz"
        0001-Don-t-build-Java-bindings.patch
        config_site.h)
sha256sums=('4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9'
            'c6673d97185c2383140b6d915aeaa7e525c9cfb5f51c097472cf4773b4f87ab4'
            '61fa2a76d069aa5c95b6e2c539f7b20e2ccf0b126fc60c18117762541d0a7472')

prepare() {
	cd "$_archive"
	patch -Np1 < "../${source[1]}"
	install -Dm644 -t "pjlib/include/pj/" "../${source[2]}"
}

build() {
	cd "$_archive"
	export CXXFLAGS="$CXXFLAGS -fPIC"
	if [ "$CARCH" = 'aarch64' ]; then
		arch_opts=(--disable-libwebrtc)
	fi
	if [ "$CARCH" = 'i686' ]; then
		export CXXFLAGS="$CXXFLAGS -march=i686"
		arch_opts=(--disable-libwebrtc)
	fi
	export CFLAGS="$CFLAGS -fPIC -DNDEBUG"
	./configure \
		--prefix=/usr \
		--with-external-speex \
		--with-external-srtp \
		--with-external-pa \
		--with-external-gsm \
		--with-external-yuv \
		--enable-shared \
		--disable-opencore-amr \
		"${arch_opts[@]}"
	make dep
	make
	make -C pjsip-apps/src/swig
	pushd 'pjsip-apps/src/swig/python'
	python -m build -wn
}

package_pjproject() {
	depends=("${_pkgdepends[@]}")
	optdepends=(e2fsprogs "python-$pkgbase: Python bindings")
	cd "$_archive"
	make -j1 DESTDIR="$pkgdir" install
	install -Dm755 pjsip-apps/bin/pjsua-*gnu* "$pkgdir/usr/bin/pjsua"
}

package_python-pjproject() {
	depends=("$pkgbase" "${_libdepends[@]}")
	pushd "$_archive/pjsip-apps/src/swig/python"
	python -m installer -d "$pkgdir" dist/*.whl
}
