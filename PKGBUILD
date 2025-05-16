# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils@hilbricht.net>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=audiowmark
pkgver=0.6.5
pkgrel=1
pkgdesc='Audio and video watermarking'
arch=(x86_64 aarch64)
url='https://uplex.de/audiowmark/'
license=(GPL-3.0-or-later)
depends=(bash gcc-libs glibc libgcrypt)
makedepends=(autoconf-archive ffmpeg fftw libsndfile mpg123 zita-resampler)
groups=(pro-audio)
source=("https://github.com/swesterfeld/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.zst")
sha256sums=('12dd0232e47f29521c91d9d642183b3ca4145be61d353c4dc6d1c6cd7c388a4b')

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
