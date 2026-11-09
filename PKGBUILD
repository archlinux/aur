# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=hiddify
pkgver=5.5.5
_flutter=3.38.5
pkgrel=1
pkgdesc="Multi-platform proxy client based on Sing-box universal proxy tool-chain"
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
        "git+https://github.com/hiddify/amneziawg-go.git"
        "git+https://github.com/hiddify/gvisor.git"
        "git+https://github.com/hiddify/psiphon-quic-go.git"
        "git+https://github.com/hiddify/psiphon-tls.git"
        "git+https://github.com/hiddify/sing-mux.git"
        "git+https://github.com/hiddify/sing-tun.git"
        "git+https://github.com/hiddify/sing-vmess.git"
        "git+https://github.com/hiddify/soar.git"
        "git+https://github.com/hiddify/tailscale.git"
        "git+https://github.com/hiddify/wireguard-go.git"
        "git+https://github.com/hiddify/MasterDnsVPN.git")
sha256sums=('8e4f23e5c5756d8ca59c9cb99b4a9f49be3081f27ef8ab0eedb558f577d33aa2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
    git -C "${repo}" config submodule.replace/amneziawg-go.url "${srcdir}/amneziawg-go"
    git -C "${repo}" config submodule.replace/gvisor.url "${srcdir}/gvisor"
    git -C "${repo}" config submodule.replace/psiphon-quic-go.url "${srcdir}/psiphon-quic-go"
    git -C "${repo}" config submodule.replace/psiphon-tls.url "${srcdir}/psiphon-tls"
    git -C "${repo}" config submodule.replace/sing-mux.url "${srcdir}/sing-mux"
    git -C "${repo}" config submodule.replace/sing-tun.url "${srcdir}/sing-tun"
    git -C "${repo}" config submodule.replace/sing-vmess.url "${srcdir}/sing-vmess"
    git -C "${repo}" config submodule.replace/soar.url "${srcdir}/soar"
    git -C "${repo}" config submodule.replace/tailscale.url "${srcdir}/tailscale"
    git -C "${repo}" config submodule.replace/wireguard-go.url "${srcdir}/wireguard-go"
    git -C "${repo}" config submodule.replace/MasterDnsVPN.url "${srcdir}/MasterDnsVPN"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    cd "${pkgname}-app"
    sed -i 's|-Werror|-Wno-error|' linux/CMakeLists.txt
    sed -i 's|./hiddify.png|/usr/share/pixmaps/hiddify.png|' linux/my_application.cc

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --genericname "${pkgname^}" \
        --categories 'Network' \
        --startupnotify \
        --custom 'Keywords=Hiddify;Proxy;VPN;V2ray;Nekoray;Xray;Psiphon;OpenVPN;AntiCensorship;'

    fvm use "${_flutter}"
    fvm flutter --disable-analytics
    fvm dart run build_runner build --delete-conflicting-outputs
}

build() {
    cd "${pkgname}-app"
    (
        cd "${pkgname}-core"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-trimpath -mod=readonly -modcacherw"
        local ldflags=(
            -linkmode=external
            -checklinkname=0
            -buildid=
            -X github.com/hiddify/hiddify-core/v2/hcore/buildid.ID="$(uuidgen 2>/dev/null)"
            -X github.com/hiddify/hiddify-core/v2/hcommon/constants.Version="$(git describe --tags --match 'v[0-9]*')"
            -X github.com/sagernet/sing-box/constant.Version="$(cd hiddify-sing-box && go run ./cmd/internal/read_tag/ --nightly)"
        )
        local tags="$(make NAIVE=0 print-CLI_TAGS)"
        go build -buildmode c-shared -ldflags "${ldflags[*]}" -tags "${tags}" -o bin/lib/hiddify-core.so ./platform/desktop
        CGO_LDFLAGS+=" ./bin/lib/hiddify-core.so"
        go build -buildmode pie -ldflags "${ldflags[*]}" -o bin/HiddifyCli ./cmd/bydll
    )
    fvm flutter build linux --release --target lib/main_prod.dart

    cd build/linux/x64/release/bundle
    patchelf --set-rpath "/usr/lib/${pkgname}/lib" lib/*plugin.so
    patchelf --replace-needed ./bin/lib/hiddify-core.so "/usr/lib/${pkgname}/lib/hiddify-core.so" HiddifyCli
}

package() {
    cd "${pkgname}-app"
    install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/images/source/ic_launcher_border.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 linux/packaging/app.hiddify.com.appdata.xml -t "${pkgdir}/usr/share/metainfo"
}
