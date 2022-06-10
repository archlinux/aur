# Maintainer: Matt Taylor <64.delta@proton.me>
pkgname=mlibc
pkgver=2.2.0
pkgrel=1
pkgdesc="A portable C standard library"
arch=(x86_64)
url="https://github.com/managarm/mlibc"
license=('MIT')
groups=()
depends=('bash')
makedepends=('meson' 'ninja')
checkdepends=('meson' 'ninja')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/managarm/mlibc/archive/refs/tags/$pkgver.tar.gz")
noextract=()
md5sums=('28a0f504a620da6344eb1d44f8760aa4')
validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"

	# The default CFLAGS includes -fexceptions which is a problem for us.
	CFLAGS="-march=native -O3 -pipe"
	CXXFLAGS="${CFLAGS}"
	# The default LDFLAGS includes -z,now which we don't support.
	LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro"

	meson --prefix=/usr/share/mlibc -Dbuild_tests=true build

	cd build
	ninja
}

check() {
	cd "$pkgname-$pkgver/build"
	meson test
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" ninja install

	install -Dm755 "$pkgdir/usr/share/mlibc/bin/mlibc-gcc" "$pkgdir/usr/bin/mlibc-gcc"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
