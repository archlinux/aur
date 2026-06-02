# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>

pkgname=rustnet-git
_pkgname=${pkgname%-git}
_reponame=${pkgname%-git}
pkgver=r549.3a20287
pkgrel=1
pkgdesc="Real-time network monitoring TUI with process identification via eBPF and deep packet inspection"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/domcyrus/${_reponame}"
license=('Apache-2.0')
depends=('glibc' 'libelf' 'libgcc' 'libpcap' 'zlib')
makedepends=('cargo' 'clang' 'git' 'libbpf')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=("!lto")
install=$_pkgname.install
source=("git+https://github.com/domcyrus/${_reponame}.git"
        "rustnet-setcap.hook")
sha256sums=('SKIP'
            '23e3f805482dce718fda9cbe0f326e3b7b7bdf05a1a4e46b38d3de3ec2adf816')

pkgver() {
    cd "$srcdir/$_reponame"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_reponame"

    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$_reponame"

    export RUSTNET_ASSET_DIR="$srcdir/$_reponame/assets"

    export CARGO_PROFILE_RELEASE_LTO=true
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$_reponame"

    export CARGO_PROFILE_RELEASE_LTO=true
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$_reponame"

    install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/rustnet-setcap.hook" -t "$pkgdir/usr/share/$_pkgname/hooks/"

    install -Dm644 "assets/rustnet.1" -t "$pkgdir/usr/share/man/man1"

    install -Dm644 "assets/rustnet.bash" "$pkgdir/usr/share/bash-completion/completions/rustnet"
    install -Dm644 "assets/_rustnet" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "assets/rustnet.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "assets/rustnet.elv" -t "$pkgdir/usr/share/elvish/lib"
}
