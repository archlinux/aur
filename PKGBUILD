#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainer: Xenhat Hex (aur@xenh.at)
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=6.5.5.48683.68d6e8c86e
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
    'lib32-libsndfile: SLVoice support'
    'lib32-util-linux: SLVoice support'
    'lib32-gstreamer0.10: SLVoice support'
    'libpulse: PulseAudio support'
    'mesa-libgl: Intel, Radeon, Nouveau support'
    'nvidia-libgl: NVIDIA support'
'nvidia-utils: NVIDIA support')
provides=('alchemy-viewer')
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
        printf "%s.%s.%s" "$(cat indra/newview/VIEWER_VERSION.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}" || exit 1
    #git fetch --prune
    #git checkout main
    #git pull --autostash
    #git checkout "${AL_GIT_REVISION:-origin/main}"
}

build() {
    cd "${pkgname}" || exit 1
    virtualenv ".venv" -p python3
    source ".venv/bin/activate"
    pip install --upgrade certifi
    if command -v autobuild; then
        abver="$(autobuild --version)"
        echo "Found ${abver}"
        if [ "${abver}" = "autobuild 2.1.0" ]; then
            echo "Reinstalling autobuild to work around some bugs"
            pip3 uninstall --yes autobuild
            pip3 install autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
        fi
    else
        pip3 install autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
    fi
    # we have a lot of files, relax ulimit to help performance
    ulimit -n 20000
    # shellcheck disable=SC2153
    autobuild configure -A 64 -c ReleaseOS -- -DLL_TESTS:BOOL=OFF -DDISABLE_FATAL_WARNINGS=ON -DUSE_LTO:BOOL="$(grep -cq '[^!]lto' <<< "${OPTIONS}" && echo 'ON' || echo 'OFF')" -DVIEWER_CHANNEL="Alchemy Test"
    cd "build-linux-64" || exit 1
    jobcount=$(nproc)
    if [[ ${jobcount} -gt 1 ]]; then
        # The viewer requires an average of 4GB of memory per CPU core to sucessfully link
        mempercorekb=$((4 * 1048576))
        requiredmemorykb=$(($(nproc) * mempercorekb))
        availablememorykb=$(grep MemTotal /proc/meminfo | tr -s ' ' | cut -d ' ' -f 2)
        freememkb="$(grep MemFree /proc/meminfo | tr -s ' ' | cut -d ' ' -f 2)"
        if [[ ${requiredmemorykb} -gt ${availablememorykb} ]]; then
        jobs=0
        until [[ $(((jobs + 1) * mempercorekb)) -gt ${availablememorykb} ]]; do
           jobs=$((jobs+1))
        done
        #((jobs--))
        jobcount=${jobs}
        elif [[ ${jobcount} -le 8 ]]; then
           jobcount=$((jobcount - 1))
        else
           jobcount=$((jobcount - 2))
        fi
    fi
    echo "Building with ${jobcount} jobs (adjusted)"
    time ninja -l"$(nproc)" -j${jobcount}
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
