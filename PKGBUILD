# Maintainer: cr3eperall <38960200+cr3eperall@users.noreply.github.com>

_pkgname=dynisland
pkgname=$_pkgname-git
pkgver=0.1.4.r0.g98ad46d
pkgrel=1
pkgdesc="A Dynamic Island bar written in Rust"
arch=('x86_64')
url="https://github.com/cr3eperall/dynisland"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'mimalloc')
makedepends=('git' 'cargo' 'mimalloc') 
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd $_pkgname
    git submodule init
    git submodule update
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features embed_modules,completions
}

package() {
    cd $_pkgname

    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "target/_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 "target/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname.bash"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "target/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

}
