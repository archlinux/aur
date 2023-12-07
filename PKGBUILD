# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust
pkgver=0.5.14
pkgrel=1
pkgdesc="Tool for building tasks for informatics competitions, with support for cache, distributed computations and more"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
source=("https://github.com/edomora97/task-maker-rust/archive/v${pkgver}.tar.gz")
sha256sums=('a43a6a53f205acb398c6690a8f6db7367c543b6d991f13b8aaa248139c3a2367')

build() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    TM_DATA_DIR=/usr/share/task-maker-rust cargo build --release --bins
    target/release/task-maker-tools gen-autocompletion
}

package() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    # main binary
    install -Dm755 "target/release/task-maker" "$pkgdir/usr/bin/task-maker-rust"
    install -Dm755 "target/release/task-maker-tools" "$pkgdir/usr/bin/task-maker-tools"
    # runtime data
    install -dDm755 "$pkgdir/usr/share/task-maker-rust"
    cp -rT data "$pkgdir/usr/share/task-maker-rust"
    # autocompletion files
    install -Dm644 "target/autocompletion/task-maker-rust.bash" "$pkgdir/usr/share/bash-completion/completions/task-maker-rust"
    install -Dm644 "target/autocompletion/_task-maker-rust" "$pkgdir/usr/share/zsh/site-functions/_task-maker-rust"
    install -Dm644 "target/autocompletion/task-maker-rust.fish" "$pkgdir/usr/share/fish/completions/task-maker-rust.fish"
    install -Dm644 "target/autocompletion/task-maker-tools.bash" "$pkgdir/usr/share/bash-completion/completions/task-maker-tools"
    install -Dm644 "target/autocompletion/_task-maker-tools" "$pkgdir/usr/share/zsh/site-functions/_task-maker-tools"
    install -Dm644 "target/autocompletion/task-maker-tools.fish" "$pkgdir/usr/share/fish/completions/task-maker-tools.fish"
    # vim syntax highlight
    install -Dm644 "tools/vim/ftdetect/cases_gen.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/cases_gen.vim"
    install -Dm644 "tools/vim/syntax/cases_gen.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/cases_gen.vim"
}
