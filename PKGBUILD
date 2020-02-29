# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust-git
pkgver=r374.bee9c3d
pkgrel=1
pkgdesc="The new cmsMake"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
depends=()
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
options=()
provides=('task-maker-rust')
conflicts=('task-maker-rust')
source=("git+https://github.com/edomora97/task-maker-rust.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/task-maker-rust"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/task-maker-rust"
    TM_DATA_DIR=/usr/share/task-maker-rust cargo build --release
    cargo run --release --bin task-maker-gen-autocompletion
}

package() {
    cd "$srcdir/task-maker-rust"
    install -Dm755 "target/release/task-maker" "$pkgdir/usr/bin/task-maker-rust"
    install -dDm755 "$pkgdir/usr/share/task-maker-rust"
    cp -rT data "$pkgdir/usr/share/task-maker-rust"
    install -Dm644 "target/autocompletion/task-maker-rust.bash" "$pkgdir/usr/share/bash-completion/completions/task-maker-rust"
    install -Dm644 "target/autocompletion/_task-maker-rust" "$pkgdir/usr/share/zsh/site-functions/_task-maker-rust"
    install -Dm644 "target/autocompletion/task-maker-rust.fish" "$pkgdir/usr/share/fish/completions/task-maker-rust.fish"
}

