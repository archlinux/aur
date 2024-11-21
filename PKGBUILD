# Maintainer: ZhangHua <zhanghuadedn at gmail dot com> 

pkgname=("ariang-native-git" "ariang-native-electron-git")
pkgver=1.3.7.r10.g1c60cd5
pkgrel=1
pkgdesc="A better aria2 desktop frontend than AriaNg."
license=("MIT")
depends=("shared-mime-info" "hicolor-icon-theme")
makedepends=("npm" "git" "imagemagick" "jq")
arch=("x86_64" "aarch64" "i686")
url="https://github.com/mayswind/AriaNg-Native"
provides=("ariang-native")
conflicts=("ariang-native")
source=(
    "git+${url}.git#branch=master"
    "ariang-native"
    "ariang-native.desktop")
sha256sums=('SKIP'
            '2b6381f00d83250adc398c4db273ac47104c459c55b3191be908b108d8ae277d'
            '56575bb86f952a0fb3f266d5e5824eb37b14e3015f99fae53950eef2f183d9ad')
_electron=electron22

pkgver(){
    cd "${srcdir}/AriaNg-Native"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/AriaNg-Native"
    npm install
    main_depends=$(jq -r .mainDependencies[] package.json) && \
        npm install --save=false ${main_depends[@]}
    npm run generate-build-json
    npm run copy-main-dependencies
    npm run copy-app-dependencies
    PATH=node_modules/.bin:$PATH electron-builder --linux --dir
    cd assets
    magick AriaNg.ico[0] ariang-native.png
    magick AriaNg_Metalink.ico[0] ariang-native-metalink.png
    magick AriaNg_Torrent.ico[0] ariang-native-torrent.png
}
package_ariang-native-git(){
    depends+=(
        # Depends from aur/electron22
        "c-ares" "gcc-libs" "glibc" "gtk3" "libgtk-3.so" "libevent" "nss" "wayland"
        "zlib" "fontconfig" "woff2" "aom" "brotli" "libjpeg" "icu" "dav1d" "flac"
        "snappy" "libdrm" "libxml2" "ffmpeg" "libwebp" "minizip" "opus" "harfbuzz"
        "jsoncpp" "libxslt" "libpng" "freetype2"
    )
    optdepends+=(
        "kde-cli-tools"
        "libappindicator-gtk3"
        "pipewire"
        "qt5-base"
        "trash-cli"
        "xdg-utils"
    )

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
    local id
    id="$(jq -r .appId package.json)"
    mkdir -p "${pkgdir}/opt/ariang-native" "${pkgdir}/usr/bin"
    cp -a "dist/linux${_arch}unpacked/." \
        "${pkgdir}/opt/ariang-native"
    ln -s /opt/ariang-native/ariang-native \
        "${pkgdir}/usr/bin/ariang-native"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${id}.png"

    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-metalink.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-metalink+xml.png"
    ln -s application-metalink+xml.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-metalink4+xml.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-torrent.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-bittorrent.png"
    install -Dm644 "${srcdir}/ariang-native.desktop" \
        "${pkgdir}/usr/share/applications/${id}.desktop"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
package_ariang-native-electron-git(){
    conflicts+=("ariang-native-electron")
    provides+=("ariang-native-electron")
    depends+=("${_electron}" "bash")
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
    cd "${srcdir}/AriaNg-Native"
    local id
    id="$(jq -r .appId package.json)"
    install -Dm644 \
        "${srcdir}/AriaNg-Native/dist/linux${_arch}unpacked/resources/app.asar" \
        "${pkgdir}/usr/lib/ariang-native/ariang-native.asar"
    install -Dm755 "${srcdir}/ariang-native" \
        "${pkgdir}/usr/bin/ariang-native"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${id}.png"

    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-metalink.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-metalink+xml.png"
    ln -s application-metalink+xml.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-metalink4+xml.png"
    install -Dm644 "${srcdir}/AriaNg-Native/assets/ariang-native-torrent.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-bittorrent.png"
    install -Dm644 "${srcdir}/ariang-native.desktop" \
        "${pkgdir}/usr/share/applications/${id}.desktop"
    sed -i "s/^electron[0-9]*/${_electron}/" "${pkgdir}/usr/bin/ariang-native"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
