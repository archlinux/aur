# Maintainer: matellush <202132988+matellush@users.noreply.github.com>

pkgname=wheelwizard
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.3.3
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
b2sums=('5c11f3da5d9297d8622b68e48db892146b24ae432c1a449183a1c6101ac4d52a0836d3f21a01186a506f62b1da9872a2ecb352aded372e5085bd7ea7cef01f3d')

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
