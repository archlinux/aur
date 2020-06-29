# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andrea Pierangeli <andrea.pierangeli@gmail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgbase=pjproject
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=2.10
pkgrel=1
pkgdesc='Open source SIP stack and media stack'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://www.pjsip.org/'
license=('GPL')
makedepends=('alsa-lib' 'e2fsprogs' 'ffmpeg' 'libsamplerate' 'libsrtp'
             'openssl' 'opus' 'portaudio' 'speex' 'swig' 'util-linux'
             'python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pjsip/$pkgbase/archive/$pkgver.tar.gz"
        '0001-Don-t-build-Java-bindings.patch'
        'config_site.h')
sha256sums=('936a4c5b98601b52325463a397ddf11ab4106c6a7b04f8dc7cdd377efbb597de'
            'c6673d97185c2383140b6d915aeaa7e525c9cfb5f51c097472cf4773b4f87ab4'
            '61fa2a76d069aa5c95b6e2c539f7b20e2ccf0b126fc60c18117762541d0a7472')

prepare() {
  cd "$pkgbase-$pkgver"
  patch -Np1 < "../${source[1]}"
  cp "../${source[2]}" 'pjlib/include/pj/config_site.h'
}

build() {
  cd "$pkgbase-$pkgver"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  if [ "$CARCH" = "aarch64" ]; then
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

  cd 'pjsip-apps/src/swig/python'
  python setup.py build
}

package_pjproject() {
  depends=('openssl' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux'
           'ffmpeg' 'libsrtp' 'opus')
  optdepends=('e2fsprogs' 'python-pjproject: Python bindings')
  cd "$pkgbase-$pkgver"
  make -j1 DESTDIR="$pkgdir" install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu* "$pkgdir/usr/bin/pjsua"
}

package_python-pjproject() {
  depends=('pjproject' 'python')
  cd "$pkgbase-$pkgver/pjsip-apps/src/swig/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
