# Mainainer:   Patrick Auernig <patrick.auernig@gmail.com>
# from original soundkonverter PKGBUILD:
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=soundkonverter-frameworks-git
pkgver=v3.0.0.r0.g2200d33
pkgrel=1
pkgdesc="Front-end to various audio converters"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=29024"
license=('GPL')
depends=('kdelibs4support'
         'libkcddb'
         'taglib'
	 'hicolor-icon-theme')
makedepends=('kdoctools'
            'extra-cmake-modules'
            'cmake'
            'kdesignerplugin')
optdepends=('cdrkit: cdda2wav backend'
            'faac: faac backend'
            'faad2: faad backend'
            'ffmpeg: ffmpeg backend'
            'flac: flac backend'
            'fluidsynth: flouidsynth backend'
            'lame: lame backend'
            'mac: mac backend'
            'mplayer: mplayer backend'
            'mp3gain: mp3gain backend'
            'opus-tools: opus backend'
            'speex: speexenc, speexdec backends'
            'timidity++: midi backend'
            'twolame: twolame backend'
            'vorbisgain: vorbisgain backend'
            'vorbis-tools: vorbis tools backend'
            'wavpack: wavpack backend'
            'sox: sox plugin (change sample rate, various effects)')
source=("soundkonverter::git+https://github.com/dfaust/soundkonverter")
provides=("soundkonverter" "soundkonverter-frameworks")
conflicts=("soundkonverter" "soundkonverter-frameworks")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/soundkonverter"
    (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's|\([^-]*-g\)|r\1|;s|-|.|g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir"
    [[ -d build ]] && rm -rf build
    mkdir -p build
}

build() {
    cd "$srcdir/build"

    cmake "$srcdir/soundkonverter/src" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}

