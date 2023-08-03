# Maintainer: filips <projects at filips dot si>
# Maintainer: Peter Cai <peter at typeblog dot net>
# Contributor: TheFool <rn6l05d28@relay.firefox.com>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa/PKGBUILD

_pkgname="PWAsForFirefox"
pkgname="firefox-pwa"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.7.3"
pkgrel=1
url="https://pwasforfirefox.filips.si/"
arch=("x86_64" "i686")
license=("MPL2")

makedepends=("rust" "cargo")
optdepends=("firefox: Support for browser extension")
install=package.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/filips123/PWAsForFirefox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b520cf5caeeca1d23043a032137f7eead7eb88270e5376c5d08b1234bb90376f')
b2sums=('2f2739b7b5f1cdd8bb7b3bca1d0a3e1609845d3b96eb85b850e58805ad949783c30f109fe196cdc1fc33a5d9b5e8bf279a2c8c07714cfabae76b305f33fc84ac')

prepare() {
    cd $srcdir/$_pkgname-$pkgver/native/

    # Set the correct version in source files
    sed -i "s/version = \"0.0.0\"/version = \"$pkgver\"/g" Cargo.toml
    sed -i "s/DISTRIBUTION_VERSION = '0.0.0'/DISTRIBUTION_VERSION = '$pkgver'/g" userchrome/profile/chrome/pwa/chrome.jsm

    # We don't use libexec on Arch
    sed -i "s@/usr/libexec/firefoxpwa-connector@/usr/lib/firefoxpwa/firefoxpwa-connector@g" manifests/linux.json
}

build() {
    cd $srcdir/$_pkgname-$pkgver/native/
    RUSTUP_TOOLCHAIN=stable cargo build --release
}

check() {
    cd $srcdir/$_pkgname-$pkgver/native/
    [ "$(./target/release/firefoxpwa --version)" == "firefoxpwa $pkgver" ]
}

package() {
    cd $srcdir/$_pkgname-$pkgver/native/

    # Executables
    install -Dm755 target/release/firefoxpwa $pkgdir/usr/bin/firefoxpwa
    install -Dm755 target/release/firefoxpwa-connector $pkgdir/usr/lib/firefoxpwa/firefoxpwa-connector

    # Manifest
    install -Dm644 manifests/linux.json $pkgdir/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json

    # Completions
    install -Dm755 target/release/completions/firefoxpwa.bash $pkgdir/usr/share/bash-completion/completions/firefoxpwa
    install -Dm755 target/release/completions/firefoxpwa.fish $pkgdir/usr/share/fish/vendor_completions.d/firefoxpwa.fish
    install -Dm755 target/release/completions/_firefoxpwa $pkgdir/usr/share/zsh/vendor-completions/_firefoxpwa

    # UserChrome
    mkdir -p $pkgdir/usr/share/firefoxpwa/userchrome/
    cp -r userchrome/* $pkgdir/usr/share/firefoxpwa/userchrome/

    # Documentation
    install -Dm644 ../README.md $pkgdir/usr/share/doc/firefoxpwa/README.md
    install -Dm644 ../native/README.md $pkgdir/usr/share/doc/firefoxpwa/README-NATIVE.md
    install -Dm644 ../extension/README.md $pkgdir/usr/share/doc/firefoxpwa/README-EXTENSION.md
    install -Dm644 packages/deb/copyright $pkgdir/usr/share/doc/firefoxpwa/copyright

    # AppStream Metadata
    install -Dm644 packages/appstream/si.filips.FirefoxPWA.metainfo.xml $pkgdir/usr/share/metainfo/si.filips.FirefoxPWA.metainfo.xml
    install -Dm644 packages/appstream/si.filips.FirefoxPWA.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/si.filips.FirefoxPWA.svg
}
