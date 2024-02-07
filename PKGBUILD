# Maintainer: ChaseCares <aur at chasecares dot dev>
# Contributor: Thomas <thomas at 6f dot io>

pkgname=jujutsu-git
_pkgname=jj
pkgver=0.13.0.r224.g1be82250
pkgrel=1
depends=(gcc-libs glibc zlib)
makedepends=(openssl cargo git)
options=(!lto)
arch=(i686 x86_64 armv6h armv7h)
pkgdesc="Git-compatible VCS that is both simple and powerful"
url="https://github.com/martinvonz/jj"
license=(Apache-2.0)
source=("$pkgname::git+$url")
conflicts=('jj' 'jujutsu')
provides=('jj' 'jujutsu')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$pkgname"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    mkdir completions
}

build() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

    "target/release/$_pkgname" util completion bash >"completions/$_pkgname.bash"
    "target/release/$_pkgname" util completion fish >"completions/$_pkgname.fish"
    "target/release/$_pkgname" util completion zsh >"completions/_$_pkgname"
}

check() {
    cd "$pkgname"

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"

    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"

    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
    cp --archive ./docs/* "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions" "completions/$_pkgname.bash"
    install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" "completions/$_pkgname.fish"
    install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" "completions/_$_pkgname"
}
