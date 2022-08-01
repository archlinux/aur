# Maintainer: Bennett Petzold <dansecob.aur gmail com>

_pkgname='docopt.rs'
pkgname='docopt-wordlist'
pkgver='1.1.1'
pkgrel='1'
pkgdesc='Automated tab completion for Docopt.'
arch=('x86_64')
url='https://github.com/docopt/docopt.rs'
license=('MIT' 'Unlicense')
makedepends=('cargo'
			 'auth-tarball-from-git')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'add_lock.patch')
_pgpkeys=('BurntSushi.gpg')
source+=(${_pgpkeys[@]})

md5sums=('8322ee987f94f3fae35630c46d6beaf5'
         'ceed5b6ca17960ee47642f022c15c13d'
         'd26e0ad3ddfaac4be51d2379e5e3bfbb')
sha512sums=('5d60e8893ad91ac95f795930a84dff54c644040b74a05ffdd81097875bc99b5279ae91a638e26366e21a3843dec6cc6c526081cd5aa1e4662d516011c81a1274'
            '747f8edd7bbd6e9bac1aeb063d857b04e5dae633710f0923b68ce245bfe9fa5d61f3c987448dd49014bd7546203be960c767c812f2f39c301a5c7268708eb35e'
            'ea911e330941281e1533d64b0cb22256e965f1481023f67d616f5b0606b1503763a44bad264541c6223497f796cc76b62406a45df35a852d95d8e4b8f7fea409')

prepare() {
	auth-tarball-from-git --tag $pkgver --prefix $_pkgname-$pkgver ${_pgpkeys[@]/#/--keyring } $url.git $_pkgname-$pkgver.tar.gz
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
