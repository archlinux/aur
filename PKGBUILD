# Maintainer: Nathan Chere <git@nathanchere.com.au>
# Contributor: Phillip Schichtel <phillip@schich.tel>
pkgname=grayjay
pkgver=3
pkgrel=2
pkgdesc="Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
provides=('grayjay')
conflicts=('grayjay-bin')
conflicts=('grayjay-git')
options=('!strip' 'staticlibs')
_futo_videostreaming_base='https://gitlab.futo.org/videostreaming'
url="${_futo_videostreaming_base}/Grayjay.Desktop"
license=('Source First License 1.1')
depends=('ffmpeg' 'libsodium')
makedepends=('dotnet-sdk>=8' 'dotnet-sdk<9' 'git')
source=("${pkgname}::git+${_futo_videostreaming_base}/Grayjay.Desktop.git#commit=3b3e83f94dd196f25ff1fea1214ebacce763ee4e"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "Grayjay.Desktop.CEF.csproj.user"
        "FUTO.MDNS.csproj.user")
sha256sums=('837523d79a526822ae5b6bdf26edbcdeaf15a37c7622f977928f1af9556f81ce'
            'a058a42827e66bebb74c5b19479612809a569fbe4aca6d1f90b50927a6b59f1c'
            'e73c73564dd6d1e4fc99b2151a8c0511dee103969a85595564aa20a2d2ba854a'
            '16012059237ee70057bcb78926729452f6922d14050f022e4c1b6826eb6f7185'
            '866d23e27921778ea28111a261f10b1a1c5b7b9b62a204ec29125c72da59de45')

prepare() {
    cd "${srcdir}/${pkgname}"
    git config submodule.FUTO.MDNS.url "${_futo_videostreaming_base}/FUTO.MDNS.git"
    git config submodule.Grayjay.Engine.url "${_futo_videostreaming_base}/Grayjay.Engine.git"
    git config submodule.JustCef.url "${_futo_videostreaming_base}/JustCef.git"
    git submodule update --init --recursive

    cp "${srcdir}/Grayjay.Desktop.CEF.csproj.user" Grayjay.Desktop.CEF
    cp "${srcdir}/FUTO.MDNS.csproj.user" FUTO.MDNS/FUTO.MDNS
}

_configuration="Release"
_target="linux-x64"

build() {
    cd "${srcdir}/${pkgname}"

    # Build front-end
    cd Grayjay.Desktop.Web
    npm install
    npm run build
    cd ..

    # Publish CEF
    local _targetdir="Grayjay.Desktop.CEF/bin/${_configuration}/net8.0/${_target}"
    rm -R "${_targetdir}" 2> /dev/null || true
    mkdir -p "${_targetdir}/publish/wwwroot"
    cp -a "Grayjay.Desktop.Web/dist" "${_targetdir}/publish/wwwroot/web"

    cd Grayjay.Desktop.CEF
    dotnet publish -r "${_target}" -c "${_configuration}"
    cd ..
}

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Copy application files
    local _appdir="${pkgdir}/opt/${pkgname}"
    cp -va "${srcdir}/${pkgname}/Grayjay.Desktop.CEF/bin/${_configuration}/net8.0/${_target}/publish/." "${_appdir}"
    rm -v "${_appdir}/ffmpeg"
    rm -v "${_appdir}/Portable"
    rm -v "${_appdir}/libsodium.so"
    find "${_appdir}" -type f -name '*.so' -o -name '*.so.*' -o -name 'dotcefnative' -exec chmod a+x "{}" \;

    install -Dm755 "${srcdir}/grayjay.sh" "${pkgdir}/usr/bin/grayjay"
    install -Dm644 "${srcdir}/grayjay.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/grayjay/Grayjay.Desktop.CEF/grayjay.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/grayjay/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
