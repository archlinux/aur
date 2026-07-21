# Maintainer:

pkgname=flclash
_pkgname=FlClash
pkgver=0.8.94
_flutter=3.44.5
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free"
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-or-later')
depends=('at-spi2-core'
         'cairo'
         'fontconfig'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator'
         'libepoxy'
         'libgcc'
         'libkeybinder3'
         'libstdc++'
         'quickjs-c-bridge'
         'pango')
makedepends=('clang'
             'cmake'
             'fvm'
             'gendesk'
             'git'
             'go'
             'java-environment'
             'ninja'
             'patchelf'
             'rustup')
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/chen08209/Clash.Meta.git")
sha256sums=('48127d31332b1bfff9389d2c06a7f9b7f5ee2ee71955a0e892420edcb084f86e'
            'SKIP')

prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.core/Clash.Meta.url "${srcdir}/Clash.Meta"
    git -c protocol.file.allow=always submodule update

    sed 's|-Werror|-Werror -Wno-deprecated-declarations -Wno-sometimes-uninitialized|' -i linux/CMakeLists.txt

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name}" \
        --categories 'Network' \
        --startupnotify \
        --custom Keywords='FlClash;Clash;ClashMeta;Proxy;'

    fvm use "${_flutter}"
    fvm flutter config --no-analytics
    fvm flutter pub get
    fvm dart pub global activate \
        --source git \
        --git-path packages/flutter_distributor \
        --git-ref FlClash \
        'https://github.com/chen08209/flutter_distributor.git'
}

build() {
    cd "${_pkgname}"
    export PATH="${PATH}:${PUB_CACHE:-${HOME}/.pub-cache}/bin:.fvm/flutter_sdk/bin"
    flutter_distributor package \
        --platform linux \
        --targets zip \
        --flutter-build-args=dart-define=APP_ENV=stable
}

package() {
    cd "${_pkgname}"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 assets/images/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/lib/"lib*_plugin.so
}
