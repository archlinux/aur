# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust-git
pkgver=r698.e162f1be
pkgrel=1
pkgdesc="Tool for building tasks for informatics competitions, with support for cache, distributed computations and more"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/olimpiadi-informatica/task-maker-rust"
license=('MPL2')
depends=()
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
options=()
provides=('task-maker-rust')
conflicts=('task-maker-rust')
source=("git+https://github.com/olimpiadi-informatica/task-maker-rust.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/task-maker-rust"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/task-maker-rust"
    TM_DATA_DIR=/usr/share/task-maker-rust cargo build --release --bins
    target/release/task-maker-tools gen-autocompletion
}

package() {
    cd "$srcdir/task-maker-rust"
    # main binaries
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
