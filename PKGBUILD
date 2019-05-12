# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgbase=pjproject
pkgname=(pjproject python-pjproject)
pkgver=2.8
pkgrel=4
pkgdesc='Open source SIP stack and media stack'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.pjsip.org/'
license=('GPL')
makedepends=('alsa-lib' 'e2fsprogs' 'ffmpeg' 'libsamplerate' 'libsrtp' 'openssl' 'opus' 'portaudio' 'python' 'speex' 'swig' 'util-linux')
source=("http://www.pjsip.org/release/$pkgver/$pkgname-$pkgver.tar.bz2"
        0001-Don-t-build-Java-bindings.patch
        0002-Query-python-executable-for-actual-version-in-use.patch)
sha256sums=('503d0bd7f9f13dc1492ac9b71b761b1089851fbb608b9a13996edc3c42006f79'
            '74bdd3f404bf27dc00c235caada2d9c4b0b43e44febc8905b507c815384cf8fb'
            'caa187ae9b75964bbf1a79996b6e89321ff83bc910fd5bbdac33924a2bdb0cfb')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -Np1 < "$srcdir/0001-Don-t-build-Java-bindings.patch"
  patch -Np1 < "$srcdir/0002-Query-python-executable-for-actual-version-in-use.patch"
  echo "#define PJ_HAS_IPV6 1" >> "pjlib/include/pj/config_site.h"
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  export CXXFLAGS="$CXXFLAGS -fPIC"
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
    --disable-oss \
    --enable-shared \
    --disable-opencore-amr \
    --disable-v4l2 \
    --disable-video \
    --disable-sound \
    "${arch_opts[@]}"

  echo "#define PJ_HAS_IPV6 1" >> "$srcdir/$pkgname-$pkgver/pjlib/include/pj/config_site.h"
  make -j1 dep
  make -j1

  make -C pjsip-apps/src/swig -j1
}

package_pjproject() {
  depends=('openssl' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux' 'ffmpeg' 'libsrtp' 'opus')
  optdepends=('e2fsprogs' 'python-pjproject: Python bindings')
  cd "$srcdir/$pkgbase-$pkgver"
  make -j1 DESTDIR="$pkgdir" install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu* "$pkgdir"/usr/bin/pjsua
}

package_python-pjproject() {
  depends=('pjproject' 'python')
  cd "$srcdir/$pkgbase-$pkgver/pjsip-apps/src/swig/python"

  python setup.py install --root="$pkgdir/" --optimize=1
}
