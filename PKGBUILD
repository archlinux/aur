# Maintainer: Matt Taylor <64.delta@proton.me>
pkgname=mlibc
pkgver=2.2.0
pkgrel=2
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

	# The default flags include -fexceptions which requires libgcc.
	CFLAGS=${CFLAGS//"-fexceptions"}
	CXXFLAGS=${CXXFLAGS//"-fexceptions"}

	# The default LDFLAGS includes -z,now which we don't support.
	LDFLAGS=${LDFLAGS//",-z,now"}

	# Install to /usr/share/mlibc so it doesn't conflict with the host libc.
	meson --prefix=/usr/share/mlibc -Dbuild_tests=true -Dbuildtype=release build

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
