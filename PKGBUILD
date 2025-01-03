# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils@hilbricht.net>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=audiowmark
pkgver=0.6.3
pkgrel=1
pkgdesc='Audio and video watermarking'
arch=(x86_64 aarch64)
url='https://uplex.de/audiowmark/'
license=(GPL-3.0-or-later)
depends=(bash gcc-libs glibc libgcrypt)
makedepends=(autoconf-archive ffmpeg fftw libsndfile mpg123 zita-resampler)
groups=(pro-audio)
source=("https://github.com/swesterfeld/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.zst"
        'audiowmark-configure.patch'
        'audiowmark-nostdin.patch'
        'audiowmark-tests.patch')
sha256sums=('65389bb1de1d5ea40fdf010d9ca2164394550c5b921e25944a117b8f2ddad5ab'
            'bd91d4c1cecfbb20a86cfd8005caf07d019ac1568f9f76e561f3cd8866e9cbe1'
            'e46363c767dbd96ba1b6ab91ae0e26fdf05cbebd935cc2cf545e899b368c22b9'
            '9bc336a3434edb66518785c2fe9db1de7796cc215904ea1a1f74c0c3b986ba91')

prepare() {
  cd $pkgname-$pkgver
  # https://github.com/swesterfeld/audiowmark/issues/72
  patch -p1 -N -r - -i "$srcdir"/audiowmark-configure.patch || :
  patch -p1 -N -r - -i "$srcdir"/audiowmark-nostdin.patch || :
  patch -p1 -N -r - -i "$srcdir"/audiowmark-tests.patch || :
}

build() {
  cd $pkgname-$pkgver
  autoreconf -f -i -Wno-portability
  ./configure --prefix=/usr --with-ffmpeg
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(
    libsndfile.so
    libfftw3f.so
    libmpg123.so
    libavcodec.so
    libavformat.so
    libavutil.so
    libswresample.so
    libzita-resampler.so
  )
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 README.adoc -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 NEWS -t "$pkgdir"/usr/share/licenses/$pkgname
}
