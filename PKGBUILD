# If you find a way to do things, leave a comment with the patch or asking to co-maintain this package.
pkgname=nostrmo
pkgver=2.9.1
pkgrel=1
pkgdesc="A flutter nostr client for Android, IOS, MacOS, Windows, Web and Linux"
url="https://github.com/haorendashu/nostrmo"
arch=('x86_64')
license=(GPL3)
depends=(sqlite mpv)
makedepends=(flutter-tool flutter-devel flutter-sky-engine-google-bin flutter-target-linux gendesk git)
provides=(nostrmo)
source=(
    "git+${url}.git#tag=${pkgver}"
    "pubspec.patch"
)
sha256sums=('SKIP' '49378776207de0745ff0a4eb74d07682b3c18c6d363552d4d509359d522746fa')
sha512sums=('SKIP' 'c14b92f08c6c9b18e7523487df89cecc4602251f84311c45f33149bf75496338d312fbf32823aaa939dc84eccc3635ca52160c9fc86bdcb28bb535b973c3abdf')

prepare() {
    echo "Preparing Nostrmo"
    cd "nostrmo" || exit 1
    git submodule init
    git submodule update
    
    echo "Patching Nostrmo"
    patch "${srcdir}/nostrmo/pubspec.yaml"< "${srcdir}/pubspec.patch"
    flutter pub get
}

build() {
    echo "Building Nostrmo..."
    cd "nostrmo" || exit 1
    flutter build linux --release
}
package (){
    echo "Packing Nostrmo..."
    cd "nostrmo" || exit 1

    mkdir -p "${pkgdir}/opt/nostrmo" "${pkgdir}/usr/bin"
    install -Dm755 build/linux/x64/release/bundle/nostrmo  "${pkgdir}/opt/nostrmo/nostrmo"
    cp -r build/linux/x64/release/bundle/lib "${pkgdir}/opt/nostrmo/"
    cp -r build/linux/x64/release/bundle/data "${pkgdir}/opt/nostrmo/"

    ln -s /opt/nostrmo/nostrmo "${pkgdir}/usr/bin/nostrmo"

    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/nostrmo/assets/imgs/logo/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --icon /usr/share/pixmaps/$pkgname.png
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
