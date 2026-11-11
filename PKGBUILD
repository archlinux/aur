# Maintainer: James Farr Gomez <james@nertwork.com>
pkgname=bluepill
pkgver=1.1.0
pkgrel=1
pkgdesc="BluePill — Native Linux/Wayland Qt6/QML desktop & CLI client for iMessage, RCS, and SMS"
arch=('x86_64' 'aarch64')
url="https://github.com/nertwork/bluepill"
license=('MIT')
provides=('imsg')
replaces=('imsg')
conflicts=('imsg')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'libnotify')
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
sha256sums=('fde345c6cf4774251f000626ea67fed4a5a2104c2b53e46151d51f834b6e2bb7')

build() {
    cd "$srcdir/bluepill-${pkgver}"
    ./bin/build
}

check() {
    cd "$srcdir/bluepill-${pkgver}"
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
