# Maintainer: bigsmoke <and_a_large_soda et proton DOT me>
pkgname=darkfi-git
pkgver=v0.3.0.r2916.ge0f106ce
pkgrel=1
# epoch=
pkgdesc="A blockchain designed with anonimity at the forefront, utilizing zk cryptography."
arch=('any')
url="https://darkrenaissance.github.io/darkfi/"
license=('AGPL')
#groups=()
depends=(openssl mpg123)
makedepends=(rustup make jq gcc pkgconf git)
#checkdepends=()
#optdepends=()
provides=(darkfid dnetview drk faucetd ircd vanityaddr zkas)
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
	# if it does not compile then you can try checking out a stable commit with git here
	# git checkout <some hash>
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {}

build() {
	cd "$pkgname"

	[ "$(rustup toolchain list)" == "no installed toolchains" ] && rustup default stable
	[ -z "$(rustup target list --installed | grep $_rst_target)" ] && rustup target add $_rst_target 

	make
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
