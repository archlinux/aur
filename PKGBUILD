# Maintainer: kevku <kevku@gmx.com>
pkgbase=web-eid
pkgname=("web-eid-native" "web-eid-firefox" "web-eid-chrome")
pkgver=2.3.0.619
_rls_tag=v2.3.0
pkgrel=1
arch=('x86_64')
url="https://www.id.ee/"
license=('MIT')
conflicts=('chrome-token-signing')
depends=('openssl' 'qt6-base' 'qt6-svg' 'pcsclite' 'hicolor-icon-theme')
makedepends=('git' 'qt6-tools' 'gtest' 'gmock' 'cmake')
source=("$pkgbase::git+https://github.com/web-eid/web-eid-app.git?signed#tag=$_rls_tag"
        "web-eid-libelectronic-id::git+https://github.com/web-eid/libelectronic-id.git"
        "web-eid-libpcsc-cpp::git+https://github.com/web-eid/libpcsc-cpp.git"
        "web-eid-libpcsc-mock::git+https://github.com/web-eid/libpcsc-mock.git")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")
validpgpkeys=(
    '1282B0F8809D0DC632C85A3F86B611CE24492160'  # Mart Somermaa https://github.com/mrts.gpg
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma
)

prepare() {
    cd "$srcdir/$pkgbase"
    [[ -d "$pkgbase-build" ]] && rm -r "$pkgbase-build"
    mkdir "$pkgbase-build"

    git submodule init
    git config submodule.lib/libelectronic-id.url $srcdir/web-eid-libelectronic-id
    git -c protocol.file.allow=always submodule update lib/libelectronic-id
    
    cd "$srcdir/$pkgbase/lib/libelectronic-id"
    git submodule init
    git config submodule.lib/libpcsc-cpp.url $srcdir/web-eid-libpcsc-cpp
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$pkgbase/lib/libelectronic-id/lib/libpcsc-cpp"
    git submodule init
    git config submodule.tests/lib/libpcsc-mock.url $srcdir/web-eid-libpcsc-mock
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgbase/$pkgbase-build"
    export BUILD_NUMBER=${pkgver##*.}
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DQT_DIR="/usr/lib/cmake/Qt6"
    cmake --build . --config Release
}

package_web-eid-native() {
    pkgdesc="Web eID native application"
    cd "$srcdir/$pkgbase/$pkgbase-build"
    install -Dm755 "src/app/web-eid"            "$pkgdir/usr/bin/web-eid"
    install -Dm644 "../install/web-eid.desktop" "$pkgdir/usr/share/applications/web-eid.desktop"
    install -Dm644 "../install/appicon_16.png"  "$pkgdir/usr/share/icons/hicolor/16x16/apps/web-eid.png"
    install -Dm644 "../install/appicon_32.png"  "$pkgdir/usr/share/icons/hicolor/32x32/apps/web-eid.png"
    install -Dm644 "../install/appicon_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/web-eid.png"
    install -Dm644 "../install/appicon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/web-eid.png"
    install -Dm644 "../install/appicon_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/web-eid.png"
    install -Dm644 "../LICENSE"                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_web-eid-firefox() {
    pkgdesc="Web eID Firefox extension (signed)"
    depends=(web-eid-native)
    arch=('any')
    cd "$srcdir/$pkgbase/$pkgbase-build"
    install -Dm644 "src/app/eu.webeid.firefox.json" \
                   "$pkgdir/usr/lib/mozilla/native-messaging-hosts/eu.webeid.json"
    install -Dm644 "src/app/{e68418bc-f2b0-4459-a9ea-3e72b6751b07}.xpi" \
                   "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{e68418bc-f2b0-4459-a9ea-3e72b6751b07}.xpi"
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_web-eid-chrome() {
    pkgdesc="Web eID extension from Chrome Web Store"
    depends=(web-eid-native)
    arch=('any')
    cd "$srcdir/$pkgbase/$pkgbase-build"
    install -Dm644 "src/app/eu.webeid.json" "$pkgdir/usr/share/web-eid/eu.webeid.json"
    mkdir -p $pkgdir/opt/google/chrome/extensions
    install -Dm644 "../install/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    ln -sf "/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/opt/google/chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts
    mkdir -p $pkgdir/etc/google-chrome/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/eu.webeid.json"
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/google-chrome/native-messaging-hosts/eu.webeid.json"
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # chromium
    mkdir -p $pkgdir/usr/share/chromium/extensions
    ln -sf "/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/usr/share/chromium/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    mkdir -p $pkgdir/etc/chromium/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/chromium/native-messaging-hosts/eu.webeid.json"
    # microsoft-edge-stable
    mkdir -p $pkgdir/etc/opt/edge/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/opt/edge/native-messaging-hosts/eu.webeid.json"
    mkdir -p $pkgdir/opt/microsoft/msedge/extensions
    ln -sf "/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/opt/microsoft/msedge/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    # from Microsoft Edge Add-ons Store
#    cat << EOF > "gnmckgbandlkacikdndelhfghdejfido.json"
#{
#    "external_update_url": "https://edge.microsoft.com/extensionwebstorebase/v1/crx"
#}
#EOF
#    install -Dm644 "gnmckgbandlkacikdndelhfghdejfido.json" "$pkgdir/opt/microsoft/msedge/extensions/gnmckgbandlkacikdndelhfghdejfido.json"

}
