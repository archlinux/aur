# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.appflowy

pkgname=appflowy
pkgver=0.13.0
pkgrel=1
pkgdesc="Open-source alternative to Notion – you own your data and customizations"
arch=('x86_64')
url="https://appflowy.com"
license=('AGPL-3.0-or-later')
conflicts=('appflowy-bin' 'appflowy-git')
depends=(
    'glib2>=2.80'
    'gst-plugins-base-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libkeybinder3'
    'libnotify'
    'rocksdb'
)
_flutter_ver=3.27.4
makedepends=(
    'clang'
    'cmake'
    'git'
    'ninja'
    'pkg-config'
    'sqlite'
    'openssl'
    'unzip'
    'protobuf'
    'rsync'
    'rustup'
    'cargo-make'
)
optdepends=(
    'kdialog: file picker on KDE Plasma'
    'zenity: file picker on GNOME/GTK'
)
options=('!lto' '!debug' '!buildflags')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/AppFlowy-IO/AppFlowy/archive/refs/tags/${pkgver}.tar.gz"
    "flutter::git+https://github.com/flutter/flutter.git#tag=${_flutter_ver}"
    "appflowy.desktop"
)
sha256sums=(
    'f0e84458b9d5fb9f478ada38c69c1d4da4c9e400a138dfb6c857a1036f7ef2b8'
    'SKIP'
    '55c02d13249b333088ee452e76c8f36254e510651023549dc7e35efca02ca821'
)

prepare() {
    export PATH="${srcdir}/flutter/bin:${PATH}"

    cd "AppFlowy-${pkgver}/frontend"

    # Upstream sets the real version at release time; the tag still carries a stale one
    sed -i "s/^APPFLOWY_VERSION = .*/APPFLOWY_VERSION = \"${pkgver}\"/" Makefile.toml
    sed -i "s/^version: .*/version: ${pkgver}/" appflowy_flutter/pubspec.yaml

    # Install the Rust toolchain declared in rust-toolchain.toml (channel = "1.85")
    rustup toolchain install --no-self-update
    rustup target add ${CARCH}-unknown-linux-gnu

    # Pre-fetch Rust crate dependencies
    cargo fetch --manifest-path=rust-lib/Cargo.toml

    # Fetch Flutter package dependencies
    cd appflowy_flutter
    flutter pub get

    # Run code generation explicitly so it runs visibly and before cargo-make
    cd ..
    ./scripts/code_generation/generate.sh --skip-pub-get
}

build() {
    export PATH="${srcdir}/flutter/bin:${HOME}/.pub-cache/bin:${PATH}"
    export CC=clang
    export CXX=clang++
    export ROCKSDB_LIB_DIR=/usr/lib
    # hotkey_manager plugin has uninitialized variables that clang promotes to errors
    export CXXFLAGS="-Wno-error=sometimes-uninitialized"

    cd "AppFlowy-${pkgver}/frontend"
    cargo make --profile production-linux-${CARCH} appflowy
}

package() {
    cd "AppFlowy-${pkgver}/frontend"

    # APPFLOWY_VERSION in Makefile.toml determines the product subdirectory name
    local _appver
    _appver=$(sed -n 's/^APPFLOWY_VERSION = "\(.*\)"/\1/p' Makefile.toml)
    local _product="appflowy_flutter/product/${_appver}/linux/Release/AppFlowy"

    # Install AppFlowy bundle
    install -dm755 "${pkgdir}/usr/lib/AppFlowy"
    cp -r "${_product}/." "${pkgdir}/usr/lib/AppFlowy/"
    chmod 755 "${pkgdir}/usr/lib/AppFlowy/AppFlowy"

    # Symlink into PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/AppFlowy/AppFlowy" "${pkgdir}/usr/bin/appflowy"

    # Desktop entry
    install -Dm644 "${srcdir}/appflowy.desktop" \
        "${pkgdir}/usr/share/applications/appflowy.desktop"

    # Icons
    install -Dm644 "appflowy_flutter/linux/packaging/assets/logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/appflowy.png"
    install -Dm644 "appflowy_flutter/assets/images/flowy_logo.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/appflowy.svg"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
