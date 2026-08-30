# Maintainer:

pkgname=flclash
_name=FlClash
pkgver=0.8.96
_flutter=3.44.9
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
         'libkeybinder3'
         'libstdc++'
         'pango')
makedepends=('chrpath' 'clang' 'cmake' 'fvm' 'gendesk' 'git' 'go' 'ninja' 'rustup')
options=('!lto')
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/chen08209/Clash.Meta.git")
sha256sums=('663f2e33403b4862d5d7b7dd0a3cce64037d3bb5de4ede903ff723321c8b2ce9'
            'SKIP')

prepare() {
    cd "${_name}"
    git submodule init
    git config submodule.core/Clash.Meta.url "${srcdir}/Clash.Meta"
    git -c protocol.file.allow=always submodule update

    sed -i 's|-Werror|-Wno-error|' linux/CMakeLists.txt
    sed -e 's|final file = File(path);|final file = File(path.path);|' \
        -e 's|return path;|return path?.path;|' \
        -i lib/common/picker.dart

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name}" \
        --categories 'Network' \
        --startupnotify \
        --custom Keywords='FlClash;Clash;ClashMeta;Proxy;'

    fvm use "${_flutter}"
    fvm flutter --disable-analytics
    fvm flutter pub get
    fvm dart pub global activate \
        --source git \
        --git-path packages/flutter_distributor \
        --git-ref FlClash \
        'https://github.com/chen08209/flutter_distributor.git'
}

build() {
    cd "${_name}"
    export PATH="${PATH}:${PUB_CACHE:-${HOME}/.pub-cache}/bin:.fvm/flutter_sdk/bin"
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
