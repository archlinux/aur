# Maintainer: Pakrohk <pakrohk@gmail.com>
pkgname=hifi-suite-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Zero-config audio suite for wireless headsets: volume control, surround, NC, EQ, battery monitor"
arch=('any')
url="https://github.com/Pakrohk/linux-hifi-suite"
license=('MIT')
depends=('python' 'python-typer' 'alsa-utils' 'pipewire' 'pipewire-alsa' 'pipewire-pulse')
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

    # Python package
    install -d "$pkgdir/usr/lib/hifi-suite"
    cp -r hifi "$pkgdir/usr/lib/hifi-suite/"

    # Clean up __pycache__
    find "$pkgdir" -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true

    # Entry points
    install -Dm755 hifi-suite "$pkgdir/usr/bin/hifi-suite"
    install -Dm755 hifi-daemon "$pkgdir/usr/bin/hifi-daemon"

    # Systemd service
    install -Dm644 hifi-daemon.service "$pkgdir/usr/lib/systemd/user/hifi-daemon.service"

    # Shell completions — generated via Typer at install time
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"
    # Completions are installed by running: hifi-suite --install-completion
    # The .install file handles this automatically

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
