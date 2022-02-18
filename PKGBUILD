#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>
# shellcheck disable=2034,3030,2154
pkgname=alchemy-viewer
pkgver=6.5.2.48000
pkgrel=6
pkgdesc="This is the next generation of Alchemy Viewer!"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=('cmake' 'gcc' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz' 'ninja' 'sed')
optdepends=(
    'alsa-lib: ALSA support'
    'freealut: OpenAL support'
    'gamemode: Gamemode support'
    'lib32-libidn11: SLVoice support'
    'lib32-libsndfile: SLVoice support'
    'lib32-util-linux: SLVoice support'
    'lib32-gstreamer0.10: SLVoice support'
    'libpulse: PulseAudio support'
    'mesa-libgl: Intel, Radeon, Nouveau support'
    'nvidia-libgl: NVIDIA support'
'nvidia-utils: NVIDIA support')
replaces=('alchemy-next-viewer')
options=(!emptydirs !makeflags !strip !lto)
install=alchemy.install
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch=main')
md5sums=('SKIP')
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}" || exit 1
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "%s.%s" "$(cat indra/newview/VIEWER_VERSION.txt)" "$(git rev-list --count HEAD)"
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
    # we have a lot of files, relax ulimit to help performance
    ulimit -n 20000
    # shellcheck disable=SC2153
    autobuild configure -A 64 -c ReleaseOS -- -DLL_TESTS:BOOL=OFF -DDISABLE_FATAL_WARNINGS=ON -DUSE_LTO:BOOL="$(grep -cq '[^!]lto' <<< "${OPTIONS}" && echo 'ON' || echo 'OFF')" -DVIEWER_CHANNEL="Alchemy Test"
    cd "build-linux-64" || exit 1
    loadavg=$(nproc)
    if [[ $loadavg -gt 1 ]]; then
        if [[ $loadavg -le 8 ]]; then loadavg=$((loadavg - 1))
        else
            loadavg=$((loadavg - 2))
        fi
    fi
    time ninja -l${loadavg}
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    sed -i 's;alchemy-.*\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
