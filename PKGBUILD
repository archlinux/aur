# Maintainer:

pkgname=flclash
_name=FlClash
pkgver=0.8.97
_flutter=3.47.3
pkgrel=1
pkgdesc="Multi-platform proxy client based on ClashMeta"
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
         'libstdc++'
         'pango')
makedepends=('chrpath' 'clang' 'cmake' 'fvm' 'gendesk' 'git' 'go' 'ninja' 'rustup')
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/chen08209/Clash.Meta.git")
sha256sums=('1df134396441d8dc695b35f572d906d50c8ed5d8a285ea8afcaed0393bdd2fe4'
            'SKIP')

prepare() {
    cd "${_name}"
    git submodule init
    git config submodule.core/Clash.Meta.url "${srcdir}/Clash.Meta"
    git -c protocol.file.allow=always submodule update

    sed -i 's|-Werror|-Wno-error|' linux/CMakeLists.txt

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name}" \
        --categories 'Network' \
        --mimetypes 'x-scheme-handler/clash;x-scheme-handler/clashmeta;x-scheme-handler/flclash' \
        --startupnotify \
        --custom Keywords='FlClash;Clash;ClashMeta;Proxy;'

    fvm use "${_flutter}"
    fvm flutter --disable-analytics
    fvm flutter pub get
    fvm dart pub global activate \
        --source git \
        --git-path packages/flutter_distributor \
        --git-ref 'v0.6.11-flclash.2' \
        'https://github.com/chen08209/flutter_distributor.git'
}

build() {
    cd "${_name}"
    PATH+=":${PUB_CACHE:-${HOME}/.pub-cache}/bin:.fvm/flutter_sdk/bin"
    flutter_distributor package \
        --platform linux \
        --targets zip \
        --build-dart-define APP_ENV=stable

    chrpath --replace "/usr/lib/${pkgname}/lib" build/linux/x64/release/bundle/lib/*plugin.so
}

package() {
    cd "${_name}"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 assets/images/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
