# Maintainer: gao <gao66 at sdf dot org>

pkgname=iptv-checker-rs-git
_pkgname=iptv-checker-rs
pkgver=r282.59d5baa
pkgrel=1
pkgdesc="Checking links in IPTV playlists written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/zhimin-dev/iptv-checker-rs"
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'openssl')
makedepends=('cargo' 'git')
install="$pkgname.install"
source=("git+$url.git"
        "iptv-checker-rs.service")
sha256sums=('SKIP'
            '3d65f14bc276cc78164d01de311cc9f5a6b08b0341a6e9f836bdda84171d3494')
backup=("usr/share/${_pkgname}/tasks.json"
        "usr/lib/systemd/system/iptv-checker-rs.service")
conflicts=('iptv-checker-rs')
provides=('iptv-checker-rs')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    export RUSTFLAGS="-C link-arg=-fcf-protection=full"
    cargo build --release --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/$_pkgname" "$pkgdir/usr/share/$_pkgname/$_pkgname"

  install -d "$pkgdir/usr/share/$_pkgname/web"
  cp -r web/* "$pkgdir/usr/share/$_pkgname/web"
  
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/iptv-checker-rs.service" "$pkgdir/usr/lib/systemd/system/iptv-checker-rs.service"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
