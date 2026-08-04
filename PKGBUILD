# Maintainer: K4zoku <k4zoku@pm.me>
#
# This PKGBUILD builds the WebHID daemon + native-messaging host from a
# release tag (pkgver pins the tag; bump pkgver per release). Supports both
# x86_64 and aarch64.

_pkgbase=webhid
pkgname=${_pkgbase}
pkgver=3.0.0
pkgrel=1
pkgdesc='WebHID implementation for Firefox via a native-messaging bridge and hidraw daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/K4zoku/FF-WebHID'
license=('MIT')
depends=('libudev.so')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=('webhid-addon: Firefox browser extension (system-wide install)')
install=webhid.install
source=("${_pkgbase}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!lto' '!debug')

prepare() {
    cargo fetch \
        --target "$CARCH-unknown-linux-gnu" \
        --manifest-path "$srcdir/${_pkgbase}/crates/Cargo.toml"
}

build() {
    make -C "$srcdir/${_pkgbase}" build CARGO_ARGS=--frozen
}

package() {
    local _root="$srcdir/${_pkgbase}"

    make -C "$_root" install-system DESTDIR="$pkgdir" \
        PREFIX=/usr \
        SYSTEMD_DIR=/usr/lib/systemd/system \
        SYSTEM_NM_DIR=/usr/lib/mozilla/native-messaging-hosts

    # Native-messaging manifest for other Gecko-based browsers
    local _nm="$pkgdir/usr/lib/mozilla/native-messaging-hosts/webhid.forwarder_nm_host.json"
    install -Dm644 "$_nm" \
        "$pkgdir/usr/lib/librewolf/native-messaging-hosts/webhid.forwarder_nm_host.json"
    install -Dm644 "$_nm" \
        "$pkgdir/usr/lib/waterfox/native-messaging-hosts/webhid.forwarder_nm_host.json"

    install -Dm644 "$_root/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
