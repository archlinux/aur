# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust
pkgver=0.3.7
pkgrel=1
pkgdesc="The new cmsMake! (this time in Rust)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
source=("https://github.com/edomora97/task-maker-rust/archive/v${pkgver}.tar.gz")
sha256sums=('296556b7c0776f4174a29c134317777ce6e94a6e0e5fde5968791c7e7a90023d')

build() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    TM_DATA_DIR=/usr/share/task-maker-rust cargo build --release
    cargo run --release --bin task-maker-gen-autocompletion
}

package() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    # main binary
    install -Dm755 "target/release/task-maker" "$pkgdir/usr/bin/task-maker-rust"
    # runtime data
    install -dDm755 "$pkgdir/usr/share/task-maker-rust"
    cp -rT data "$pkgdir/usr/share/task-maker-rust"
    # autocompletion files
    install -Dm644 "target/autocompletion/task-maker-rust.bash" "$pkgdir/usr/share/bash-completion/completions/task-maker-rust"
    install -Dm644 "target/autocompletion/_task-maker-rust" "$pkgdir/usr/share/zsh/site-functions/_task-maker-rust"
    install -Dm644 "target/autocompletion/task-maker-rust.fish" "$pkgdir/usr/share/fish/completions/task-maker-rust.fish"
    # vim syntax highlight
    install -Dm644 "tools/vim/ftdetect/cases_gen.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/cases_gen.vim"
    install -Dm644 "tools/vim/syntax/cases_gen.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/cases_gen.vim"
}
