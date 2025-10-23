# Maintainer: Alexander Bocken <aur at bocken.org>

_name=VectorChord
pkgname=${_name,,}
pkgver=0.5.3
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
	'cargo'
	# 'clang>=16' # upstream builds with clang, but gcc also works and is part of base-devel, hence preferred
	'pgvector'
)

source=("https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('38e20bd299d15a9ffd6464e649f630282a26df7f1a9df3cefe729634e3e1545d')
install=info.install

prepare(){
	cd $srcdir/$_name-$pkgver
	export CARGO_HOME="$srcdir/cargo-cache"       # do not litter in ~
        #force update for 'rustup' package users (not necesarry for 'rust' package users)
	pacman -Qo $(which cargo) | grep -q rustup && rustup update && rustup default stable
	# pre-download rust dependencies already in prepare()
	cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}
build() {
	cd $srcdir/$_name-$pkgver
	export CC=gcc # disable this if you want to build with clang
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
