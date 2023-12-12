# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: nemanjan00 <nemanjan00@gmail.com>

pkgname=dsd-fme
pkgver=20230915
pkgrel=1
pkgdesc="Digital Speech Decoder - Florida Man Edition"
arch=('i686' 'x86_64')
url="https://github.com/lwvmobile/dsd-fme.git"
license=('custom:copyright')
install="$pkgname.install"
depends=(
    'libpulse'
    'ncurses'
    'rtl-sdr'
    'fftw'
    'codec2'
    'libsndfile'
    'itpp'
    'mbelib'
    'glibc'
    'gcc-libs'
    'libogg'
    'libvorbis'
    'flac'
    'lapack'
    'opus'
    'mpg123'
    'lame'
    'blas'
    'libusb'
    'dbus'
    'libxcb'
    'systemd-libs'
    'libasyncns'
    'libxau'
    'libxdmcp'
    'libcap'
    'lz4'
    'xz'
    'zstd'
    'libgpg-error'
)
optdepends=('pulseaudio: use pulse as audio input device')
makedepends=('cmake' 'patch')
provides=('dsd')
conflicts=('dsd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lwvmobile/$pkgname/archive/refs/tags/$pkgver.tar.gz" change_tonewav_dir.patch)
sha256sums=('4092fb0e6e6b240e035993447a73c8b1a862269004eb9f1d14d41184bedc53e2' '27ee31d00d2a474e252251828c4dc53b958dbdab34de218bfb4b638b0373b001')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < $srcdir/change_tonewav_dir.patch
}

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install

    cd "$srcdir/$pkgname-$pkgver"

    for file in *.wav; do
        install -Dm644 $file "$pkgdir/usr/share//$pkgname/$file"
    done

    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
