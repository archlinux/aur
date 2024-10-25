# Maintainer: Lonny Wong <lonnywong@qq.com>

_netver=6.0
_reponame=SyncClipboard
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-desktop"
pkgver=0.7.7
pkgrel=1
pkgdesc="Cross-Platform Cipboard Syncing Solution (Desktop)"
arch=("x86_64" "i686" "aarch64")
url="https://github.com/Jeric-X/${_reponame}"
license=("MIT")
depends=("aspnet-runtime-${_netver}" "fontconfig" "libxinerama" "libxt" "libxtst")
makedepends=("dotnet-sdk-${_netver}" "fuse2" "git" "librsvg" "unzip")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}-${pkgver}.txt::${url}.Desktop/raw/refs/tags/v${pkgver}/version.txt"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '59d2d2a7a455faccfb30edd2b9ab588b86dba009a2cc38e71f479341b135c698'
            'c738a39534a5a9f005213f5347bfcea3558920f651e89d293a07415970e6eea5')
options=("!strip")

prepare() {
    local _commit=$(tail -1 "${_pkgname}-${pkgver}.txt")

    cd "${_pkgname}"
    git checkout "${_commit}"
    rm -rf linux-bin &>/dev/null
    dotnet new tool-manifest --force
    dotnet tool install --local KuiperZone.PupNet
    chmod +x build/linux/PostPublish.sh
}

build() {
    cd "${_pkgname}"

    ## build desktop
    echo "Build desktop..."
    mkdir -p icons
    for res in 16 32 48 64 128 256 512; do
        rsvg-convert -w "${res}" -h "${res}" -o "icons/${res}x${res}.png" build/linux/icons/icon.svg
    done
    dotnet restore "src/${_reponame}.Desktop.Default"
    dotnet format  "src/${_reponame}.Desktop" --verify-no-changes --no-restore
    dotnet format  "src/${_reponame}.Desktop.Default" --verify-no-changes --no-restore
    dotnet format  "src/${_reponame}.Desktop" --verify-no-changes --no-restore --severity info
    dotnet format  "src/${_reponame}.Desktop.Default" --verify-no-changes --no-restore --severity info
    dotnet msbuild "src/${_reponame}.Desktop.Default/${_reponame}.Desktop.Default.csproj" \
        /p:RuntimeIdentifier=linux-x64 \
        /p:Platform=x64 \
        /p:SelfContained=false \
        /p:OutDir=desktop \
        /p:Configuration=Release \
        /t:Publish \
        /v:m
    mv "src/${_reponame}.Desktop.Default/bin/x64/Release/net${_netver}/linux-x64/publish" linux-bin
    cd build/linux
    dotnet pupnet linux.pupnet.conf --app-version "${pkgver}[${pkgrel}]" --kind zip -r linux-x64 -y
}

package() {
    local zipfile="build/linux/output/${_reponame}-${pkgver}-${pkgrel}.linux-x64.zip"

    install -Dm644 "${_pkgname}.desktop"          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}"
    for res in 16 32 48 64 128 256 512; do
        install -Dm644 "icons/${res}x${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done
    install -Dm644 build/linux/icons/icon.svg    "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${_pkgname}.svg"
    install -Dm644 README.md docs/README_EN.md "src/${_reponame}.Desktop/Changes.md" -t "${pkgdir}/usr/share/doc/${_pkgname}-desktop"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/desktop" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${_pkgname}-desktop"
    unzip -oqq "${zipfile}" -d "${pkgdir}/usr/share/${_pkgname}/desktop"
    ln -sf "/usr/share/${_pkgname}/desktop/${_reponame}.Desktop.Default" "${pkgdir}/usr/bin/${_pkgname}-desktop"
    ln -sf "/usr/share/${_pkgname}/desktop/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}-desktop/LICENSE"
}
