# Maintainer: matellush <202132988+matellush@users.noreply.github.com>

pkgname=wheelwizard
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.3.0
pkgrel=1
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
         'zlib')
makedepends=("dotnet-sdk-${_dotnet_ver}")
optdepends=('dolphin-emu: native Dolphin support'
            'flatpak: Flatpak Dolphin support')
provides=(${pkgname})
conflicts=(${pkgname})

source=("${_name}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('672d3842c8312ef398dcc48756508ec12e6b24f3a5f935e169161bd74fac25fff1996f27f56bb2d99d02659b2890aab7b814adc4b4541f30967155b3223af444')

_arch() {
    if [ "${CARCH}" = 'aarch64' ]; then
        echo 'arm64'
    elif [ "${CARCH}" = 'x86_64' ]; then
        echo 'x64'
    fi
}

_dotnet_runtime_identifier() {
    echo "linux-$(_arch)"
}

prepare() {
    pushd "${_name}-${pkgver}"
    sed -i "s/^Icon=.*$/Icon=${_name}/g" "Flatpak/${_app_id}.desktop"
    popd
}

build() {
    pushd "${_name}-${pkgver}"
    # We intentionally leave out the runtime identifier here to keep the fallback auto updater
    dotnet publish \
        "${_name}/${_name}.csproj" \
        -c ${_dotnet_configuration} \
        /p:PublishSingleFile=true \
        /p:IncludeAllContentForSelfExtract=true \
        /p:IncludeNativeLibrariesForSelfExtract=true \
        /p:EnableCompressionInSingleFile=true \
        --self-contained true
    popd
}

package() {
    pushd "${srcdir}/${_name}-${pkgver}"
    install -D -m0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m0755 "${_name}/bin/${_dotnet_configuration}/net${_dotnet_ver}/$(_dotnet_runtime_identifier)/publish/${_name}" \
        "${pkgdir}/usr/bin/${_name}"
    install -D -m0644 "Flatpak/${_app_id}.desktop" \
        "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -D -m0644 "Flatpak/${_app_id}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_default_res}x${_default_res}/apps/${_name}.png"
    popd
}
