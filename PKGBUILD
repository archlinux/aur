# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributors: OttoA (AUR), hoschi (AUR), samlt (AUR), andreyv (AUR)

pkgname=ioquake3-git
pkgver=20260701.g5d810e50
pkgrel=1
pkgdesc="The de-facto OSS Quake 3 distribution. You need the retail/demo .pk3 files to play."
url="http://ioquake3.org/"
license=('GPL-2.0-only')
arch=('i686' 'x86_64' 'aarch64')
depends=('curl' 'freetype2' 'libjpeg.so' 'libvorbis' 'openal' 'opus' 'opusfile' 'sdl2' 'zlib')
makedepends=('git' 'cmake')
optdepends=('mumble: Mumble VoIP support')
conflicts=('quake3' 'quake3-icculus-svn' 'quake3-svn' 'ioquake3-svn')
provides=('quake3' 'ioquake3')
replaces=('quake3-icculus-svn' 'ioquake3-svn')
install=quake3.install
source=('quake3.desktop' 'quake3.png' 'ioquake3.launcher' 'ioq3ded.launcher'
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run'
'quake3::git+https://github.com/ioquake/ioq3.git')
b2sums=('0b8618375af8f47654660577f9cb4d4ca88ba4c8dedf42fd96c9e0b030cfcf8a03a66f8923c5584d5e3ba61682c727fa6a2a174f530f7388bd5c44a337b91d3a'
        'dac1ebad61fd1eec809fcc397fda9cbb9effed9e646d37435e6b3b23249f8dd9f09488e1323cf307da22786be618464ffd087d1aff100b2c09d9cdecbbd5de14'
        'cf7e648261b8afbd822c0d1e868cf96ab002e121f0df91c962e34a183333cc4b65890050a9edb206ffc23bff597a451cdc3a216e39e6795618f425cd853d0cc2'
        'a435f6b72d55f969e0ca4997e2fe0219347acf70229d9776ec4bb1625a637bed43dff1b5382449b862d669c82558d9d20468fc95900141e9777a3936a2654536'
        '79585534d930a466af58cd34acaac7b9d95da2ad665525b7f7d9ad2e05f3efe5f94b7958b5adca8dd8f687b37d82323a76a701af4bd2cf6011df1e4cc59f4ca9'
        'SKIP')

pkgver() {
    cd "${srcdir}/quake3"

    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

prepare() {
    cd "${srcdir}"

    # Make latest quake3 patch executable
    chmod +x "${srcdir}/linuxq3apoint-1.32b-3.x86.run"

    # Extract Patch Files
    "${srcdir}/linuxq3apoint-1.32b-3.x86.run" --tar xf
}

build() {
    cd "${srcdir}/quake3"

    # Configure
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SERVER=ON           \
        -DBUILD_CLIENT=ON           \
        -DBUILD_RENDERER_GL1=ON     \
        -DBUILD_RENDERER_GL2=ON     \
        -DBUILD_GAME_LIBRARIES=OFF  \
        -DBUILD_GAME_QVMS=OFF       \
        -DBUILD_STANDALONE=OFF      \
        -DUSE_ARCHLESS_FILENAMES=ON \
        -DUSE_RENDERER_DLOPEN=ON    \
        -DUSE_OPENAL=ON             \
        -DUSE_OPENAL_DLOPEN=OFF     \
        -DUSE_HTTP=ON               \
        -DUSE_CODEC_VORBIS=ON       \
        -DUSE_CODEC_OPUS=ON         \
        -DUSE_VOIP=ON               \
        -DUSE_MUMBLE=ON             \
        -DUSE_FREETYPE=ON           \
        -DUSE_INTERNAL_LIBS=OFF     \
        -DCMAKE_INSTALL_PREFIX=/opt/quake3 \
        -DCMAKE_C_FLAGS_RELEASE="${CFLAGS}"

    # Build
    cmake --build build
}

package() {
    cd "${srcdir}/quake3"

    # Create Destination Directories
    install -d "${pkgdir}"/{usr/bin,/opt/quake3/{baseq3,missionpack,demoq3}}

    # Install Compiled Files
    cmake --install build --prefix "${pkgdir}/opt/quake3"

    # Install Quake 3 Patch Files
    install -m 644 "${srcdir}"/baseq3/*.pk3 \
        "${pkgdir}/opt/quake3/baseq3/"

    # Install Quake 3 Expansion Pack Patch Files
    install -m 644 "${srcdir}"/missionpack/*.pk3 \
        "${pkgdir}/opt/quake3/missionpack/"

    # Link pk3 files to demoq3
    ln -sf /opt/quake3/baseq3/pak{1..8}.pk3 "${pkgdir}/opt/quake3/demoq3/"

    # Install Launcher (Client)
    install -D -m 755 "${srcdir}/ioquake3.launcher" \
        "${pkgdir}/usr/bin/ioquake3"

    # Install Launcher (Server)
    install -D -m 755 "${srcdir}/ioq3ded.launcher" \
        "${pkgdir}/usr/bin/ioq3ded"

    # Create symlink aliases in /usr/bin
    ln -sf "/usr/bin/ioquake3" "${pkgdir}/usr/bin/quake3"
    ln -sf "/usr/bin/ioq3ded"  "${pkgdir}/usr/bin/q3ded"

    # Install systemd service file
    install -D -m 644 "${srcdir}/quake3/misc/linux/q3a.service" \
        "${pkgdir}/usr/lib/systemd/system/q3a.service"

    # Patch systemd service file
    sed -i -e "s@/usr/local/games/quake3/ioq3ded.x86_64@/opt/quake3/ioq3ded@" \
        "${pkgdir}/usr/lib/systemd/system/q3a.service"

    # Install Desktop File
    install -D -m 644 "${srcdir}/quake3.desktop" \
        "${pkgdir}/usr/share/applications/quake3.desktop"

    # Install Icon File
    install -D -m 644 "${srcdir}/quake3.png" \
        "${pkgdir}/usr/share/pixmaps/quake3.png"
}
