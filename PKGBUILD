# Maintainer: K4zoku <k4zoku@pm.me>
#
# This PKGBUILD builds the WebHID daemon + native-messaging host from a
# release tag (pkgver pins the tag; bump pkgver per release). Supports both
# x86_64 and aarch64.

_pkgbase=webhid
_tag=79a10e6dabc5ac50f0d20696af12f002a05c796f
pkgname=${_pkgbase}
pkgver=3.2.0
pkgrel=1
pkgdesc='WebHID implementation for Firefox via a native-messaging bridge and hidraw daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/K4zoku/FF-WebHID'
license=('MIT')
depends=('libudev.so')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=('webhid-addon: Firefox browser extension (system-wide install)')
install=webhid.install
source=("${_pkgbase}::git+${url}.git?signed#tag=${_tag}")
validpgpkeys=('787C5932BF4CDF5C36E071B9798FBBB05FCDD531')  # k4zoku <k4zoku@disr.it>
sha256sums=('3ee29d8b47d42d6262bb9183d4335e723b1eeb8b78f00ebbed273a5ed1fdeff7')
options=('!lto' '!debug')

prepare() {
    cargo fetch \
        --target "$CARCH-unknown-linux-gnu" \
        --manifest-path "$srcdir/${_pkgbase}/crates/Cargo.toml"
}

build() {
    cd "$srcdir/${_pkgbase}"
    cargo build --release --frozen \
        --manifest-path crates/Cargo.toml
}

_browser_forks=(librewolf waterfox)

_install_browser_forks() {
    local _src="$1" _dest="$2" _root
    for _root in "${_browser_forks[@]}"; do
        install -Dm644 "$_src" "$pkgdir/usr/lib/$_root/$_dest"
    done
}

package() {
    local _root="$srcdir/${_pkgbase}"
    local _release="$_root/crates/target/release"
    local _nm_dir="$pkgdir/usr/lib/mozilla/native-messaging-hosts"

    install -Dm755 "$_release/webhid-daemon" \
        "$pkgdir/usr/bin/webhid-daemon"
    install -Dm755 "$_release/webhid-native-messaging" \
        "$pkgdir/usr/bin/webhid-native-messaging"

    sed 's|{{NM_BIN}}|/usr/bin/webhid-native-messaging|g' \
        "$_root/manifests/webhid.forwarder_nm_host.json" \
        | install -Dm644 /dev/stdin "$_nm_dir/webhid.forwarder_nm_host.json"
    sed 's|{{DAEMON_BIN}}|/usr/bin/webhid-daemon|g' \
        "$_root/manifests/webhid.daemon_nm_host.json" \
        | install -Dm644 /dev/stdin "$_nm_dir/webhid.daemon_nm_host.json"

    sed 's|{{DAEMON_BIN}}|/usr/bin/webhid-daemon|g' \
        "$_root/manifests/webhid-daemon.service" \
        | install -Dm644 /dev/stdin \
            "$pkgdir/usr/lib/systemd/system/webhid-daemon.service"

    local _f
    for _f in webhid.forwarder_nm_host.json webhid.daemon_nm_host.json; do
        _install_browser_forks "$_nm_dir/$_f" "native-messaging-hosts/$_f"
    done

    install -Dm644 "$_root/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
