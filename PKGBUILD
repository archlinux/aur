# Maintainer: Jonathan Keyuk <jonkero2 at gmail dot com>
basename=jdbrowser
pkgname=${basename}-git
pkgver=1.2
pkgrel=1
pkgdesc="Terminal TUI Sqlite Browser"
arch=('x86_64')
url="https://github.com/Jkeyuk/JDbrowser"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'cargo')
source=("${basename}::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$basename"
  git describe --long --tags --abbrev=7 | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$basename"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$basename/LICENSE"
}

package() {
	cd "$basename"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$basename"
}
