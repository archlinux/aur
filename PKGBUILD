# Slidown 2 development package
pkgname=slidown-git
pkgver=2.0.0.r0
pkgrel=1
pkgdesc='Native GTK4 live Markdown presentation viewer powered by Pandoc and Reveal.js'
arch=('x86_64')
url='https://github.com/riccardomarotti/slidown'
license=('GPL-3.0-only' 'MIT')
depends=('gtk4>=4.10' 'webkitgtk-6.0' 'pandoc-cli' 'glibc' 'gcc-libs')
makedepends=('git' 'rust' 'pkgconf' 'desktop-file-utils')
optdepends=('chromium: export slides to PDF')
provides=('slidown')
conflicts=('slidown')
source=('slidown::git+https://github.com/riccardomarotti/slidown.git#branch=master'
        'reveal.js::git+https://github.com/hakimel/reveal.js.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/slidown"
    local version
    version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n 1)
    version=${version/-alpha./alpha}
    version=${version/-rc./rc}
    printf '%s.r%s.g%s' "${version//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/slidown"
    git submodule init
    git config submodule.slidown/reveal.js.url "$srcdir/reveal.js"
    git -c protocol.file.allow=always submodule update --init

    rm -rf "$srcdir/reveal-runtime"
    bash packaging/prepare-reveal.sh reveal.js "$srcdir/reveal-runtime"

    export CARGO_HOME="$srcdir/cargo-home"
    # Reused makepkg checkouts may contain an untracked lockfile from an
    # older revision. Refresh it during prepare, not during the frozen build.
    # Respect a committed lockfile once the project provides one.
    if git ls-files --error-unmatch Cargo.lock >/dev/null 2>&1; then
        cargo fetch --locked
    else
        cargo fetch
    fi
}

build() {
    cd "$srcdir/slidown"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/slidown"
    export CARGO_HOME="$srcdir/cargo-home"
    export SLIDOWN_REVEAL_DIR="$srcdir/reveal-runtime"
    cargo test --frozen --all-targets
    desktop-file-validate data/io.github.riccardomarotti.Slidown.desktop
}

package() {
    cd "$srcdir/slidown"
    install -Dm755 target/release/slidown "$pkgdir/usr/bin/slidown"
    install -Dm644 data/io.github.riccardomarotti.Slidown.desktop \
        "$pkgdir/usr/share/applications/io.github.riccardomarotti.Slidown.desktop"
    install -Dm644 icon/slidown.png "$pkgdir/usr/share/pixmaps/slidown.png"
    install -dm755 "$pkgdir/usr/share/slidown/reveal.js"
    cp -a "$srcdir/reveal-runtime/." "$pkgdir/usr/share/slidown/reveal.js/"
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 reveal.js/LICENSE "$pkgdir/usr/share/licenses/$pkgname/REVEAL-LICENSE"
    install -Dm644 README-v2.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
