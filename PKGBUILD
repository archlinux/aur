# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=flclash
_name=FlClash
pkgver=0.9.3
_flutter=3.47.6
pkgrel=1
pkgdesc="Multi-platform proxy client based on ClashMeta"
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-or-later')
depends=('at-spi2-core'
         'cairo'
         'fontconfig'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator'
         'libepoxy'
         'libgcc'
         'libstdc++'
         'libx11'
         'pango')
makedepends=('chrpath' 'clang' 'cmake' 'fvm' 'gendesk' 'git' 'go' 'ninja' 'rustup')
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/chen08209/Clash.Meta.git"
        "git+https://github.com/chen08209/prism_ui.git")
sha256sums=('dd2d88d78843a1bc6971ab8de380fca345e9e51cd6e16924867f2a45b0fa48a0'
            'SKIP'
            'SKIP')

prepare() {
    cd "${_name}"
    git submodule init
    git config submodule.core/Clash.Meta.url "${srcdir}/Clash.Meta"
    git config submodule.plugins/prism_ui.url "${srcdir}/prism_ui"
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
}

build() {
    cd "${_name}"
    fvm flutter build linux --release --dart-define APP_ENV=stable
    chrpath --replace "/usr/lib/${pkgname}/lib" build/linux/x64/release/bundle/lib/*plugin.so
}

package() {
    cd "${_name}"
    install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/images/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
