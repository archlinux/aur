# Maintainer: matellush <202132988+matellush@users.noreply.github.com>

pkgname=wheelwizard
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.5.1
_pkgver="v$pkgver"
pkgrel=1
pkgdesc="Mario Kart Mod Manager & Retro Rewind Auto Updater"
arch=('x86_64' 'aarch64')
url="https://github.com/Team${_name}/${_name}"
license=('GPL-3.0-only')
_dotnet_ver=10.0
_dotnet_configuration=Release
_default_res=256
options=(!strip)
depends=("dotnet-sdk-${_dotnet_ver}"
         'fontconfig'
         'glibc'
         'hicolor-icon-theme'
         'libgcc'
         'libstdc++')
optdepends=('dolphin-emu: native Dolphin support'
            'flatpak: Flatpak Dolphin support')
provides=(${pkgname})
conflicts=(${pkgname})

source=("${_name}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
b2sums=('815e9c49439b9688207bb62aef978f0de2a7d4d1bbba62335254deb9314626b73e941494438537b774a8311a80eeeaeec6bb0a973b082559080dbc43f06f4b53')

_runtime() {
    if [ "${CARCH}" = 'aarch64' ]; then
        echo 'linux-arm64'
    elif [ "${CARCH}" = 'x86_64' ]; then
        echo 'linux-x64'
    fi
}

prepare() {
    pushd "${_name}-${pkgver}"
    sed -i "s/^Icon=.*$/Icon=${_name}/g" "Flatpak/${_app_id}.desktop"
    sed -i "s/^Icon=.*$/Icon=${_name}/g" "Flatpak/${_app_id}-url-handler.desktop"
    sed -i 's/if (!string\.IsNullOrWhiteSpace(loadFolderPath) && Path\.IsPathRooted(loadFolderPath))/if (!string.IsNullOrWhiteSpace(loadFolderPath))/' WheelWizard/Services/PathManager.cs
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
    find "${pkgdir}/usr/lib/${pkgname}/runtimes" \
        -mindepth 1 -maxdepth 1 -not -name "$(_runtime)" \
        -exec rm -rf {} +
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
