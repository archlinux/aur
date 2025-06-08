# Maintainer: Alexander Bocken <aur at bocken.org>

_name=VectorChord
pkgname=${_name,,}
pkgver=0.4.2
pkgrel=1
pkgdesc="Scalable, fast, and disk-friendly vector search in Postgres, successor to pgvecto.rs"
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPLv3')
depends=('postgresql'
	 'pgvector'
)
conflicts=("${_name,,}-bin") # vectorchord-bin does not use 'provides=vectorchord', requires this to resolve
makedepends=(
	'rustup' # currently required to strictly control the toolchain as upstream seems to build with nighly versions and cannot currenty be built with stable
	'clang>=16' # currently requires clang to build, see https://github.com/tensorchord/VectorChord/issues/271
	#'gcc>=14' (should also work but does not)
)

source=("https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
install=info.install

prepare(){
	cd $srcdir/$_name-$pkgver
	export CARGO_HOME="$srcdir/cargo-cache"       # do not litter in ~
	# install the toolchain recorded in rust-toolchain.toml
	rustup toolchain install $(grep -oP '(?<=toolchain = ").*(?=")' rust-toolchain.toml)
	#rustup default $(grep -oP '(?<=toolchain = ").*(?=")' rust-toolchain.toml)

	# pre-download rust dependencies
	cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}
build() {
	cd $srcdir/$_name-$pkgver
  	export CARGO_HOME="$srcdir/cargo-cache"       # do not litter in ~
  	make build
}

package() {
	cd "$srcdir/$_name-$pkgver/build/raw/"
  	install -Dm 755 ./pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  	install -d $pkgdir$(pg_config --sharedir)/extension
  	install -Dm 644 ./sharedir/extension/* $pkgdir$(pg_config --sharedir)/extension/
}
