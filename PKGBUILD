pkgname=lazyide-git
pkgver=0.3.94.r0.g0188662
pkgrel=1
pkgdesc="A full IDE experience anywhere you have a terminal. SSH into a server, run lazyide, and pair with your agentic coding tool"
arch=('any')
url="tysonlabs.dev"
license=('MIT')
optdepends=(
    'rust-analyzer: LSP completions, diagnostics, go-to-definition'
    'ripgrep: Project-wide search'
    'git: Branch display, gutter markers'
    )
makedepends=('git' 'rust' 'cargo' 'jaq')
source=("git+https://github.com/TysonLabs/lazyide.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "${pkgname%-*}"
    for file in themes/*.json; do
        jaq -c . "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    done
}

build() {
    cd "${pkgname%-*}"

    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=native \
        -C embed-bitcode=yes \
        -C codegen-units=1 \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,-O3 \
        -C link-arg=-fno-plt \
    "
    cargo build --release
}

package() {
    cd "${pkgname%-*}"

    # Install executable
    install -Dm755 "target/release/${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"

    # Install themes
    install -Dm644 themes/*.json -t "$pkgdir/usr/local/share/${pkgname%-*}/themes"
}
