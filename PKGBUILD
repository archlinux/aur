# Maintainer: Pakrohk <pakrohk@gmail.com>
pkgname=hifi-suite-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio suite for wireless headsets: volume control, surround, noise cancellation, EQ"
arch=('any')
url="https://github.com/Pakrohk/linux-hifi-suite"
license=('MIT')
depends=('python' 'alsa-utils' 'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'socat')
makedepends=('git')
optdepends=(
    'noise-suppression-for-voice: RNNoise LADSPA plugin (recommended for NC)'
    'easyeffects: GUI audio effects (EQ, compressor, limiter)'
    'virtual-surround-manager: Virtual 7.1/5.1 surround with HeSuVi WAV (recommended for surround)'
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
source=('hifi-daemon.py' 'hifi_pipewire.py' 'hifi-suite' 'hifi-daemon.service'
        'plasma-widget' 'gnome-extension' 'cinnamon-applet' 'configs')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Core
    install -Dm755 "$srcdir/hifi-daemon.py" "$pkgdir/usr/bin/hifi-daemon"
    install -Dm755 "$srcdir/hifi_pipewire.py" "$pkgdir/usr/lib/hifi-suite/pipewire.py"
    install -Dm755 "$srcdir/hifi-suite" "$pkgdir/usr/bin/hifi-suite"

    # Fix import path in daemon
    sed -i 's|from redragon_volume_sync import|from hifi_pipewire import|' \
        "$pkgdir/usr/bin/hifi-daemon" 2>/dev/null || true

    # Systemd
    install -Dm644 "$srcdir/hifi-daemon.service" \
        "$pkgdir/usr/lib/systemd/user/hifi-daemon.service"

    # PipeWire configs (templates)
    install -d "$pkgdir/usr/share/hifi-suite/configs"
    for f in "$srcdir"/configs/*.conf; do
        install -Dm644 "$f" "$pkgdir/usr/share/hifi-suite/configs/$(basename "$f")"
    done

    # KDE Plasma widget
    if [ -d "$srcdir/plasma-widget" ]; then
        local wdir="$pkgdir/usr/share/plasma/plasmoids/hifi-suite"
        install -d "$wdir"
        cp -r "$srcdir/plasma-widget/"* "$wdir/"
    fi

    # GNOME extension
    if [ -d "$srcdir/gnome-extension" ]; then
        local gdir="$pkgdir/usr/share/gnome-shell/extensions/hifi-suite@hifi-suite"
        install -d "$gdir/schemas"
        cp "$srcdir/gnome-extension/metadata.json" "$gdir/"
        cp "$srcdir/gnome-extension/extension.js" "$gdir/"
        cp "$srcdir/gnome-extension/schemas/"*.xml "$gdir/schemas/"
    fi

    # Cinnamon applet
    if [ -d "$srcdir/cinnamon-applet" ]; then
        local cdir="$pkgdir/usr/share/cinnamon/applets/hifi-suite@cinnamon"
        install -d "$cdir"
        cp "$srcdir/cinnamon-applet/metadata.json" "$cdir/"
        cp "$srcdir/cinnamon-applet/applet.js" "$cdir/"
    fi
}
