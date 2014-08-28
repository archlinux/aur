# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributors: OttoA (AUR), hoschi (AUR), samlt (AUR), andreyv (AUR)

pkgname=ioquake3-git
pkgver=20140827.gbb64bd7
pkgrel=1
pkgdesc="The de-facto OSS Quake 3 distribution. You need the retail/demo .pk3 files to play."
url="http://ioquake3.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl' 'freetype2' 'libjpeg' 'libvorbis' 'openal' 'opus' 'opusfile' 'sdl2' 'speex' 'zlib')
makedepends=('git')
optdepends=('mumble: Mumble VoIP support')
conflicts=('quake3' 'quake3-icculus-svn' 'quake3-svn' 'ioquake3-svn')
provides=('quake3' 'ioquake3')
replaces=('quake3-icculus-svn' 'ioquake3-svn')
install=quake3.install
source=('quake3.desktop' \
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run'
'quake3::git+https://github.com/ioquake/ioq3.git')
sha256sums=('12dbd31e9de1493642d120bfd1548dfc4935e47fec806003cfc04b9d84b85673'
            'c36132c5556b35e01950f1e9c646235033a5130f87ad776ba2bc7becf4f4f186'
            'SKIP')

pkgver() {
    cd "${srcdir}/quake3"

    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

prepare() {
    cd "${srcdir}"

    # Extract Patch Files
    chmod +x "${srcdir}/linuxq3apoint-1.32b-3.x86.run"
    "${srcdir}/linuxq3apoint-1.32b-3.x86.run" --tar xf
}

q3make() {
    export CFLAGS="${CFLAGS} $(pkg-config --cflags opusfile)"

    make $@ \
        BUILD_CLIENT=1                \
        BUILD_SERVER=1                \
        BUILD_BASEGAME=0              \
        BUILD_MISSIONPACK=0           \
        BUILD_GAME_SO=0               \
        BUILD_GAME_QVM=0              \
        BUILD_RENDERER_OPENGL2=1      \
        DEFAULT_BASEDIR="/opt/quake3" \
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
        USE_INTERNAL_SPEEX=0          \
        USE_INTERNAL_ZLIB=0           \
        USE_INTERNAL_JPEG=0           \
        USE_INTERNAL_OGG=0            \
        USE_INTERNAL_OPUS=0           \
        USE_INTERNAL_VORBIS=0         \
        USE_LOCAL_HEADERS=0
}

build() {
    cd "${srcdir}/quake3"

    q3make
}

package() {
    cd "${srcdir}/quake3"

    # Create Destination Directories
    install -d "${pkgdir}"/{usr/bin,/opt/quake3/{baseq3,missionpack,demoq3}}

    # Install Files
    q3make COPYDIR="${pkgdir}/opt/quake3" copyfiles

    # Install Quake 3 Patch Files
    install -m 644 "${srcdir}"/baseq3/*.pk3 \
        "${pkgdir}/opt/quake3/baseq3/"

    # Install Quake 3 Expansion Pack Patch Files
    install -m 644 "${srcdir}"/missionpack/*.pk3 \
        "${pkgdir}/opt/quake3/missionpack/"

    # Link pk3 files to demoq3
    ln -sf /opt/quake3/baseq3/pak{1..8}.pk3 "${pkgdir}/opt/quake3/demoq3/"

    # Link Executables in /usr/bin
    ln -sf "/opt/quake3/ioquake3" "${pkgdir}/usr/bin/quake3"
    ln -sf "/opt/quake3/ioq3ded" "${pkgdir}/usr/bin/q3ded"

    # Install Desktop File
    install -D -m 644 "${srcdir}/quake3.desktop" \
        "${pkgdir}/usr/share/applications/quake3.desktop"

    # Install Icon File
    install -D -m 644 "${srcdir}/quake3/misc/quake3.png" \
        "${pkgdir}/usr/share/pixmaps/quake3.png"
}

