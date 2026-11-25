# Maintainer: James Farr Gomez <james@nertwork.com>
pkgname=bluepill
pkgver=1.2.16
pkgrel=2
pkgdesc="BluePill — Native Linux/Wayland Qt6/QML desktop & CLI client for iMessage, RCS, and SMS"
arch=('x86_64' 'aarch64')
url="https://github.com/nertwork/bluepill"
license=('MIT')
provides=('imsg')
replaces=('imsg')
conflicts=('imsg')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'qt6-wayland' 'libnotify')
makedepends=('qt6-base' 'qt6-declarative' 'git')
checkdepends=('libheif' 'imagemagick')
optdepends=(
    'libheif: Fast HEIC/HEIF photo attachment decoding'
    'imagemagick: Fallback HEIC/AVIF image conversion'
    'libsecret: Secret Service keyring lookup via secret-tool'
    'pipewire-pulse: Notification sound playback (paplay)'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nertwork/bluepill/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f17fe98c6366c68c368dfefb467a665de4ed1ba6051c2a05819b0db77206f3b0')

build() {
    cd "$srcdir/bluepill-${pkgver}"
    ./bin/build
}

check() {
    cd "$srcdir/bluepill-${pkgver}"
    local _test_home
    _test_home="$(mktemp -d)"
    trap 'rm -rf "$_test_home"' RETURN
    HOME="$_test_home" \
    XDG_CONFIG_HOME="$_test_home/.config" \
    XDG_CACHE_HOME="$_test_home/.cache" \
    XDG_DATA_HOME="$_test_home/.local/share" \
    XDG_STATE_HOME="$_test_home/.local/state" \
    QT_QPA_PLATFORM=offscreen ./bin/test
}

package() {
    cd "$srcdir/bluepill-${pkgver}"
    install -Dm755 build/bluepill "$pkgdir/usr/bin/bluepill"
    ln -sf bluepill "$pkgdir/usr/bin/imsg"
    install -Dm644 pkgbuild/bluepill.service "$pkgdir/usr/lib/systemd/user/bluepill.service"
    install -Dm644 pkgbuild/imsg.service "$pkgdir/usr/lib/systemd/user/imsg.service"
    install -Dm644 pkgbuild/bluepill.desktop "$pkgdir/usr/share/applications/bluepill.desktop"
    install -Dm644 pkgbuild/imsg.desktop "$pkgdir/usr/share/applications/imsg.desktop"
    install -Dm644 pkgbuild/bluepill.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bluepill.svg"
    install -Dm644 pkgbuild/imsg.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/imsg.svg"
    install -Dm644 assets/bluepill.png "$pkgdir/usr/share/pixmaps/bluepill.png"
    install -Dm644 resources/imessage-notify.wav "$pkgdir/usr/share/bluepill/imessage-notify.wav"
    install -Dm644 resources/imessage-notify.wav "$pkgdir/usr/share/imsg/imessage-notify.wav"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
