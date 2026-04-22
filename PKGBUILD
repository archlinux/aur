# Maintainer: Toby Heath <heathtobias@gmail.com>
pkgname=teamtalk-client-source
pkgver=5.22
pkgrel=1
pkgdesc='TeamTalk 5 Qt client built from upstream source against the official BearWare SDK'
arch=('x86_64')
url='https://github.com/BearWare/TeamTalk5'
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-speech' 'libxss' 'libx11'
         'alsa-lib' 'libpulse' 'openssl')
makedepends=('cmake' 'qt6-tools' 'git')

source=("TeamTalk5-source-${pkgver}.tar.gz::https://github.com/BearWare/TeamTalk5/archive/refs/tags/v${pkgver}.tar.gz"
        "teamtalk-sdk-${pkgver}.tgz::https://bearware.dk/teamtalk/v${pkgver}/teamtalk-v${pkgver}-ubuntu22-${arch}.tgz"
        'teamtalk-source'
        'teamtalk-source.desktop'
        '0001-fix-qt-tts-engine-reinit.patch'
        '0002-fix-sound-device-name-fallback.patch'
        '0003-build-cmake-minimum-required.patch'
        '0004-ui-pulseaudio-pipewire-label.patch')
sha256sums=('b776f75c7707151e4f22d8abaa002a84fb9e36ea083b28a440b922da91c43c77'
            'c9eeb88e7c8c26f796eeff783d382a7bd36666c8a090c201cb758f5a6aeb9376'
            '2743ad36bc6dda30896eba949abc5e75a8a454d6a717b424a0f820bf48c2364d'
            '7fba0a2081c6c00c8cbbbc73b840f6759921faebba7862dc0fd1aeaa1e0da70c'
            '3a17058dd009306a84f63cab69560caf5fbec7acb2e0f18e665e8765280b6f85'
            '22574bd3a7d5b81356dda7f579fc635315b9d22272cd2dcbbdf0a22d16351c21'
            '5a694ae9847c8ef567783cb574b79863936a6b54ae4e7599a4c91cbc689882f2'
            'ff279125befa35598af2c51d1d8a7fd7fd58ca4a45528b28c83aa5b1cf12cf69')
install="${pkgname}.install"

_srcdir="TeamTalk5-${pkgver}"
_sdkdir="teamtalk-v${pkgver}-ubuntu22-${arch}"

prepare() {
    cd "${srcdir}/${_srcdir}"

    # Vendor the prebuilt SDK shared library so the qtTeamTalk subproject
    # links against it (BUILD_TEAMTALK_LIBRARY_DLL=OFF expects this path).
    install -m644 "${srcdir}/${_sdkdir}/client/libTeamTalk5.so" \
        Library/TeamTalk_DLL/libTeamTalk5.so

    # Align the source's hard-coded TEAMTALK_VERSION with whatever the SDK
    # binary actually reports. The two can drift by a point release between
    # tagged source releases and SDK uploads; without this alignment the
    # client pops a "DLL load error" warning at startup.
    local sdk_ver
    sdk_ver=$(strings Library/TeamTalk_DLL/libTeamTalk5.so \
        | grep -m1 -E '^5\.[0-9]+\.[0-9]+\.[0-9]+$')
    if [[ -n "${sdk_ver}" ]]; then
        sed -i "s|^#define TEAMTALK_VERSION .*|#define TEAMTALK_VERSION \"${sdk_ver}\"|" \
            Library/TeamTalk_DLL/TeamTalk.h
    fi

    # Apply the four pending upstream PRs so users get the bug fixes
    # while the patches are still under review. Drop a patch from this
    # list once it has been merged to upstream master.
    local p
    for p in "${srcdir}"/0*.patch; do
        echo "Applying $(basename "$p")"
        patch -p1 -i "$p"
    done
}

build() {
    cd "${srcdir}/${_srcdir}"

    cmake -S Client/qtTeamTalk -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEAMTALK_LIBRARY_DLL=OFF \
        -DQT_DEFAULT_MAJOR_VERSION=6
    cmake --build build -j"$(nproc)"
    cmake --build build --target QtTeamTalk5-Translations || true
}

package() {
    cd "${srcdir}"

    # Stage the SDK's data files (sounds, help, languages, ini default)
    # into /opt/teamtalk-client-source/, mirroring the upstream install
    # layout. Skip TeamTalk5.ini -- that's the writable user config and
    # the post-install hook handles it.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${_sdkdir}/client/help"     "${pkgdir}/opt/${pkgname}/"
    cp -r "${_sdkdir}/client/sounds"   "${pkgdir}/opt/${pkgname}/"
    install -m644 "${_sdkdir}/client/TeamTalk5.ini.default" \
        "${pkgdir}/opt/${pkgname}/TeamTalk5.ini.default"
    install -m644 "${_sdkdir}/client/README" "${pkgdir}/opt/${pkgname}/README"

    # The SDK so we built against
    install -m644 "${_sdkdir}/client/libTeamTalk5.so" \
        "${pkgdir}/opt/${pkgname}/libTeamTalk5.so"

    # Our freshly-built binary replaces the SDK-shipped teamtalk5
    install -m755 "${_srcdir}/Client/qtTeamTalk/teamtalk5" \
        "${pkgdir}/opt/${pkgname}/teamtalk5"

    # Translations rebuilt from the source tree's .ts files
    install -d "${pkgdir}/opt/${pkgname}/languages"
    if compgen -G "${_srcdir}/Client/qtTeamTalk/languages/*.qm" > /dev/null; then
        install -m644 "${_srcdir}"/Client/qtTeamTalk/languages/*.qm \
            "${pkgdir}/opt/${pkgname}/languages/"
    fi

    # Tiny LD_LIBRARY_PATH wrapper so the binary finds libTeamTalk5.so
    cat > "${pkgdir}/opt/${pkgname}/run.sh" <<'EOF'
#!/bin/sh
LD_LIBRARY_PATH="$(dirname "$0"):$LD_LIBRARY_PATH" \
    exec "$(dirname "$0")/teamtalk5" "$@"
EOF
    chmod 755 "${pkgdir}/opt/${pkgname}/run.sh"

    # User-facing launcher + .desktop entry
    install -Dm755 teamtalk-source       "${pkgdir}/usr/bin/teamtalk-source"
    install -Dm644 teamtalk-source.desktop \
        "${pkgdir}/usr/share/applications/teamtalk-source.desktop"

    # Icon (reuse the source tree's app icon)
    install -Dm644 "${_srcdir}/Client/qtTeamTalk/images/teamtalk.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/teamtalk-source.png"

    # License lifted from the SDK tarball, since the source tree itself
    # only carries per-file GPL headers and we ship the SDK alongside.
    install -Dm644 "${_sdkdir}/License.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
