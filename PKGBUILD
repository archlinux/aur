pkgname=sjnmusicd-git
pkgver=r8.7d80656
pkgrel=1
pkgdesc="SJNmusic daemon (Rust)"
arch=('x86_64')
url="https://github.com/serverjonas/SJNmusic"
license=('MIT')

depends=('glibc' 'alsa-lib' 'yt-dlp')
makedepends=('git' 'rust' 'cargo')

source=("git+https://github.com/serverjonas/SJNmusic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/SJNmusic"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/SJNmusic/daemon"
    cargo build --release
}

package() {
    cd "$srcdir/SJNmusic/daemon"

    install -Dm755 target/release/sjnmusicd \
        "$pkgdir/usr/bin/sjnmusicd"

    install -Dm644 systemd/sjnmusicd.service \
        "$pkgdir/usr/lib/systemd/user/sjnmusicd.service"

    install -Dm644 "$srcdir/SJNmusic/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
