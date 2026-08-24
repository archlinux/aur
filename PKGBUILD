# Maintainer: K4zoku <k4zoku@pm.me>
#
# This PKGBUILD builds the WebHID daemon + native-messaging host from the
# latest git commit (git package; version derived via git describe, so no
# manual bump per release). Supports both x86_64 and aarch64.

_pkgbase=webhid
pkgname=${_pkgbase}-git
pkgver=3.1.0.r96.g050c5e5
pkgrel=1
pkgdesc='WebHID implementation for Firefox via a native-messaging bridge and hidraw daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/K4zoku/FF-WebHID'
license=('MIT')
depends=('libudev.so')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=('webhid-addon: Firefox browser extension (system-wide install)')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=webhid-git.install
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')
options=('!lto' '!debug')

pkgver() {
    cd "${_pkgbase}"
    git describe --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
