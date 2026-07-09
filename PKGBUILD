# Maintainer: matellush <202132988+matellush@users.noreply.github.com>

pkgname=wheelwizard
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.4.11
_pkgver="v$pkgver"
pkgrel=4
pkgdesc="${_name} – Mario Kart Mod Manager & Retro Rewind Auto Updater"
arch=('x86_64' 'aarch64')
url="https://github.com/Team${_name}/${_name}"
license=('GPL-3.0')
_dotnet_ver=8.0
_dotnet_configuration=Release
_default_res=256
options=(!strip)
depends=('gcc-libs'
         'glibc'
         'hicolor-icon-theme'
         'zlib'
         "dotnet-sdk-${_dotnet_ver}")
optdepends=('dolphin-emu: native Dolphin support'
            'flatpak: Flatpak Dolphin support')
provides=(${pkgname})
conflicts=(${pkgname})

source=("${_name}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
b2sums=('548425ea02810696168a766390299c2c0f6f79db0828381ace06d316a3c1fa7f426cb4ce6f5084a8f85fbb49e8086f2a6e5c3dcdd223ddf4b24cc151727fa9fb')

prepare() {
    pushd "${_name}-${pkgver}"
    sed -i "s/^Icon=.*$/Icon=${_name}/g" "Flatpak/${_app_id}.desktop"
    sed -i "s/^Icon=.*$/Icon=${_name}/g" "Flatpak/${_app_id}-url-handler.desktop"
    popd
}

build() {
    pushd "${_name}-${pkgver}"
    # We intentionally leave out the runtime identifier here to keep the fallback auto updater
    DOTNET_CLI_TELEMETRY_OPTOUT=true dotnet publish \
        "${_name}/${_name}.csproj" \
        -c ${_dotnet_configuration} \
        -p:ContinuousIntegrationBuild=true \
        -p:Deterministic=true \
        -p:DeterministicSourcePaths=true \
        -p:DebugType=embedded \
        -p:EnableSourceLink=false \
        -p:EmbedAllSources=true \
        -p:EmbedUntrackedSources=true \
        -p:PublishRepositoryUrl=false \
        -p:RepositoryUrl= \
        -p:RepositoryBranch= \
        -p:SourceBranchName= \
        -p:SourceRevisionId= \
        -p:IncludeSourceRevisionInInformationalVersion=false \
        --no-self-contained
    popd
}

package() {
    pushd "${srcdir}/${_name}-${pkgver}"
    install -D -m0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d -m0755 "${pkgdir}/usr/lib/${pkgname}/"
    cp -r --remove-destination "${_name}/bin/${_dotnet_configuration}/net${_dotnet_ver}/publish/"* \
        "${pkgdir}/usr/lib/${pkgname}/"
    install -d -m0755 "${pkgdir}/usr/bin/"
    ln -sf "../lib/${pkgname}/${_name}" "${pkgdir}/usr/bin/${_name}"
    install -D -m0644 "Flatpak/${_app_id}.desktop" \
        "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -D -m0644 "Flatpak/${_app_id}-url-handler.desktop" \
        "${pkgdir}/usr/share/applications/${_name}-url-handler.desktop"
    install -D -m0644 "Flatpak/${_app_id}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_default_res}x${_default_res}/apps/${_name}.png"
    popd
}
