# Maintainer: noahlyk <noahlykins@gmail.com>
pkgname=pipewire-crisp-vocals
pkgver=0.1.0
pkgrel=1
pkgdesc="Hot-reloadable PipeWire mic DSP chain (denoise/gate/compressor/EQ) + declarative auto-wiring into a single virtual mic"
arch=('x86_64')
url="https://github.com/noahlyk/pipewire-crisp-vocals"
license=('MIT')
depends=('pipewire' 'jack2')
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

    install -Dm644 "$srcdir/99-crisp-vocals.conf" "$pkgdir/usr/share/pipewire/pipewire.conf.d/99-crisp-vocals.conf"
    install -Dm644 "$srcdir/99-crisp-vocals-low-latency.conf" "$pkgdir/usr/share/pipewire/pipewire.conf.d/99-crisp-vocals-low-latency.conf"

    install -Dm644 "$srcdir/crisp-vocals.ron.example" "$pkgdir/usr/share/pipewire-crisp-vocals/crisp-vocals.ron.example"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/ARCHITECTURE.md" "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo ""
    echo "==> pipewire-crisp-vocals installed."
    echo "    PipeWire config drop-ins were installed to /usr/share/pipewire/pipewire.conf.d/"
    echo "    -- symlink or copy them into /etc/pipewire/pipewire.conf.d/ (or your user config"
    echo "    dir) if your PipeWire doesn't already load /usr/share/pipewire/pipewire.conf.d/:"
    echo ""
    echo "    mkdir -p ~/.config/pipewire/pipewire.conf.d"
    echo "    ln -s /usr/share/pipewire/pipewire.conf.d/99-crisp-vocals.conf ~/.config/pipewire/pipewire.conf.d/"
    echo "    ln -s /usr/share/pipewire/pipewire.conf.d/99-crisp-vocals-low-latency.conf ~/.config/pipewire/pipewire.conf.d/"
    echo "    systemctl --user restart pipewire pipewire-pulse wireplumber"
    echo ""
    echo "==> Then enable the one user service (config + mic auto-detect on first run):"
    echo "    systemctl --user enable --now pipewire-crisp-vocals.service"
    echo ""
    echo "    Edit ~/.config/pipewire/crisp-vocals.ron afterward to tune the DSP chain --"
    echo "    changes hot-reload within ~50ms, no restart needed. Use 'crisp-links mic'"
    echo "    to change the routed mic (<node-name> | --auto | --list)."
}

post_upgrade() {
    post_install
}
