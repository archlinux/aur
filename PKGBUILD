# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Unofficial AUR packaging of the Fluxer terminal client.
# Upstream has no tagged releases, so this pins the latest master commit;
# the packaging repo's CI bumps the pin and checksums automatically.
# Upstream: https://github.com/AIVirtuoso/fluxter

pkgname=fluxter
_commit=a5a4acd4d52afec6085e5219be0e4f1a97e2dc5c
pkgver=0.7.5.r20260923.a5a4acd
pkgrel=1
pkgdesc="Keyboard-only TUI chat client for the Fluxer messaging platform, with inline media and voice calls"
arch=('x86_64')
url="https://github.com/AIVirtuoso/fluxter"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'go')
optdepends=('ffmpeg: microphone and playback for voice calls (fluxter-phone)'
            'mpv: playback for voice calls when ffplay is missing'
            'gst-plugins-ugly: screen sharing in voice calls (x264enc)'
            'gst-plugin-pipewire: screen sharing in voice calls (pipewiresrc)'
            'xdg-desktop-portal: screen sharing in voice calls (the screen chooser)')
provides=()
conflicts=()
options=('!lto')
source=("$pkgname-$_commit.tar.gz::https://github.com/AIVirtuoso/fluxter/archive/$_commit.tar.gz")
sha256sums=('02bc8b2565298962faaed75f928187e50840fff764ac38420af471302d1a23c0')

prepare() {
    cd "$pkgname-$_commit/phone"
    export GOPATH="$srcdir/go"
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$_commit"
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"
    cargo build --release --locked

    # fluxter-phone carries a voice call's sound; without it the client
    # joins a call but nothing is heard or sent
    cd phone
    export GOPATH="$srcdir/go"
    export CGO_ENABLED=0
    go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o fluxter-phone .
}

package() {
    cd "$pkgname-$_commit"

    install -Dm755 \
        "target/release/fluxter" \
        "$pkgdir/usr/bin/fluxter"

    install -Dm755 \
        "phone/fluxter-phone" \
        "$pkgdir/usr/bin/fluxter-phone"

    install -Dm644 \
        "README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
