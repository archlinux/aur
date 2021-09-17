# Maintainer: John-Michael Mulesa <jmulesa[at]gmail[dot]com>
# Contributors: Slash (AUR), OttoA (AUR), hoschi (AUR), samlt (AUR), andreyv (AUR)

pkgname=lilium-voyager-git
pkgver=20210609.g0f4e16fc
pkgrel=1
pkgdesc="An ioquake3-based Voyager: Elite Force source port."
url="https://clover.moe/lilium-voyager/"
license=('GPL')
arch=('i686' 'x86_64' 'aarch64')
depends=('curl' 'freetype2' 'libjpeg' 'libvorbis' 'openal' 'opus' 'opusfile' 'sdl2' 'zlib')
makedepends=('git')
optdepends=('mumble: Mumble VoIP support' 'eliteforce-data-gog: data files from GOG')
conflicts=('lilium-voyager' 'lilium-voyager-bin')
provides=('lilium-voyager')
install=lilium-voyager.install
source=('lilium-voyager.desktop' 'lilium-voyager::git+https://github.com/zturtleman/lilium-voyager.git')
sha256sums=('61e60de74ac8d7d2fc086264e23c45de273f51a53073dc1ef150075c734818bf'
            'SKIP')

pkgver() {
    cd "${srcdir}/lilium-voyager"

    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

prepare() {
    cd "${srcdir}"

    # TODO:prep
}

q3make() {
    export CFLAGS+=" ${CPPFLAGS}"

    make $@ \
        BUILD_CLIENT=1                \
        BUILD_SERVER=1                \
        BUILD_BASEGAME=0              \
        BUILD_MISSIONPACK=0           \
        BUILD_GAME_SO=0               \
        BUILD_GAME_QVM=0              \
        BUILD_RENDERER_OPENGL2=1      \
        DEFAULT_BASEDIR="/opt/lilium-voyager" \
        FULLBINEXT=''                 \
        GENERATE_DEPENDENCIES=0       \
        OPTIMIZE=''                   \
        USE_OPENAL=1                  \
        USE_OPENAL_DLOPEN=0           \
        USE_CURL=1                    \
        USE_CURL_DLOPEN=0             \
        USE_CODEC_VORBIS=1            \
        USE_CODEC_OPUS=1              \
        USE_FREETYPE=1                \
        USE_MUMBLE=1                  \
        USE_VOIP=1                    \
        USE_INTERNAL_LIBS=0
}

build() {
    cd "${srcdir}/lilium-voyager"

    q3make
}

package() {
    cd "${srcdir}/lilium-voyager"

    # Create Destination Directories
    install -d "${pkgdir}"/{usr/bin,/opt/lilium-voyager/baseEF}

    # Install Files
    q3make COPYDIR="${pkgdir}/opt/lilium-voyager" copyfiles

    # Link Executables in /usr/bin
    ln -sf "/opt/lilium-voyager/liliumvoyhm" "${pkgdir}/usr/bin/liliumvoyhm"
    ln -sf "/opt/lilium-voyager/liliumvoyded" "${pkgdir}/usr/bin/liliumvoyded"

    # Install systemd service file
    install -D -m 644 "${srcdir}/lilium-voyager/misc/linux/q3a.service" \
        "${pkgdir}/usr/lib/systemd/system/liliumvoy.service"

    # Patch systemd service file
    sed -i -e "s@/usr/local/games/quake3/ioq3ded.x86_64@/opt/lilium-voyager/liliumvoyded@" \
        "${pkgdir}/usr/lib/systemd/system/liliumvoy.service"

    # Install Desktop File
    install -D -m 644 "${srcdir}/lilium-voyager.desktop" \
        "${pkgdir}/usr/share/applications/lilium-voyager.desktop"

    # Install Icon File
    install -D -m 644 "${srcdir}/lilium-voyager/misc/lilium.png" \
        "${pkgdir}/usr/share/pixmaps/lilium-voyager.png"
}

