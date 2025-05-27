# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Base: kevku <kevku@gmx.com>
pkgbase=web-eid-git
pkgname=("web-eid-native-git" "web-eid-firefox-git" "web-eid-chrome-git")
pkgver=2.6.0.r10.geee1522
_ext_ver=2.2.1
pkgrel=1
arch=('x86_64')
url="https://www.id.ee/"
license=('MIT')
conflicts=('chrome-token-signing' 'web-eid-native' 'web-eid-firefox' 'web-eid-chrome')
provides=('web-eid-native' 'web-eid-firefox' 'web-eid-chrome')
depends=('pcsclite' 'ccid' 'openssl' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gtest' 'qt6-tools')
source=("$pkgbase::git+https://github.com/web-eid/web-eid-app.git"
        "web-eid-libelectronic-id::git+https://github.com/web-eid/libelectronic-id.git"
        "https://addons.mozilla.org/firefox/downloads/file/4079746/web_eid_webextension-$_ext_ver.xpi")
noextract=("web_eid_webextension-$_ext_ver.xpi")
sha256sums=('SKIP'
            'SKIP'
            '392666581a3e71130307eb94f9010b4ca843829f592db9a093ad68fc00ca59ba')

pkgver() {
    cd "$srcdir/$pkgbase"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgbase"
    [[ -d "$pkgbase-build" ]] && rm -r "$pkgbase-build"
    mkdir "$pkgbase-build"

    git submodule init
    git config submodule.lib/libelectronic-id.url $srcdir/web-eid-libelectronic-id
    git -c protocol.file.allow=always submodule update lib/libelectronic-id
}

build() {
    cd "$srcdir/$pkgbase/$pkgbase-build"
    local _git_describe=$(git -C .. describe --long --tags)
    export BUILD_NUMBER=$(echo $_git_describe | sed 's/.*-\([0-9]*\)-g.*/\1/')

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

package_web-eid-native-git() {
    pkgdesc="Web eID native application (git version)"
    provides=('web-eid-native')
    conflicts=('web-eid-native')

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

package_web-eid-firefox-git() {
    pkgdesc="Web eID Firefox extension (git version)"
    depends=('web-eid-native-git')
    provides=('web-eid-firefox')
    conflicts=('web-eid-firefox')
    arch=('any')

    cd "$srcdir/$pkgbase/$pkgbase-build"
    install -Dm644 "src/app/eu.webeid.firefox.json" \
                   "$pkgdir/usr/lib/mozilla/native-messaging-hosts/eu.webeid.json"
    install -Dm644 "$srcdir/web_eid_webextension-$_ext_ver.xpi" \
                   "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{e68418bc-f2b0-4459-a9ea-3e72b6751b07}.xpi"
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_web-eid-chrome-git() {
    pkgdesc="Web eID extension from Chrome Web Store (git version)"
    depends=('web-eid-native-git')
    provides=('web-eid-chrome')
    conflicts=('web-eid-chrome')
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
