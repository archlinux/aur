#!/bin/bash
# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=6.5.2.47999.e0e1e9fb6f
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
    'libpulse: PulseAudio support'
    'mesa-libgl: Intel, Radeon, Nouveau support'
    'nvidia-libgl: NVIDIA support'
'nvidia-utils: NVIDIA support')
provides=('alchemy-viewer')
options=(!emptydirs !makeflags !strip !lto)
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch=main' 'alchemy-next.desktop')
md5sums=('SKIP'
         '59114df2d7f081aad499ad5b7d8401b7')
sha256sums=('SKIP'
            '28f928d7620818db47e7903722173a49daf36973ae51091e9ab9845211448864')
b2sums=('SKIP'
        'da5639043f1854d9d2dc884fd62a4239fdc7ca2467cd95cfcb7f6bc73ac93e73cc0229e16000378efa22d646e3756a9495d2d8bb8c76049f77e4731c2a997729')

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
    install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=.*$;Name=Alchemy (git build);' "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
    sed -i 's;Name=.*$;Name=Alchemy (git build);' "$pkgdir/opt/$pkgname/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}"';' "$pkgdir/opt/$pkgname/etc/refresh_desktop_app_entry.sh"
}
