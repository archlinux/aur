# Maintainer: noahlyk <noahlykins@gmail.com>
pkgname=pipewire-crisp-vocals
pkgver=0.2.0
pkgrel=1
pkgdesc="Hot-reloadable PipeWire mic DSP chain (denoise/gate/compressor/EQ) + declarative auto-wiring into a single virtual mic"
arch=('x86_64')
url="https://github.com/noahlyk/pipewire-crisp-vocals"
license=('MIT')
depends=('pipewire' 'jack')
optdepends=('fluidsynth: optional MIDI-keyboard synth fan-in (synth.enabled in crisp-vocals.ron)')
makedepends=()
options=('!debug')

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/noahlyk/pipewire-crisp-vocals/releases/download/v${pkgver}/pipewire-crisp-vocals-${pkgver}-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/noahlyk/pipewire-crisp-vocals/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    # The release tarball bundles both binaries, the supervisor wrapper
    # script, the single systemd unit, the PipeWire config drop-ins and the
    # docs -- see .github/workflows/release.yml's "Create tarball" step.
    install -Dm755 "$srcdir/crisp-vocals" "$pkgdir/usr/bin/crisp-vocals"
    install -Dm755 "$srcdir/crisp-links" "$pkgdir/usr/bin/crisp-links"

    install -Dm755 "$srcdir/pipewire-crisp-vocals-wrapper.sh" "$pkgdir/usr/lib/crisp-vocals/pipewire-crisp-vocals-wrapper.sh"

    install -Dm644 "$srcdir/pipewire-crisp-vocals.service" "$pkgdir/usr/lib/systemd/user/pipewire-crisp-vocals.service"

    install -Dm644 "$srcdir/99-crisp-vocals-low-latency.conf" "$pkgdir/etc/pipewire/pipewire.conf.d/99-crisp-vocals-low-latency.conf"
    install -Dm644 "$srcdir/virtual-devices.conf" "$pkgdir/usr/share/pipewire-crisp-vocals/virtual-devices.conf"

    install -Dm644 "$srcdir/crisp-vocals.ron.example" "$pkgdir/usr/share/pipewire-crisp-vocals/crisp-vocals.ron.example"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/ARCHITECTURE.md" "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo ""
    echo "==> pipewire-crisp-vocals installed. Enable it:"
    echo ""
    echo "    systemctl --user enable --now pipewire-crisp-vocals.service"
    echo ""
    echo "    That's it -- config is auto-created at ~/.config/pipewire/crisp-vocals.ron"
    echo "    with your mic auto-detected on first run. Edit that file to tune the DSP"
    echo "    chain (hot-reloads within ~50ms, no restart needed), or run"
    echo "    'crisp-links mic --list|--auto|<node-name>' to change the routed mic."
}

post_upgrade() {
    post_install
}
