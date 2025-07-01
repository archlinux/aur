# Maintainer: Alexander Bocken <aur at bocken.org>

_name=VectorChord
pkgname=${_name,,}
pkgver=0.4.3
pkgrel=2
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
	'clang>=16' # upstream builds with clang, claims to work with gcc but does not yet
	# 'gcc>=14' # part of base-devel and hence preferred to clang
	'pgvector'
)

source=("https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d3045b018ddf22fecbe65e56079e2254869b75f14ed3aa9f7bd0cce81ea727ce')
install=info.install

prepare(){
	cd $srcdir/$_name-$pkgver
	export CARGO_HOME="$srcdir/cargo-cache"       # do not litter in ~
	# install the toolchain recorded in rust-toolchain.toml
	_toolchain=$(grep -oP 'channel\s*=\s*"\Knightly-[^"]+' rust-toolchain.toml)
	msg "Installing required rust toolchain from rust-toolchain.toml: $_toolchain"
	rustup toolchain install "$_toolchain"
	# pre-download rust dependencies already in prepare()
	cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}
build() {
	cd $srcdir/$_name-$pkgver
	# export CC=gcc # does not yet work with gcc
  	export CARGO_HOME="$srcdir/cargo-cache"       # do not litter in ~
	export RUST_BACKTRACE=1 # show backtrace on error
  	make build
}

package() {
	cd "$srcdir/$_name-$pkgver/build/raw/"
  	install -Dm 755 ./pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  	install -d $pkgdir$(pg_config --sharedir)/extension
  	install -Dm 644 ./sharedir/extension/* $pkgdir$(pg_config --sharedir)/extension/
}
