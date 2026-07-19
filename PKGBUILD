# Original Author: YusufOzmen01 <yusufmarquina at gmail dot com>
# Maintainer: hypevhs <hackgammavision at gmail dot com>

pkgname=kikitan-translator-git
_appname=kikitan-translator
pkgver=1.2.5.r98.ge64a97a
pkgrel=1
pkgdesc="Kikitan Translator, a realtime VRChat Translator"
arch=('x86_64')
url="https://github.com/YusufOzmen01/kikitan-translator"
license=('MIT')
depends=(
    'glibc'
    'libstdc++'
    'libgcc'
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
    'bash'
)
makedepends=(
    'git'
    'dotnet-sdk-9.0'
    'nodejs'
    'npm'
    'squashfs-tools'
)
provides=('kikitan-translator')
conflicts=('kikitan-translator')
options=('!strip')
source=(
    "${_appname}::git+${url}.git#branch=dotnet"
    "kikitan-translator.desktop"
    "kikitan"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
pkgver() {
    cd "${srcdir}/${_appname}"
    # grep -m1 '<Version>' KikitanTranslator.Photino/KikitanTranslator.Photino.csproj | sed 's/.*<Version>\(.*\)<\/Version>.*/\1/' | tr -d '[:space:]'
    git describe --long --tags --abbrev=7 --exclude '*[a-uw-z]*' --exclude 'v.0.0.0' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    # [a-uw-z] -- omit tags with any alphabetic char aside from v
}

prepare() {
    cd "${srcdir}/${_appname}"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export HOME="${srcdir}/home"
    mkdir -p "${HOME}"

    # patch -Np1 < ../skippable-flatpak.patch
    cd KikitanTranslator.Photino/UserInterface
    npm i
}

build() {
    cd "${srcdir}/${_appname}"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export HOME="${srcdir}/home"
    mkdir -p "${HOME}/.dotnet/tools"
    unset SOURCE_DATE_EPOCH

    dotnet tool install -g vpk
    export PATH="$PATH:${HOME}/.dotnet/tools"

    dotnet build -c Release -r linux-x64 KikitanTranslator.Photino/ /p:SkipFlatpak=true
}

package() {
    cd "${srcdir}/${_appname}"

    _appimage="KikitanTranslator.Photino/bin/Release/net9.0/linux-x64/Release/com.github.yusufozmen01.kikitan-translator.AppImage"

    chmod +x "${_appimage}"
    "${_appimage}" --appimage-extract

    find squashfs-root -type d -exec chmod 755 {} +
    find squashfs-root -type f -exec chmod 644 {} +
    find squashfs-root/usr/bin -type f -exec chmod 755 {} +
    chmod +x squashfs-root/AppRun

    install -dm755 "${pkgdir}/opt/${_appname}"
    cp -r squashfs-root/. "${pkgdir}/opt/${_appname}/"

    install -Dm644 "KikitanTranslator.Photino/Resources/wwwroot/kikitan_logo.ico" "${pkgdir}/usr/share/pixmaps/${_appname}.ico"

    install -Dm644  "${srcdir}/kikitan-translator.desktop"  "${pkgdir}/usr/share/applications/${_appname}.desktop"

    install -Dm755 "${srcdir}/kikitan" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
