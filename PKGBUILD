# Maintainer: Pakrohk <pakrohk@gmail.com>
pkgname=hifi-suite-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Zero-config audio suite for wireless headsets: volume control, surround, NC, EQ, battery monitor"
arch=('any')
url="https://github.com/Pakrohk/linux-hifi-suite"
license=('MIT')
depends=('python' 'alsa-utils' 'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'socat')
makedepends=('git')
optdepends=(
    'noise-suppression-for-voice: RNNoise LADSPA plugin (recommended for NC)'
    'virtual-surround-manager: Virtual 7.1/5.1 surround with HeSuVi WAV (recommended for surround)'
    'easyeffects: GUI audio effects (EQ, compressor, limiter)'
    'realtime-privileges: low-latency audio'
    'gnome-shell: GNOME Shell extension'
    'plasma-desktop: KDE Plasma widget'
    'cinnamon: Cinnamon applet'
)
install="hifi-suite.install"
provides=('hifi-suite' 'redragon-audio-suite')
conflicts=('hifi-suite'
           'redragon-audio-suite-git'
           'redragon-hs-companion'
           'redragon-hs-companion-git')
replaces=('redragon-audio-suite-git')
source=("$pkgname::git+https://github.com/Pakrohk/linux-hifi-suite.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Core binaries
    install -Dm755 hifi-daemon.py "$pkgdir/usr/bin/hifi-daemon"
    install -Dm755 hifi-suite "$pkgdir/usr/bin/hifi-suite"

    # Python library
    install -Dm644 hifi_pipewire.py "$pkgdir/usr/lib/hifi-suite/pipewire.py"

    # Systemd service
    install -Dm644 hifi-daemon.service "$pkgdir/usr/lib/systemd/user/hifi-daemon.service"

    # PipeWire configs (templates)
    install -d "$pkgdir/usr/share/hifi-suite/configs"
    for f in configs/*.conf; do
        install -Dm644 "$f" "$pkgdir/usr/share/hifi-suite/configs/$(basename "$f")"
    done

    # Shell completions
    install -Dm644 completions/hifi-suite.bash "$pkgdir/usr/share/bash-completion/completions/hifi-suite"
    install -Dm644 completions/_hifi-suite "$pkgdir/usr/share/zsh/site-functions/_hifi-suite"

    # KDE Plasma widget
    if [ -d plasma-widget ]; then
        local wdir="$pkgdir/usr/share/plasma/plasmoids/hifi-suite"
        install -d "$wdir"
        cp -r plasma-widget/* "$wdir/"
    fi

    # GNOME extension
    if [ -d gnome-extension ]; then
        local gdir="$pkgdir/usr/share/gnome-shell/extensions/hifi-suite@hifi-suite"
        install -d "$gdir/schemas"
        cp gnome-extension/metadata.json "$gdir/"
        cp gnome-extension/extension.js "$gdir/"
        cp gnome-extension/schemas/*.xml "$gdir/schemas/"
    fi

    # Cinnamon applet
    if [ -d cinnamon-applet ]; then
        local cdir="$pkgdir/usr/share/cinnamon/applets/hifi-suite@cinnamon"
        install -d "$cdir"
        cp cinnamon-applet/metadata.json "$cdir/"
        cp cinnamon-applet/applet.js "$cdir/"
    fi
}
