# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=playboy-git
_pkgname=Playboy
pkgver=0.25.4.r1.g453d6c2
pkgrel=1
pkgdesc="A libmpv based media player with Material 3 design."
arch=('any')
url="https://github.com/Playboy-Player/Playboy"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'mpv'
)
makedepends=(
    'flutter'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo;" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export PUB_CACHE="${srcdir}/.pub-cache"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export PUB_HOSTED_URL="https://pub.flutter-io.cn"
        export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
        sed -i -e "
            s/pub.dev/pub.flutter-io.cn/g
            s/github.com/github.moeyy.xyz\/https:\/\/github.com/g
        " {pubspec.lock,pubspec.yaml}
    fi
    sed -i "s/DialogTheme/DialogThemeData/g" lib/backend/utils/theme_utils.dart
    flutter pub get
    dart run whisper4dart:setup --prebuilt --verbosity all
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export FLUTTER_BUILD_MODE=release
    export FLUTTER_TARGET_PLATFORM=linux
    export FLUTTER_ENGINE_SWITCHES="--disable-egl"
    flutter build linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/build/linux/"*"/release/bundle/${pkgname%-git}" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/build/linux/"*/release/bundle/{data,lib} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/res/images/icon512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}