# Maintainer: ixaxaar <root@ixaxaar.in>
pkgname=exit-gate-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Egress firewall for TCP and UDP with eBPF: Electron GUI + systemd daemon (binary release)"
arch=('x86_64')
url="https://github.com/lunar-lander/exit-gate"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'libnotify' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
         'util-linux-libs' 'libsecret' 'libelf' 'zlib' 'zstd' 'gcc-libs')
options=('!strip')
backup=('etc/exit-gate/config.toml')
source=("exit-gate-$pkgver.deb::https://github.com/lunar-lander/exit-gate/releases/download/v$pkgver/exit-gate-$pkgver-amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/lunar-lander/exit-gate/v$pkgver/LICENSE")
sha256sums=('4ac604419ce2b5b74580d56820a86e8ab3e62e653050ffb109c7f9e875d9340a'
            'f1cc598518defe9a1bfca1ff1d7b165df7bf181314b417502c06a6aff5b4bcb9')
noextract=("exit-gate-$pkgver.deb")

prepare() {
    mkdir -p "$srcdir/x"
    ar p "$srcdir/exit-gate-$pkgver.deb" data.tar.xz | tar -xJ -C "$srcdir/x"
}

package() {
    local x="$srcdir/x"
    local res="$x/opt/Exit Gate/resources/daemon"

    # Electron GUI (bundled runtime)
    install -dm755 "$pkgdir/opt/Exit Gate"
    cp -a "$x/opt/Exit Gate/." "$pkgdir/opt/Exit Gate/"
    chmod 4755 "$pkgdir/opt/Exit Gate/chrome-sandbox"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Exit Gate/exit-gate" "$pkgdir/usr/bin/exit-gate"

    # Desktop entry + icon
    install -Dm644 "$x/usr/share/applications/exit-gate.desktop" \
        "$pkgdir/usr/share/applications/exit-gate.desktop"
    install -Dm644 "$x/usr/share/icons/hicolor/0x0/apps/exit-gate.png" \
        "$pkgdir/usr/share/icons/hicolor/0x0/apps/exit-gate.png"

    # Daemon, eBPF objects
    install -Dm755 "$res/exit-gate-daemon" "$pkgdir/usr/bin/exit-gate-daemon"
    install -Dm644 "$res/bpf/network_monitor.bpf.o" \
        "$pkgdir/usr/lib/exit-gate/bpf/network_monitor.bpf.o"

    # Default config: point bpf_path at the Arch install location
    # (user edits preserved across upgrades via backup=)
    sed 's|/usr/local/lib/exit-gate/bpf|/usr/lib/exit-gate/bpf|' "$res/config.toml" > config.toml
    install -Dm644 config.toml "$pkgdir/etc/exit-gate/config.toml"

    # systemd unit: point at /usr/bin, create runtime/state dirs at boot
    sed -e 's|/usr/local/bin/|/usr/bin/|' "$res/exit-gate.service" > exit-gate.service
    printf '%s\n' 'RuntimeDirectory=exit-gate' 'StateDirectory=exit-gate' >> exit-gate.service
    install -Dm644 exit-gate.service "$pkgdir/usr/lib/systemd/system/exit-gate.service"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
