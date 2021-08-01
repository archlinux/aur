# Maintainer: John Andrews <theunderdog09 at gmail dot com>
# Contributor: Timo Kramer <fw minus aur at timokramer dot de>

pkgname=mullvad-vpn-cli
pkgver=2021.4
pkgrel=1
pkgdesc="The Mullvad VPN client cli"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('nss' 'iputils')
makedepends=('git' 'rust' 'go')
optdepends=('networkmanager: create Wireguard interface')
conflicts=('mullvad-vpn')
provides=('mullvad-vpn')
install="${pkgname}.install"
_commit='3a236d50fd1ffb67cd3d29fbfc31393cdf03a224'
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=${pkgver}?signed"
#        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}?signed" # unverified commit by mvd-ows
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}"
        'override.conf'
        )
sha256sums=('SKIP'
            'SKIP'
            'ed978958f86da9acbce950a832491b140a350c594e2446b99a7c397a98731316')
validpgpkeys=('EA0A77BF9E115615FC3BD8BC7653B940E494FE87'
              # Linus Färnstrand (code signing key) <linus at mullvad dot net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984')
              # David Lönnhager (code signing) <david dot l at mullvad dot net>

prepare() {
    # Point the submodule to our local copy
    cd "${srcdir}/mullvadvpn-app"
    git submodule init dist-assets/binaries
    git config submodule.mullvadvpn-app-binaries.url "${srcdir}/mullvadvpn-app-binaries"
    git submodule update

    echo "Removing old Rust build artifacts"
    cargo clean --target-dir=target

    # Prevent creation of `go` directory in user's HOME.
    export GOPATH="$srcdir/gopath"
    go clean -modcache
}

build() {
    cd "$srcdir/mullvadvpn-app"
    source env.sh ""

    echo "Building Mullvad VPN..."
    echo "Building wireguard-go..."
    pushd wireguard/libwg
    mkdir -p "../../build/lib/$CARCH-unknown-linux-gnu"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -o "../../build/lib/$CARCH-unknown-linux-gnu"/libwg.a -buildmode c-archive
    popd

    # Clean mod cache for makepkg -C
    go clean -modcache

    export MULLVAD_ADD_MANIFEST="1"

    echo "Building Rust code in release mode"

    # Build mullvad-daemon
    cargo build --release --locked --target-dir=target

    mkdir -p dist-assets/shell-completions
    for sh in bash zsh fish; do
        echo "Generating shell completion script for $sh..."
        cargo run --bin mullvad --release --locked --target-dir=target \
            -- shell-completions "$sh" dist-assets/shell-completions/
    done

    echo "Copying binaries"

    # Copy binaries for packaging
    cp -v dist-assets/binaries/x86_64-unknown-linux-gnu/{openvpn,sslocal} dist-assets/
    binaries=(mullvad
              mullvad-daemon
              mullvad-problem-report
              mullvad-setup
              mullvad-exclude
              libtalpid_openvpn_plugin.so)
    for binary in ${binaries[*]}; do
        cp target/release/${binary} dist-assets/${binary}
    done

    echo "Updating relay list..."
    # Update relays.json
    cargo run --bin relay_list --release --target-dir=target > dist-assets/relays.json

    echo "Updating API address cache..."
    cargo run --bin address_cache --release --target-dir=target > dist-assets/api-ip-address.txt
}

package() {
    cd "${srcdir}/mullvadvpn-app"

    # Install main files
    install --verbose --directory --mode=755 "${pkgdir}/opt/mullvad-vpn-cli"
    cp -rav dist-assets/* "${pkgdir}/opt/mullvad-vpn-cli"

    # Symlink daemon service to correct directory
    install --verbose -d "${pkgdir}/usr/lib/systemd/system"
    ln -s "/opt/mullvad-vpn-cli/linux/mullvad-daemon.service" \
        "${pkgdir}/usr/lib/systemd/system"

    # Install override for daemon
    install --verbose -D --mode=644 "${srcdir}/override.conf" -t \
        "${pkgdir}/etc/systemd/system/mullvad-daemon.service.d"

    # Install CLI binary
    install --verbose -D --mode=755 target/release/mullvad -t "${pkgdir}/usr/bin"

    # Install CLI exclude binary
    install --verbose -D --mode=755 target/release/mullvad-exclude -t "${pkgdir}/usr/bin"

    # Install shell completion zsh
    install --verbose -D --mode=644 dist-assets/shell-completions/_mullvad -t \
        "${pkgdir}/usr/share/zsh/site-functions"

    # Install shell completion bash
    install --verbose -D --mode=644 dist-assets/shell-completions/mullvad.bash -t \
        "${pkgdir}/usr/share/bash-completion/completions/mullvad"

    # Install shell completion fish
    install -Dm755 dist-assets/shell-completions/mullvad.fish -t \
        "$pkgdir/usr/share/fish/vendor_completions.d"

    # Install license
    install --verbose -D --mode=644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
