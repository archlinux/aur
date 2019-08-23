# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust-git
pkgver=r149.bf5f70a
pkgrel=1
pkgdesc="The new cmsMake"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
depends=()
makedepends=('cargo')
options=()
source=("git+https://github.com/edomora97/task-maker-rust.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/task-maker-rust"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/task-maker-rust"
    git submodule update --init --recursive
    # make sure that tmbox is recompiled and there is only one executable
    rm -f target/release/build/task-maker-exec-*/out/bin/tmbox
    cargo build --release
}

package() {
    cd "$srcdir/task-maker-rust"
    install -Dm755 "target/release/task-maker" "$pkgdir/usr/bin/task-maker-rust"
    tmbox="target/release/build/task-maker-exec-*/out/bin/tmbox"
    tmbox=( $tmbox )
    if [[ "${#tmbox[@]}" != 1 ]]; then
        error "tmbox was not compiled!"
        exit 1
    fi
    install -Dm755 "${tmbox[0]}" "$pkgdir/usr/bin/tmbox"
}

