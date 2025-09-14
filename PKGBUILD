# Maintainer: devome <evinedeng@hotmail.com>

_dotnet_ver=8.0
_reponame=SyncClipboard
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-desktop"
pkgver=3.1.0
pkgrel=1
pkgdesc="Cross-Platform Cipboard Syncing Solution (Desktop)"
arch=("x86_64" "aarch64")
url="https://github.com/Jeric-X/${_reponame}"
license=("MIT")
depends=("aspnet-runtime-${_dotnet_ver}" "fontconfig" "libxinerama" "libxt" "libxtst" "wl-clipboard" "xclip")
makedepends=("dotnet-sdk-${_dotnet_ver}" "librsvg")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('cd67b468577ee8abaf9f957bc3467ffcf356a9bb046479aa39054b0292f73a6a'
            '77a340cd087cbfd79fdbbb1d53a33288884c21cd0945b6ea4abfd0c6a298fc75')
case $CARCH in
    x86_64)  _dotnet_cpu=x64;;
    aarch64) _dotnet_cpu=arm64;;
esac

prepare() {
    cd "${_reponame}-${pkgver}"
    cp -f build/linux/icons/icon.svg icon.svg
    rm -rf builddir &>/dev/null
}

build() {
    cd "${_reponame}-${pkgver}"

    for res in 16 32 48 64 128 256 512; do
        rsvg-convert -w "${res}" -h "${res}" -o "${res}x${res}.png" icon.svg
    done
    dotnet restore "src/${_reponame}.Desktop.Default"
    dotnet publish "src/${_reponame}.Desktop.Default/${_reponame}.Desktop.Default.csproj" \
        --no-restore \
        --configuration Release \
        --framework "net${_dotnet_ver}" \
        --self-contained false \
        --output builddir \
        --runtime "linux-${_dotnet_cpu}" \
        -p:DebugSymbols=false \
        -p:DebugType=none
}

package() {
    local _binary="/usr/lib/${_pkgname}/desktop/${_reponame}.Desktop.Default"

    install -Dm644 "${_pkgname}.desktop"   "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_reponame}-${pkgver}"
    install -Dm644 icon.svg                "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${_pkgname}.svg"
    install -Dm644 LICENSE                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 *.md docs/*.md       -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"     "${pkgdir}/usr/lib/${_pkgname}"
    cp -r --preserve=mode "builddir"       "${pkgdir}/usr/lib/${_pkgname}/desktop"
    ln -sf "${_binary}"                    "${pkgdir}/usr/bin/${pkgname}"
    for res in 16 32 48 64 128 256 512; do
        install -Dm644 "${res}x${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done
}
