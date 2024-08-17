# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: nemanjan00 <nemanjan00@gmail.com>

pkgname=dsd-fme-git
_pkgname=dsd-fme
pkgver=2024.r262.gf6fc91a
pkgrel=1
pkgdesc="Digital Speech Decoder - Florida Man Edition"
arch=('i686' 'x86_64' 'aarch64')
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
makedepends=('cmake' 'git')
provides=('dsd-fme')
conflicts=('dsd-fme')
source=("$pkgname::git+https://github.com/lwvmobile/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cmake -B build -S "$srcdir/$pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install

    cd "$srcdir/$pkgname"

    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
