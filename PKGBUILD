#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=6.5.3.48016.ed795543f8
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
provides=('alchemy-viewer')
options=(!emptydirs !makeflags !strip !lto)
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch=main' 'alchemy-next.desktop')
md5sums=('SKIP'
         'dd3a176168f14b974ba55e94997ffb92')
sha256sums=('SKIP'
            'd99a439e6d5c8d51ef3b237eaf0ce0810832634623be5bddbf1a944d4f686d67')
b2sums=('SKIP'
        'a0555d6d259655845f90f24d3f1490efd9b1753ecf0e7817a98042d7543869b2c1fe37f5456a36a4dc5c8754c68ab9a20fa59f169db704f466fa9755862af0fe')

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
    git checkout "${AL_GIT_REVISION:-origin/main}"
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
    cd "build-linux-64"
    ninja -j"$(nproc)"
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/local/share/applications"
    mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
    sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "$pkgdir/opt/$pkgname/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}"';' "$pkgdir/opt/$pkgname/etc/refresh_desktop_app_entry.sh"
}
