# Maintainer: ZhangHua <zhanghuadedn at gmail dot com> 

pkgname=("ariang-native-git" "ariang-native-electron-git")
pkgver=1.3.6.r5.g84987fe
pkgrel=1
pkgdesc="A better aria2 desktop frontend than AriaNg."
license=("MIT")
depends=("shared-mime-info")
makedepends=("npm" "git" "imagemagick" "openssh" "jq")
arch=("x86_64" "aarch64" "i686")
url="https://github.com/mayswind/AriaNg-Native"
provides=("ariang-native")
conflicts=("ariang-native")
source=(
    "git+${url}.git#branch=master"
    "ariang-native"
    "ariang-native.desktop"
    "ariang-native.xml")
sha256sums=('SKIP'
            '2b6381f00d83250adc398c4db273ac47104c459c55b3191be908b108d8ae277d'
            '5fec0d94896e467512ea2e5a13c9dcbfb59d3ab825754a0b4bbf70968759dca8'
            '30624966f2b4f9499c99ab69f855b4e6bf516e5fd4388c5c82a845fff95e0f98')
_electron=electron22

pkgver(){
    cd "${srcdir}/AriaNg-Native"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/AriaNg-Native"
    npm install
    main_depends=$(jq .mainDependencies[] package.json | sed ':a;N;s/\n/ /g;ta;' | sed 's/"//g') && \
        npm install --save=false ${main_depends[*]}
    npm run generate-build-json
    npm run copy-main-dependencies
    npm run copy-app-dependencies
    ./node_modules/.bin/electron-builder --linux --dir
    cd assets
    convert AriaNg.ico[0] ariang-native.png
    convert AriaNg_Metalink.ico[0] ariang-native-metalink.png
    convert AriaNg_Torrent.ico[0] ariang-native-torrent.png
}
package_ariang-native-git(){
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
    cd "${srcdir}/AriaNg-Native"
    mkdir -p "${pkgdir}/opt/ariang-native"
    mkdir -p "${pkgdir}/usr/bin"
    cp -a dist/linux${_arch}unpacked/* \
        "${pkgdir}/opt/ariang-native"
    ln -s /opt/ariang-native/ariang-native \
        "${pkgdir}/usr/bin/ariang-native"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-metalink.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native-metalink.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-torrent.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native-torrent.png"
    install -Dm644 "${srcdir}/ariang-native.desktop" \
        "${pkgdir}/usr/share/applications/ariang-native.desktop"
    install -Dm644 "${srcdir}/ariang-native.xml" \
        "${pkgdir}/usr/share/mime/packages/ariang-native.xml"
}
package_ariang-native-electron-git(){
    conflicts+=("ariang-native-electron")
    provides+=("ariang-native-electron")
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
    install -Dm644 \
        "${srcdir}/AriaNg-Native/dist/linux${_arch}unpacked/resources/app.asar" \
        "${pkgdir}/usr/lib/ariang-native/ariang-native.asar"
    install -Dm755 "${srcdir}/ariang-native" \
        "${pkgdir}/usr/bin/ariang-native"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-metalink.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native-metalink.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-torrent.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ariang-native-torrent.png"
    install -Dm644 "${srcdir}/ariang-native.desktop" \
        "${pkgdir}/usr/share/applications/ariang-native.desktop"
    install -Dm644 "${srcdir}/ariang-native.xml" \
        "${pkgdir}/usr/share/mime/packages/ariang-native.xml"
    sed -i "s/^electron[0-9]*/${_electron}/" "${pkgdir}/usr/bin/ariang-native"
}
