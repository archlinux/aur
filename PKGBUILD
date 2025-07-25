# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=hiddify
pkgver=2.5.7
_corever=3.1.8
pkgrel=2
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc."
arch=('x86_64')
url="https://github.com/hiddify/hiddify-app"
license=('GPL-3.0-or-later')
depends=('at-spi2-core' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'pango')
makedepends=('clang' 'cmake' 'fvm' 'gendesk' 'go' 'ninja' 'patchelf')
conflicts=("${pkgname}-next")
replaces=("${pkgname}-next")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}-core-${_corever}.tar.gz::https://github.com/hiddify/hiddify-core/archive/refs/tags/v${_corever}.tar.gz"
    "https://github.com/hiddify/hiddify-app/commit/06a542478e1284a307dedd08ba7f461e2bacfa8d.patch")
sha256sums=('6accdce090f84a2624b92c7d6cc752b3163511f6df8882a21f38d942c61e50ef'
            '02c8db701ed3b6fc7e5ccc91d444edb6fa3ca8faa143cd2a2678f4f154eafd8d'
            'c36d6a8db1d5d9dd9d516ddcf6fc6b51bb7c29af5a82c5dac93b1688fdbbb897')

prepare() {
    cd "${pkgname}-app-${pkgver}"
    patch -Np1 -i "${srcdir}/06a542478e1284a307dedd08ba7f461e2bacfa8d.patch"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --genericname "${pkgname^}" \
        --categories 'Network' \
        --startupnotify \
        --custom Keywords='Hiddify;Proxy;VPN;V2ray;Nekoray;Xray;Psiphon;OpenVPN;'

    sed 's/-Wall -Werror/-Wall -Werror -Wno-error=deprecated-declarations/' -i linux/CMakeLists.txt
    sed 's|./hiddify.png|/usr/share/pixmaps/hiddify.png|' -i linux/my_application.cc

    fvm install 3.24.3
    fvm global 3.24.3
    fvm flutter config --no-analytics
    fvm flutter pub get
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm dart run slang
}

build() {
    cd "${srcdir}/${pkgname}-core-${_corever}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    go build -buildmode=c-shared \
        -ldflags="-linkmode=external -w -s" \
        -tags="with_gvisor,with_quic,with_wireguard,with_ech,with_utls,with_clash_api,with_grpc" \
        -o lib/libcore.so \
        ./custom

    CGO_LDFLAGS="${CGO_LDFLAGS} ./lib/libcore.so" go build -buildmode=pie \
        -ldflags="-linkmode=external -w -s" \
        -tags="with_gvisor,with_quic,with_wireguard,with_ech,with_utls,with_clash_api,with_grpc" \
        -o HiddifyCli \
        ./cli/bydll

    cd "${srcdir}/${pkgname}-app-${pkgver}"
    ln -s "${srcdir}/${pkgname}-core-${_corever}" libcore/bin
    fvm flutter build linux --release --target=lib/main_prod.dart
}

package() {
    cd "${pkgname}-app-${pkgver}"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/images/source/ic_launcher_border.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/lib"/lib*_plugin.so
}
