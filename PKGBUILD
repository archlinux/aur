# Maintainer: bigsmoke <and_a_large_soda et proton DOT me>
pkgname=darkfi-git
pkgver=v0.4.1.r977.ge23fb30604
pkgrel=2
# epoch=
pkgdesc="A blockchain designed with anonimity at the forefront, utilizing zk cryptography."
arch=('any')
url="https://darkrenaissance.github.io/darkfi/"
license=('AGPL')
#groups=()
depends=(openssl mpg123)
makedepends=(rustup make jq gcc pkgconf git alsa-lib)
#checkdepends=()
#optdepends=()
provides=(darkfid faucetd drk darkirc vanityaddr tau taud)
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=($pkgname::git+https://github.com/darkrenaissance/darkfi.git)
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

_rst_target="wasm32-unknown-unknown"

pkgver() {
	cd "$srcdir/$pkgname"

	# We are building from master, but if you want to build from tag
	# Then do below here and also check instructions below
	# git checkout $(git tag -l | tail -n 1)

	# Get version
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {}

build() {
	cd "$pkgname"

	[ -z "$(rustup toolchain list | grep "stable")" ] && rustup default stable
	[ -z "$(rustup toolchain list | grep "nightly")" ] && rustup default nightly

	[ -z "$(rustup target list --installed --toolchain stable | grep $_rst_target)" ] && rustup target add $_rst_target
	[ -z "$(rustup target list --installed --toolchain nightly | grep $_rst_target)" ] && rustup target add $_rst_target --toolchain nightly

	make
}

package() {
	cd "$srcdir/$pkgname"

	# We are building from master, but if you want to build from tag do below
	# git checkout $(git tag -l | tail -n 1)

	# make from latest tag
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
