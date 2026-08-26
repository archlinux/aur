# Maintainer: Retcinder <tulpenkiste at the domain which is amogus dot cloud>

# Based off of tic-80-git, which is not a -git package... Bad naming I think...

pkgname=tic-80-pro
pkgver=1.1.2837
pkgrel=1
pkgdesc="TIC-80 is a fantasy computer for making, playing and sharing tiny games. This is the pro version, for those who don't have money to buy it."
arch=('x86_64' 'riscv64' 'aarch64' 'i686' 'riscv32' 'armv7h')
url="https://tic80.com"
license=('MIT')

conflicts=('tic80' 'tic-80')

depends=('libglvnd')
makedepends=('git' 'cmake' 'ruby' 'mesa' 'glu' 'coreutils')

source=("git+https://github.com/nesbox/TIC-80.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/TIC-80"
	git submodule update --init --recursive
	patch -Np1 -i "$startdir/SDL2.patch"
}

build() {
	cd "$srcdir/TIC-80/build"
	cmake .. -DBUILD_PRO=On -DBUILD_WITH_ALL=On -DUSE_SYSTEM_SDL2=On -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build . -j $(nproc)
}

package() {
	cd "$srcdir/TIC-80/build"
	cmake --install . --prefix "${pkgdir}/usr"
	# license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/TIC-80/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
