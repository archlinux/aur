# Maintainer: Bennett Petzold <dansecob.aur gmail com>

_pkgname='docopt.rs'
pkgname='docopt-wordlist'
pkgver='1.1.1'
pkgrel='2'
pkgdesc='Automated tab completion for Docopt.'
arch=('x86_64')
url='https://github.com/docopt/docopt.rs'
license=('MIT' 'Unlicense')
makedepends=('cargo')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'add_lock.patch')

md5sums=('8322ee987f94f3fae35630c46d6beaf5'
         'ceed5b6ca17960ee47642f022c15c13d')
sha512sums=('5d60e8893ad91ac95f795930a84dff54c644040b74a05ffdd81097875bc99b5279ae91a638e26366e21a3843dec6cc6c526081cd5aa1e4662d516011c81a1274'
            '747f8edd7bbd6e9bac1aeb063d857b04e5dae633710f0923b68ce245bfe9fa5d61f3c987448dd49014bd7546203be960c767c812f2f39c301a5c7268708eb35e')

prepare() {
    cd $_pkgname-$pkgver
    patch --strip=1 --input="$srcdir/add_lock.patch"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd $_pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
