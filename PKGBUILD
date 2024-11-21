# Maintainer: gao <gao66 at sdf dot org>

pkgname=iptv-checker-rs-git
_pkgname=iptv-checker-rs
pkgver=3.2.1.r10.g0a1e1c9
pkgrel=1
pkgdesc="Checking links in IPTV playlists written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/zhimin-dev/iptv-checker-rs"
license=('unknown')
depends=('ffmpeg' 'openssl')
makedepends=('cargo' 'git')
install="$pkgname.install"
source=("git+$url.git"
        "0001-update-openssl-dependency.patch"
        "iptv-checker-rs.service")
sha256sums=('SKIP'
            '034a5daec5e21305fd2a3dc2300e74c77049985887f8552aef02c90fd9794c8c'
            'ccf9cc994d38a2f758569e3443f06bd1ab4749dfbde8e6d2dc6c6c473c05f46c')
backup=("usr/share/${_pkgname}/tasks.json"
        "usr/lib/systemd/system/iptv-checker-rs.service")
conflicts=('iptv-checker-rs')
provides=('iptv-checker-rs')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    patch --forward --strip=1 --input="$srcdir/0001-update-openssl-dependency.patch"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --offline --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/share/$_pkgname/$_pkgname"

  install -d "$pkgdir/usr/share/$_pkgname/web"
  cp -r web/* "$pkgdir/usr/share/$_pkgname/web"
  
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/iptv-checker-rs.service" "$pkgdir/usr/lib/systemd/system/iptv-checker-rs.service"
}
