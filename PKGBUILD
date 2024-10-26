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
makedepends=("dotnet-sdk-${_dotnet_ver}" "git" "librsvg")
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
    cp -f "src/${_reponame}.Desktop/Changes.md" Changes.md
    cp -f build/linux/icons/icon.svg            icon.svg
    rm -rf builddir &>/dev/null
}

build() {
    cd "${_pkgname}"

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
        -p:DebugSymbols=false
}

package() {
    local _binary="/usr/lib/${_pkgname}/desktop/${_reponame}.Desktop.Default"

    install -Dm644 "${_pkgname}.desktop"   "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}"
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
