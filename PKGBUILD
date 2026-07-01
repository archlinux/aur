# Maintainer: Nik <acidnik@users.noreply.github.com>
# Contributor: Nik <acidnik@users.noreply.github.com>

pkgname=parch
pkgver=0.2.0
pkgrel=2
pkgdesc="A user-friendly wrapper over paru/pacman for Arch Linux"
arch=('x86_64')
url="https://github.com/acidnik/parch"
license=('MIT')
depends=('paru' 'pacman')
optdepends=('pkgfile: search files in all packages via whichpkg -a')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/acidnik/parch.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname"
    ./target/release/parch --help >/dev/null 2>&1
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/parch "$pkgdir/usr/bin/parch"

    # Fish completions
    install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/parch.fish" \
        < <(./target/release/parch completions)
}
