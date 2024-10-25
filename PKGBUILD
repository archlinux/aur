# Maintainer: devome <evinedeng@hotmail.com>

_dotnet_ver=6.0
_reponame=SyncClipboard
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-desktop"
pkgver=0.7.7
pkgrel=1
pkgdesc="Cross-Platform Cipboard Syncing Solution (Desktop)"
arch=("x86_64" "aarch64")
url="https://github.com/Jeric-X/${_reponame}"
license=("MIT")
depends=("aspnet-runtime-${_dotnet_ver}" "fontconfig" "libxinerama" "libxt" "libxtst")
makedepends=("dotnet-sdk-${_dotnet_ver}" "fuse2" "git" "librsvg" "unzip")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}-${pkgver}.txt::${url}.Desktop/raw/refs/tags/v${pkgver}/version.txt"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '59d2d2a7a455faccfb30edd2b9ab588b86dba009a2cc38e71f479341b135c698'
            'c738a39534a5a9f005213f5347bfcea3558920f651e89d293a07415970e6eea5')
case $CARCH in
    x86_64)  _dotnet_cpu=x64;;
    aarch64) _dotnet_cpu=arm64;;
esac

prepare() {
    local _commit=$(tail -1 "${_pkgname}-${pkgver}.txt")

    cd "${_pkgname}"
    git checkout "${_commit}"
    mv "src/${_reponame}.Desktop/Changes.md" .
}

build() {
    cd "${_pkgname}"

    mkdir -p icons
    for res in 16 32 48 64 128 256 512; do
        rsvg-convert -w "${res}" -h "${res}" -o "icons/${res}x${res}.png" build/linux/icons/icon.svg
    done
    dotnet restore "src/${_reponame}.Desktop.Default"
    dotnet format  "src/${_reponame}.Desktop"         --verify-no-changes --no-restore
    dotnet format  "src/${_reponame}.Desktop.Default" --verify-no-changes --no-restore
    dotnet format  "src/${_reponame}.Desktop"         --verify-no-changes --no-restore --severity info
    dotnet format  "src/${_reponame}.Desktop.Default" --verify-no-changes --no-restore --severity info
    dotnet msbuild "src/${_reponame}.Desktop.Default/${_reponame}.Desktop.Default.csproj" \
        /p:RuntimeIdentifier="linux-${_dotnet_cpu}" \
        /p:Platform="${_dotnet_cpu}" \
        /p:SelfContained=false \
        /p:OutDir=desktop \
        /p:Configuration=Release \
        /t:Publish \
        /v:m
}

package() {
    local _source="src/${_reponame}.Desktop.Default/bin/${_dotnet_cpu}/Release/net${_dotnet_ver}/linux-${_dotnet_cpu}/publish"
    local _binary="/usr/share/${_pkgname}/desktop/${_reponame}.Desktop.Default"

    install -Dm644 "${_pkgname}.desktop"         "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}"
    for res in 16 32 48 64 128 256 512; do
        install -Dm644 "icons/${res}x${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done
    install -Dm644 build/linux/icons/icon.svg    "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${_pkgname}.svg"
    install -Dm644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 *.md docs/*.md             -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755                               "${pkgdir}/usr/share/${_pkgname}" \
                                                 "${pkgdir}/usr/share/licenses/${pkgname}" \
                                                 "${pkgdir}/usr/bin"
    cp -r --preserve=mode "${_source}"           "${pkgdir}/usr/share/${_pkgname}/desktop"
    ln -sf "${_binary}"                          "${pkgdir}/usr/bin/${pkgname}"
}
