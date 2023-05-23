# Maintainer: goetzc
# Maintainer: Kim Scarborough <sluggo@unknown.nu>
pkgname=cantata-git
pkgver=2.5.0.r7607.e2a8aa496
pkgrel=1
pkgdesc="Qt5 graphical client for Music Player Daemon (MPD) - git version."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/fenuks/cantata"
license=(GPL3)
depends=(qt5-multimedia
         qt5-svg
         libcdio-paranoia
         libmtp
         libmusicbrainz5
         media-player-info
         mpg123
         taglib-extras
         udisks2
         )
optdepends=('perl-uri: Dynamic playlist'
            'mpd: Playback'
            'ffmpeg: ReplayGain support'
            )
makedepends=(git cmake qt5-tools ffmpeg)
conflicts=(cantata)
provides=(cantata)
source=("$pkgname::git+${url}.git")

pkgver() {
    cd "${pkgname}"
    # Add missing Git tag
    git tag -f v2.5.0 46a6c7b5ec46184288a3efde8245921f36777146
    printf "%s.r%s.%s" "$(git tag | tail -n 1 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

sha256sums=('SKIP')
