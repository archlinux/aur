# Maintainer: 5hastl5 <https://github.com/5hastl5>

pkgname=hiddify-ext-git
pkgver=4.1.2.ext
pkgrel=1
pkgdesc="Hiddify client heavily extended and optimized for Happ integration"
arch=('x86_64')
url="https://github.com/5hastl5/Hiddify-ext"
license=('GPL-3.0-or-later')
depends=('at-spi2-core' 'cairo' 'curl' 'fontconfig' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'libgcc' 'libstdc++' 'pango')
makedepends=('clang' 'cmake' 'flutter' 'git' 'go' 'ninja' 'patchelf')
provides=('hiddify-ext')
conflicts=('hiddify-ext-bin' 'hiddify-custom-git')

source=("hiddify-ext::git+https://github.com/5hastl5/Hiddify-ext.git"
        "git+https://github.com/hiddify/hiddify-core.git"
        "git+https://github.com/hiddify/hiddify-sing-box.git"
        "git+https://github.com/hiddify/ray2sing.git"
        "git+https://github.com/hiddify/psiphon-quic-go.git"
        "git+https://github.com/hiddify/psiphon-tls.git"
        "git+https://github.com/hiddify/tailscale.git"
        "git+https://github.com/hiddify/wireguard-go.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    repo="hiddify-ext"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.hiddify-core.url "${srcdir}/hiddify-core"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    repo="hiddify-ext/hiddify-core"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.hiddify-sing-box.url "${srcdir}/hiddify-sing-box"
    git -C "${repo}" config submodule.ray2sing.url "${srcdir}/ray2sing"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    repo="hiddify-ext/hiddify-core/hiddify-sing-box"
    git -C "${repo}" submodule init
    git -C "${repo}" config submodule.replace/psiphon-quic-go.url "${srcdir}/psiphon-quic-go"
    git -C "${repo}" config submodule.replace/psiphon-tls.url "${srcdir}/psiphon-tls"
    git -C "${repo}" config submodule.replace/tailscale.url "${srcdir}/tailscale"
    git -C "${repo}" config submodule.replace/wireguard-go.url "${srcdir}/wireguard-go"
    git -C "${repo}" -c protocol.file.allow=always submodule update

    cd "hiddify-ext"
    
    sed 's|-Wall -Werror|-Wall -Werror -Wno-error=deprecated-declarations|' -i linux/CMakeLists.txt || true

    flutter config --no-analytics
    flutter pub get
    dart run build_runner build --delete-conflicting-outputs
}

build() {
    cd "hiddify-ext/hiddify-core"
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
    
    flutter build linux --release
}

package() {
    cd "hiddify-ext"
    
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    
    ln -s "/usr/lib/${pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify-ext"
    
    cat <<EOF > "${pkgdir}/usr/share/applications/hiddify-ext.desktop"
[Desktop Entry]
Version=4.1.2.ext
Type=Application
Name=Hiddify Ext
Comment=Hiddify extended version
Exec=hiddify-ext
Icon=hiddify-ext
Terminal=false
Categories=Network;Proxy;
EOF

    if [ -f assets/images/logo.png ]; then
        install -Dm644 assets/images/logo.png "${pkgdir}/usr/share/pixmaps/hiddify-ext.png"
    else
        install -Dm644 assets/images/source/ic_launcher_border.png "${pkgdir}/usr/share/pixmaps/hiddify-ext.png"
    fi
    
    if [ -f hiddify-core/bin/HiddifyCli ]; then
        install -Dm755 hiddify-core/bin/HiddifyCli -t "${pkgdir}/usr/lib/${pkgname}/"
    fi

    patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/lib/"lib*_plugin.so || true
    
    if [ -f "${pkgdir}/usr/lib/${pkgname}/HiddifyCli" ]; then
        patchelf --replace-needed ./bin/lib/hiddify-core.so "/usr/lib/${pkgname}/lib/hiddify-core.so" "${pkgdir}/usr/lib/${pkgname}/HiddifyCli" || true
    fi
}
