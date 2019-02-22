# Maintainer: goetzc
# Maintainer: Kim Scarborough <sluggo@unknown.nu>
pkgname=cantata-git
pkgver=2.3.3.r35.g4c1b8fd49
pkgrel=1
pkgdesc="Qt5 graphical client for Music Player Daemon (MPD) - git version."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/cdrummond/cantata"
license=(GPL3)
depends=(qt5-svg qt5-multimedia libmtp libmusicbrainz5 mpg123 taglib-extras media-player-info libcdio-paranoia udisks2)
optdepends=('perl-uri: dynamic playlist'
            'mpd: playback'
            'ffmpeg: ReplayGain support')
makedepends=(git cmake qt5-tools ffmpeg)
conflicts=(cantata)
provides=(cantata)
source=("$pkgname::git+https://github.com/CDrummond/cantata.git")
sha1sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir build
}

build() {
    cd build
    cmake ../${pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_LIBVLC=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
