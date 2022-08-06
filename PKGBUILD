# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Maintainer: <daihydai875939260 at 163 dot com>

pkgname=("iease-music-daihy-git" "iease-music-daihy-electron-git")
pkgver=1.0.0.r134.g280ad50
pkgrel=1
pkgdesc='网易云音乐第三方(daihy fork)'
license=('MIT')
depends=('gconf' 'libnotify' 'nss' 'libxss' 'libappindicator-gtk3' 'libxtst')
makedepends=('yarn' 'git' 'jq')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/daihy8759/ieaseMusic"
provides=('iease-music' 'iease-music-daihy')
conflicts=('iease-music' 'iease-music-daihy')
source=("ieaseMusic::git+${url}" "iease-music.desktop" "iease-music")
sha256sums=('SKIP'
            'e90c3f0a5b153a7e8ad261c627a06bc6a7f4df9bd7cbf425e57cf7803c7bb4c8'
            '5d51192adb5a78dfb4ba9b9eaafe22d443c686b32b0564f3c6990ffaacf12f79')
_electron=electron18

pkgver(){
    cd "${srcdir}/ieaseMusic"
    echo $(jq .version package.json --raw-output).r$(git rev-list --count HEAD).g$(git describe --always)
}
build(){
    cd "${srcdir}/ieaseMusic"
    yarn install
    yarn run build --dir
}
package_iease-music-daihy-git(){
    case ${CARCH} in
        "x86_64")
            _arch="-";;
        "aarch64")
            _arch="-arm64-";;
        "i686")
            _arch="-ia32-";;
        "*")
            _arch="-${CARCH}-";;
    esac
    mkdir -p "${pkgdir}/opt/iease-music"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/ieaseMusic/release"
    cp -a linux${_arch}unpacked/* "${pkgdir}/opt/iease-music"
    install -Dm644 "${srcdir}/ieaseMusic/resources/background@2x.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/iease-music.png"
    install -Dm644 "${srcdir}/iease-music.desktop" "${pkgdir}/usr/share/applications/iease-music.desktop"
    ln -s "/opt/iease-music/iease-music" "${pkgdir}/usr/bin/iease-music"
}
package_iease-music-daihy-electron-git(){
    conflicts+=("iease-music-daihy-electron")
    provides+=("iease-music-daihy-electron")
    depends+=("${_electron}")
    pkgdesc+=' with system electron'
    case ${CARCH} in
        "x86_64")
            _arch="-";;
        "aarch64")
            _arch="-arm64-";;
        "i686")
            _arch="-ia32-";;
        "*")
            _arch="-${CARCH}-";;
    esac
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/ieaseMusic/release/linux${_arch}unpacked"
    install -Dm644 "resources/app.asar" "${pkgdir}/usr/lib/iease-music/iease-music.asar"
    install -Dm644 "${srcdir}/ieaseMusic/resources/background@2x.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/iease-music.png"
    install -Dm644 "${srcdir}/iease-music.desktop" "${pkgdir}/usr/share/applications/iease-music.desktop"
    install -Dm755 "${srcdir}/iease-music" "${pkgdir}/usr/bin/iease-music"
    sed -i "s/electron /${_electron} /" "${pkgdir}/usr/bin/iease-music"
}
