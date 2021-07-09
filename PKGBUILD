# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn

pkgname=musikcube-git
pkgver=0.96.7.r5.g00cf3eb5
pkgrel=1
pkgdesc="a terminal-based cross-platform music player, audio engine, metadata indexer, and server"
arch=('x86_64')
url="https://github.com/clangen/musikcube"
license=('BSD')
depends=('faad2' 'ffmpeg' 'libev' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame'
         'ncurses' 'boost' 'pulseaudio' 'libpulse' 'alsa-lib' 'curl')
makedepends=('cmake' 'git')
provides=('musikcube')
conflicts=('musikcube')
source=('musikcube::git+https://github.com/clangen/musikcube.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -B build -S "${PWD}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make -C build DESTDIR="$pkgdir/" install

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
