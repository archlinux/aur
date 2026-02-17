# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
_name=org.nickvision.tubeconverter
pkgver=2026.2.4
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('aria2'
         'bash'
         'dotnet-runtime'
         'ffmpeg'
         'glibc'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'libgcc'
         'libstdc++'
         'python'
         'yt-dlp')
makedepends=('blueprint-compiler' 'dotnet-sdk')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('48d8f76c1e0cc9a222e9e372de225829e80663b76af0282adb1ab1e0e37d9b3e')

prepare() {
    cd "${pkgname^}-${pkgver}/resources/linux"
    for file in "${_name}"{,.desktop,.service}.in; do
        sed -e "s|@APP_ID@|${_name}|g" \
            -e "s|@LIB_DIR@|/usr/lib/${_name}|g" \
            -e "s|@OUTPUT_NAME@|Nickvision.Parabolic.GNOME|g" \
            -i "${file}"
    done
}

build() {
    cd "${pkgname^}-${pkgver}"
    dotnet publish \
        --configuration Release \
        --runtime linux-x64 \
        -p:PublishReadyToRun=true \
        -p:SelfContained=false \
        Nickvision.Parabolic.GNOME/Nickvision.Parabolic.GNOME.csproj
}

package() {
    cd "${pkgname^}-${pkgver}"
    install -d "${pkgdir}/usr/lib"
    cp -r Nickvision.Parabolic.GNOME/bin/Release/net*/linux-x64/publish "${pkgdir}/usr/lib/${_name}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd resources
    install -Dm644 "${_name}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${_name}-devel.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${_name}-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"

    cd linux
    install -Dm755 "${_name}.in" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "${_name}.desktop.in" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${_name}.service.in" "${pkgdir}/usr/share/dbus-1/services/${_name}.service"
    install -Dm644 "${_name}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"

}
