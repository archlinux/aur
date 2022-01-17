#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>
# shellcheck disable=2034,3030,2154
pkgname=alchemy-viewer
pkgver=6.5.2.48005.c0f6ab8dca
pkgrel=1
pkgdesc="This is the next generation of Alchemy Viewer! - Git Source build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=('cmake' 'gcc' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz' 'ninja')
optdepends=(
    'alsa-lib: ALSA support'
    'freealut: OpenAL support'
    'gamemode: Gamemode support'
    'lib32-libidn11: SLVoice support'
    'libpulse: PulseAudio support'
    'mesa-libgl: Intel, Radeon, Nouveau support'
    'nvidia-libgl: NVIDIA support'
'nvidia-utils: NVIDIA support')
provides=('alchemy-next' 'secondlife')
conflicts=('alchemy-next-viewer-git')
replaces=('alchemy-next-viewer' 'alchemy-next-viewer-git')
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch=main' 'alchemy-next.desktop')
md5sums=('SKIP'
         'adb72c8434b2bc90258f187eaec6987d')
sha256sums=('SKIP'
            'aa3e45d00a567b26b226ff4429c783c12fcd50dbda05e39eda09ad62074d5ae6')
b2sums=('SKIP'
        '4b90a26925bfa68e96db72a7508039a39600fcec549fa189e42ff38d1956b9b8ee6caeaad8dad8f746976f81754078910930dc8d145def453147acced5dcd2c9')

pkgver() {
    cd "${pkgname}" || exit 1
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "%s.%s.%s" "$(cat indra/newview/VIEWER_VERSION.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}" || exit 1
    git fetch --prune
    git checkout main
    git pull --autostash
    git checkout "${AL_GIT_BRANCH:-fb451f141d}"
}

build() {
    cd "${pkgname}" || exit 1
    virtualenv ".venv" -p python3
    source ".venv/bin/activate"
    if command -v autobuild; then
        abver="$(autobuild --version)"
        echo "Found ${abver}"
        if [ "${abver}" = "autobuild 2.1.0" ]; then
            echo "Reinstalling autobuild to work around some bugs"
            pip3 uninstall --yes autobuild
        fi
    fi
    pip3 install --upgrade autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
    # shellcheck disable=SC2153
    autobuild configure -A 64 -c ReleaseOS -- -DLL_TESTS:BOOL=OFF -DDISABLE_FATAL_WARNINGS=ON -DUSE_LTO:BOOL="$(grep -cq '[^!]lto' <<< "${OPTIONS}" && echo 'ON' || echo 'OFF')" -DVIEWER_CHANNEL="Alchemy Test"
    cd "build-linux-64" || exit 1
    if ninja -j"$(nproc)"; then
        echo "Build successful."
    else
        echo "Build failed. Cleaning and trying again for you..."
        echo "Cleaning build folder..."
        rm -rf "${pkgname}/build-linux-64"
        if ninja -j"$(nproc)"; then
            echo "Build succeeded after 2 tries"
        else
            echo "Build failed twice. Will not try again."
        fi
    fi
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/alchemy-viewer.desktop"
}
