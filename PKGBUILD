# Maintainer: matellush <matellu DOT sh AT proton DOT me>

pkgname=wheelwizard-flatpak
_pkgname=wheelwizard
_name=WheelWizard
pkgver=2.0.1
pkgrel=1
pkgdesc="${_name} – Mario Kart Mod Manager & Retro Rewind Auto Updater (for Flatpak Dolphin)"
arch=('x86_64' 'aarch64')
url="https://github.com/Team${_name}/${_name}"
license=('CC-BY-NC-SA-4.0')
_dotnet_ver=8.0
_dotnet_configuration=Release
_default_res=256
depends=('gcc-libs'
         'glibc'
	 'hicolor-icon-theme'
         'zlib')
makedepends=("dotnet-sdk-${_dotnet_ver}")
provides=(${_pkgname})
conflicts=(${_pkgname})

source=("${_name}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
b2sums=('adab557e22eb376adcf3ed2424823c95f4425791176742b298964171361ad6fb0072d91d29a4ddd926eb48a9126f5e2dec8944e1193fcd961c8431d51c968aa2'
        'abceebf7e6ac7952e35e0a8e6f175e39b539c04f04747671fbc6709cd1936f1c81cee34b71afc1296e32f2bb314d752e3593dacbfd50cd64bba60bbc87324b33'
        '0b67541aefd0806b07b9e6839a4e637322c531bdec0079f0a9c4227fa72ca4146d79649d0a9aaed1e209fdde6989ca42bd567e40598f8883954e202be0ab497d')

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
    # Disable the WheelWizard installation's auto updater
    sed -i 's/autoUpdaterPlatform = new AutoUpdaterLinux();/autoUpdaterPlatform = new AutoUpdaterFallback();/g' \
        'WheelWizard/Services/Installation/AutoUpdater/AutoUpdater.cs'
    # Also authenticate flatpak installation using PolicyKit for users not in `wheel` for system Flatpak `install`
    sed -i 's/RunProcessWithProgressAsync("flatpak", "/RunProcessWithProgressAsync("pkexec", "flatpak --system /g' \
        'WheelWizard/Services/Settings/LinuxDolphinInstaller.cs'
    popd
}

build() {
    pushd "${_name}-${pkgver}"
    dotnet publish \
        -r $(_dotnet_runtime_identifier) \
        -c ${_dotnet_configuration} \
        /p:PublishSingleFile=true \
        /p:IncludeAllContentForSelfExtract=true \
        /p:IncludeNativeLibrariesForSelfExtract=true \
        /p:EnableCompressionInSingleFile=true \
        --self-contained true
    popd
}

package() {
    depends=('flatpak' "dotnet-runtime-${_dotnet_ver}")

    pushd "${srcdir}/${_name}-${pkgver}"
    install -D -m0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -D -m0755 "${_name}/bin/${_dotnet_configuration}/net${_dotnet_ver}/$(_dotnet_runtime_identifier)/publish/${_name}" "${pkgdir}/usr/bin/${_pkgname}"
    popd

    install -D -m0644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}/${_pkgname}.desktop"
    install -D -m0644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_default_res}x${_default_res}/apps/${_pkgname}.png"
}


