# Maintainer: Jorge Pizarro-Callejas <jpizarrocallejas@gmail.com>
pkgname=vkquake3-git
_pkgname=${pkgname%-git}
pkgver=0.01.r50.gec8089b0
pkgrel=1
pkgdesc="A Quake 3 engine based on ioquake3 but with additional Vulkan API support"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/suijingfeng/vkQuake3"
license=('GPL')
depends=('curl' 'libjpeg' 'libvorbis' 'openal' 'opus' 'opusfile' 'sdl2' 'vulkan-icd-loader' 'vulkan-validation-layers' 'zlib')
makedepends=('git' 'vulkan-headers')
optdepends=('mumble: Mumble VoIP support')
provides=('vkquake3' 'quake3')
conflicts=('quake3' 'quake3-icculus-svn' 'quake3-svn' 'ioquake3-svn' 'ioquake3-git')
replaces=('quake3-icculus-svn' 'ioquake3-svn' 'ioquake3-git')
install=quake3.install
source=("quake3.desktop" "quake3.png"
        "${_pkgname}-add-copy-vulkan-libs.patch"
        "http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run"
        "${_pkgname}::git+https://github.com/suijingfeng/vkQuake3.git")
md5sums=('798fa080743cd95e7935c15b4973a0fb'
         '286d89ab18f164e919c409698bfed4f1'
         'ed867c57b6c819329279214b22be5040'
         'c71fdddccb20e8fc393d846e9c61d685'
         'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"
    # Extract patch files
    chmod +x "${srcdir}/linuxq3apoint-1.32b-3.x86.run"
    "${srcdir}/linuxq3apoint-1.32b-3.x86.run" --tar xf
    cd "${srcdir}/${_pkgname}"
    patch -p1 < ../"${_pkgname}-add-copy-vulkan-libs.patch"
}

q3make() {
    # NOTE: Freetype support is kinda broken.
    export CFLAGS+=" ${CPPFLAGS}"

    make $@ \
        BUILD_CLIENT=1 \
        BUILD_SERVER=1 \
        BUILD_BASEGAME=0 \
        BUILD_MISSIONPACK=0 \
        BUILD_GAME_SO=0 \
        BUILD_GAME_QVM=0 \
        BUILD_RENDERER_OPENGL2=1 \
        DEFAULT_BASEDIR="/opt/quake3" \
        FULLBINEXT='' \
        GENERATE_DEPENDENCIES=0 \
        OPTIMIZE='' \
        USE_OPENAL=1 \
        USE_OPENAL_DLOPEN=0 \
        USE_CURL=1 \
        USE_CURL_DLOPEN=0 \
        USE_CODEC_VORBIS=1 \
        USE_CODEC_OPUS=1 \
        USE_FREETYPE=0 \
        USE_MUMBLE=1 \
        USE_VOIP=1 \
        USE_INTERNAL_LIBS=0
}

build() {
	cd "${srcdir}/${_pkgname}"
	q3make
}

package() {
    cd "${srcdir}/${_pkgname}"

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

    # Install systemd service file
    install -D -m 644 "${srcdir}/${_pkgname}/misc/linux/q3a.service" \
        "${pkgdir}/usr/lib/systemd/system/q3a.service"

    # Patch systemd service file
    sed -i -e "s@/usr/local/games/quake3/ioq3ded.x86_64@/opt/quake3/q3ded@" \
        "${pkgdir}/usr/lib/systemd/system/q3a.service"

    # Install Desktop File
    install -D -m 644 "${srcdir}/quake3.desktop" \
        "${pkgdir}/usr/share/applications/quake3.desktop"

    # Install Icon File
    install -D -m 644 "${srcdir}/quake3.png" \
        "${pkgdir}/usr/share/pixmaps/quake3.png"
}
