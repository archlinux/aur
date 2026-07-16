# Maintainer: mfwolffe
# AUR package for tally. Activates once the GitHub repo/release is public.
pkgname=tally
pkgver=0.2.0
pkgrel=1
pkgdesc="GNU wc reimplementation: byte-identical output, SIMD word counting"
arch=('x86_64' 'aarch64')
url="https://github.com/tenseleyFlow/tally"
license=('GPL-3.0-or-later')
makedepends=('gcc')
source=("$url/releases/download/v$pkgver/tally-$pkgver.tar.gz")
sha256sums=('75ee496b0b822bd9c9d20caf045df1fe2a8e00fd38f4a66d67e155f2d246a7ae')

build() {
	cd "$pkgname-$pkgver"
	./configure
	# Respect makepkg CFLAGS; no -march=native anywhere — kernels are
	# per-TU with runtime dispatch.
	make release
}

# No check(): the test suite builds GNU wc from source as its parity
# oracle (network fetch), which clean-chroot builds forbid. The release
# pipeline runs the full suite + perf gate before tagging.

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
