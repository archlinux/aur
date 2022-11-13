#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>
# shellcheck disable=2034,3030,2154
pkgname=alchemy-viewer
pkgver=6.5.5_r48681.g12c2a9b7e9
pkgrel=1
pkgdesc="This is the next generation of Alchemy Viewer!"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=('coreutils' 'cmake' 'gcc' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz' 'ninja' 'sed')
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
provides=('alchemy-viewer')
options=(!emptydirs !makeflags !strip !lto)
install=alchemy.install
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch='"${AL_BRANCH_OVERRIDE:-main}"
'compile.bash')
b2sums=('SKIP'
        'b03a84626d849b87fdc012cdee3743d4bc60ffd9cf865f99b7db58fe5fef9fa98e476277ac73f554ffa16a8fdc0b0304b8a93e1d8e62e48b1c79c8b9d18f3f75')

pkgver() {
    cd "${pkgname}" || exit 1
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        # At the moment, git tags are sorely underused, fake a semver-friendly one
        printf "%s_r%s.g%s" "$(cat indra/newview/VIEWER_VERSION.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}" || exit 1
    git fetch --prune
    git checkout main
    git pull --autostash
    if [ -z "$AL_BRANCH_OVERRIDE" ]; then
        git checkout "${AL_COMMIT_OVERRIDE:-12c2a9b7e90024f2990956ba0d0efff42d2b45bc}"
    else
        git checkout "${AL_COMMIT_OVERRIDE:-HEAD}"
    fi
}

build() {
    cd "${pkgname}" || exit 1
    ../../compile.bash "${OPTIONS}"
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
