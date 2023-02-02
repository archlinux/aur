#!/bin/bash
# Maintainer: Xenhat Hex (aur@xenh.at)
# Contributor: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
#
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=6.9.50471.6252c244f0
pkgrel=1
pkgdesc="A Second Life client with focus on performance and code correctness. - Git Source build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 libgl libiconv libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=('cmake' 'clang' 'lld' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz' 'ninja')
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
    'nvidia-utils: NVIDIA support'
		'wine: More up-to-date, less buggy SLVoice support')
replaces=('alchemy-viewer-git')
install=alchemy.install
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch='"${AL_BRANCH_OVERRIDE:-main}"
'compile.bash')
sha256sums=('SKIP'
            '3e00fe0baac4ac938d79bcc591b04183c0d8e6fa266ecf69e864ede66d7a0846')

pkgver() {
    cd "${pkgname}" || exit 1
    ( set -o pipefail
        printf "%s.%s.%s" "$(cat indra/newview/VIEWER_VERSION.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short main)"
    )
}

prepare() {
    cd "${pkgname}" || exit 1
    export USE_VENV=1
    ../compile.bash prepare
}

build() {
    cd "${pkgname}" || exit 1
    export USE_VENV=1
    ../compile.bash build
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
