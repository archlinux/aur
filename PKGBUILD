# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sshz
pkgver=1.1.0
pkgrel=1
pkgdesc="TUI SSH connection manager written in Zig with host status monitoring and tags"
arch=('x86_64' 'aarch64')
url="https://github.com/midasdf/sshz"
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "zigzag-0.1.5.tar.gz::https://github.com/meszmate/zigzag/archive/refs/tags/v0.1.5.tar.gz")
noextract=("zigzag-0.1.5.tar.gz")
sha256sums=('aefd575b2336c7611267a97620dd6ed43eccd8e3b41618d143ae71e5a869065b'
            '631810bf71695937a0d96de0b4af36efe3641a698d295bc51652176661dfae95')

prepare() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig fetch "$srcdir/zigzag-0.1.5.tar.gz"
}

build() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build -Doptimize=ReleaseSafe -Dcpu=baseline
}

check() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build test -Dcpu=baseline
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 zig-out/bin/sshz "$pkgdir/usr/bin/sshz"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
