#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainer: Xenhat Hex (aur@xenh.at)
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=6.5.5.48680.55fd3b5dda
pkgrel=2
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
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch=main'
'compile.bash')
sha256sums=('SKIP'
            'a97002b22640b2ee67019ed1c729dfb163116cdeeb4933755d6829e6fb02b82b')

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
    pwd
		echo "PWD: $PWD"
    ../../compile.bash "${OPTIONS}"
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
