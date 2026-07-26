# Maintainer: existyay <liujam826@gmail.com>
pkgname=lx-music-shell
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal music player with multi-source support and auto-reconnect"
arch=("any")
url="https://github.com/existyay/LX-Music-Shell"
license=("MIT")
depends=("bash>=4.4"
         "coreutils"
         "curl"
         "glibc"
         "grep"
         "gawk"
         "ncurses"
         "procps-ng")
optdepends=("alsa-utils: ALSA audio control"
            "bluez: bluetooth support and monitoring"
            "bluez-utils: bluetoothctl for bluetooth device management"
            "ffmpeg: ffplay backend support and audio tools"
            "iputils: ping for network connectivity monitoring"
            "jq: enhanced JSON parsing for music APIs"
            "mplayer: alternative audio player backend"
            "mpv: recommended audio player backend"
            "networkmanager: network management integration"
            "pipewire: PipeWire audio system support"
            "pulseaudio: PulseAudio audio system support"
            "wireless_tools: WiFi connection monitoring")
makedepends=()
checkdepends=("shellcheck")
provides=()
conflicts=()
replaces=()
backup=("etc/skel/.config/lx-music-shell/config"
        "etc/skel/.config/lx-music-shell/sources.list")
options=()
install=lx-music-shell.install
source=("lx-music-shell-source-v2.0.0.tar.gz::https://github.com/existyay/LX-Music-Shell/archive/refs/tags/v2.0.0.tar.gz")
sha256sums=("SKIP")

prepare() {
    cd "$srcdir/LX-Music-Shell-$pkgver"
}

build() {
    cd "$srcdir/LX-Music-Shell-$pkgver"
    true
}

check() {
    cd "$srcdir/LX-Music-Shell-$pkgver"
    local s
    for s in lx-music-shell sources-update.sh uninstall.sh install.sh install-aur.sh; do
        bash -n "$s" || return 1
    done
    if command -v shellcheck &>/dev/null; then
        shellcheck -e SC1091,SC2155 lx-music-shell || true
    fi
}

package() {
    cd "$srcdir/LX-Music-Shell-$pkgver"

    # Install main executable
    install -Dm755 lx-music-shell "$pkgdir/usr/bin/lx-music-shell"

    # Install source update tool
    install -Dm755 sources-update.sh "$pkgdir/usr/bin/lx-music-sources"

    # Install uninstaller
    install -Dm755 uninstall.sh "$pkgdir/usr/bin/lx-music-shell-uninstall"

    # Install additional install scripts (for reference)
    install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 install-aur.sh "$pkgdir/usr/share/$pkgname/install-aur.sh"

    # Create config directory skeleton
    install -dm755 "$pkgdir/etc/skel/.config/lx-music-shell"

    # Default configuration
    cat > "$pkgdir/etc/skel/.config/lx-music-shell/config" << 'EOFCONFIG'
# LX-Music-Shell Configuration
PLAYER_BACKEND="mpv"
DEFAULT_SOURCE="kugou"
SEARCH_LIMIT="20"
PLAY_MODE="list"
VOLUME="80"
AUTO_UPDATE_SOURCES="true"
UI_COLOR="true"
NETWORK_CHECK_INTERVAL="3"
MAX_RECONNECT_ATTEMPTS="5"
RECONNECT_DELAY="2"
AUTO_RECONNECT="true"
WATCH_BLUETOOTH="true"
EOFCONFIG

    # Default music sources
    cat > "$pkgdir/etc/skel/.config/lx-music-shell/sources.list" << 'EOFSOURCES'
# LX-Music-Shell Music Sources Configuration
SOURCE_KUGOU="https://www.kugou.com/yy/index.php"
SOURCE_KUWO="http://www.kuwo.cn/api/www/search/searchMusicBykeyWord"
SOURCE_QQ="https://c.y.qq.com/soso/fcgi-bin/client_search_cp"
SOURCE_NETEASE="https://music.163.com/api/search/get/web"
SOURCE_MIGU="https://music.migu.cn/v1/api/search/search"
SOURCE_XIMALAYA="https://www.ximalaya.com/revision/search"
EOFSOURCES

    # Install man pages
    install -Dm644 aur/lx-music-shell.1 \
        "$pkgdir/usr/share/man/man1/lx-music-shell.1"
    install -Dm644 aur/lx-music-sources.1 \
        "$pkgdir/usr/share/man/man1/lx-music-sources.1"
    install -Dm644 aur/lx-music-shell-uninstall.1 \
        "$pkgdir/usr/share/man/man1/lx-music-shell-uninstall.1"

    # Install bash completion
    install -Dm644 aur/lx-music-shell.bash \
        "$pkgdir/usr/share/bash-completion/completions/lx-music-shell"

    # Install desktop entry
    install -Dm644 aur/lx-music-shell.desktop \
        "$pkgdir/usr/share/applications/lx-music-shell.desktop"

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 aur/README.md \
        "$pkgdir/usr/share/doc/$pkgname/AUR-README.md"
}