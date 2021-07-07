# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgbase=pjproject-git
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=2.11.r43.g8ef2a3c
pkgrel=1
pkgdesc='Open source SIP stack and media stack'
arch=(x86_64 aarch64 armv7h i686)
url='https://www.pjsip.org/'
license=(GPL)
_pkgdepends=(alsa-lib
             ffmpeg
             libsamplerate
             libsrtp
             openssl
             opus
             portaudio
             speex
             util-linux)
_libdepends=(python
             python-setuptools)
makedepends=("${_pkgdepends[@]}"
             "${_libdepends[@]}"
             e2fsprogs
             git
             swig)
source=("$pkgbase::git+https://github.com/pjsip/${pkgbase/-/.}"
        '0001-Don-t-build-Java-bindings.patch'
        'config_site.h')
sha256sums=('SKIP'
            'c6673d97185c2383140b6d915aeaa7e525c9cfb5f51c097472cf4773b4f87ab4'
            '61fa2a76d069aa5c95b6e2c539f7b20e2ccf0b126fc60c18117762541d0a7472')

pkgver() {
	cd "$pkgbase"
	git describe --tags --always --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    patch -Np1 < "../${source[1]}"
    install -Dm644 -t "pjlib/include/pj/" "../${source[2]}"
}

build() {
    cd "$pkgbase"
    export CXXFLAGS="$CXXFLAGS -fPIC"
    if [ "$CARCH" = 'aarch64' ]; then
        arch_opts=(--disable-libwebrtc)
    fi
    if [ "$CARCH" = "i686" ]; then
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
        --enable-shared \
        --disable-opencore-amr \
        "${arch_opts[@]}"
    make -j1 dep
    make -j1
    make -j1 -C pjsip-apps/src/swig
	pushd 'pjsip-apps/src/swig/python'
    python setup.py build
}

package_pjproject-git() {
	depends=("${_pkgdepends[@]}")
	optdepends=(e2fsprogs 'python-pjproject: Python bindings')
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	cd "$pkgbase"
	make -j1 DESTDIR="$pkgdir" install
	install -Dm755 pjsip-apps/bin/pjsua-*gnu* "$pkgdir/usr/bin/pjsua"
}

package_python-pjproject-git() {
	depends=("${_libdepends[@]}")
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	pushd "$pkgbase/pjsip-apps/src/swig/python"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
