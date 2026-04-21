# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=hiddify
pkgver=4.1.1
_flutter_ver=3.38.5
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc."
arch=('x86_64')
url="https://github.com/hiddify/hiddify-app"
license=('GPL-3.0-or-later')
depends=('at-spi2-core'
         'cairo'
         'curl'
         'fontconfig'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator'
         'libepoxy'
         'libgcc'
         'libstdc++'
         'pango')
makedepends=('clang' 'cmake' 'fvm' 'gendesk' 'git' 'go' 'ninja' 'patchelf')
conflicts=("${pkgname}-next")
replaces=("${pkgname}-next")
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/hiddify/hiddify-core.git"
        "git+https://github.com/hiddify/hiddify-sing-box.git"
        "git+https://github.com/hiddify/ray2sing.git"
        "git+https://github.com/hiddify/psiphon-quic-go.git"
        "git+https://github.com/hiddify/psiphon-tls.git"
        "git+https://github.com/hiddify/tailscale.git"
        "git+https://github.com/hiddify/wireguard-go.git")
sha256sums=('fc53061ec78cfbae6a4196e41116699074ab5948aea9c3eeb43f67b4223798be'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    repo="${pkgname}-app"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.hiddify-core.url "${srcdir}/hiddify-core"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    repo="${pkgname}-app/${pkgname}-core"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.hiddify-sing-box.url "${srcdir}/hiddify-sing-box"
    git -C "${repo}" config submodule.ray2sing.url "${srcdir}/ray2sing"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    repo="${pkgname}-app/${pkgname}-core/${pkgname}-sing-box"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.replace/psiphon-quic-go.url "${srcdir}/psiphon-quic-go"
    git -C "${repo}" config submodule.replace/psiphon-tls.url "${srcdir}/psiphon-tls"
    git -C "${repo}" config submodule.replace/tailscale.url "${srcdir}/tailscale"
    git -C "${repo}" config submodule.replace/wireguard-go.url "${srcdir}/wireguard-go"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    cd "${pkgname}-app"
    sed 's|-Wall -Werror|-Wall -Werror -Wno-error=deprecated-declarations|' -i linux/CMakeLists.txt
    sed 's|./hiddify.png|/usr/share/pixmaps/hiddify.png|' -i linux/my_application.cc

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --genericname "${pkgname^}" \
        --categories 'Network' \
        --startupnotify \
        --custom Keywords='Hiddify;Proxy;VPN;V2ray;Nekoray;Xray;Psiphon;OpenVPN;'

    fvm install "${_flutter_ver}"
    fvm global "${_flutter_ver}"
    fvm flutter config --no-analytics
    fvm flutter pub get
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm dart run slang
}

build() {
    cd "${pkgname}-app/${pkgname}-core"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    export GOTOOLCHAIN="go1.25.6"
    TAGS='with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api,with_grpc,with_awg,tfogo_checklinkname0,with_conntrack'
    go build \
        -buildmode c-shared \
        -ldflags "-linkmode=external -w -s -checklinkname=0" \
        -tags "${TAGS}" \
        -o bin/lib/hiddify-core.so \
        ./platform/desktop
    CGO_LDFLAGS+=" ./bin/lib/hiddify-core.so"
    go build \
        -buildmode pie \
        -ldflags "-linkmode=external -w -s" \
        -tags "${TAGS}" \
        -o bin/HiddifyCli \
        ./cmd/bydll

    cd ..
    fvm flutter build linux --release --target=lib/main_prod.dart
}

package() {
    cd "${pkgname}-app"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/images/source/ic_launcher_border.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 linux/packaging/app.hiddify.com.appdata.xml -t "${pkgdir}/usr/share/metainfo"
    patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/lib/"lib*_plugin.so
    patchelf --replace-needed ./bin/lib/hiddify-core.so "/usr/lib/${pkgname}/lib/hiddify-core.so" "${pkgdir}/usr/lib/${pkgname}/HiddifyCli"
}
