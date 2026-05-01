# Maintainer: Your Name <your@email.com>
pkgname=kikitan-translator
pkgver=2.0.0
pkgrel=1
pkgdesc="Kikitan Translator, a realtime VRChat Translator"
arch=('x86_64')
url="https://github.com/YusufOzmen01/kikitan-translator"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'gst-plugins-good'
    'gst-plugins-base'
    'fuse2'
    'libnotify'
    'libsoup3'
    'libsecret'
    'at-spi2-core'
    'xdg-utils'
    'pipewire'
    'pipewire-audio'
    'aspnet-runtime-9.0'
    'dotnet-runtime-9.0'
)
makedepends=(
    'git'
    'dotnet-sdk-9.0'
    'nodejs'
    'npm'
    'squashfs-tools'
)
options=('!strip')
source=(
    "${pkgname}::git+${url}.git#branch=dotnet"
    "kikitan-translator.desktop"
    "kikitan"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
pkgver() {
    cd "${srcdir}/${pkgname}"
    grep -m1 '<Version>' KikitanTranslator.Photino/KikitanTranslator.Photino.csproj | sed 's/.*<Version>\(.*\)<\/Version>.*/\1/' | tr -d '[:space:]'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export HOME="${srcdir}/home"
    mkdir -p "${HOME}"

    cd KikitanTranslator.Photino/UserInterface
    npm i
}

build() {
    cd "${srcdir}/${pkgname}"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export HOME="${srcdir}/home"
    mkdir -p "${HOME}/.dotnet/tools"
    unset SOURCE_DATE_EPOCH

    dotnet tool install -g vpk
    export PATH="$PATH:${HOME}/.dotnet/tools"

    dotnet build -c Release -r linux-x64 KikitanTranslator.Photino/
}

package() {
    cd "${srcdir}/${pkgname}"

    _appimage="KikitanTranslator.Photino/bin/Release/net9.0/linux-x64/Release/com.github.yusufozmen01.kikitan-translator.AppImage"

    chmod +x "${_appimage}"
    "${_appimage}" --appimage-extract

    find squashfs-root -type d -exec chmod 755 {} +
    find squashfs-root -type f -exec chmod 644 {} +
    find squashfs-root/usr/bin -type f -exec chmod 755 {} +
    chmod +x squashfs-root/AppRun

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/. "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "KikitanTranslator.Photino/Resources/wwwroot/kikitan_logo.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

    install -Dm644  "${srcdir}/kikitan-translator.desktop"  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${srcdir}/kikitan" "${pkgdir}/usr/bin/${pkgname}"

    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
