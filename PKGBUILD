# Maintainer: mfwolffe
# AUR package for liszt. Activates once the GitHub repo/release is public.
#
# NOTE: Arch's mtools package owns /usr/bin/lz, so this package does
# NOT install the lz alias (upstream default elsewhere). Create your own
# symlink if you do not use mtools; decision recorded in the README.
pkgname=liszt
pkgver=0.1.0
pkgrel=1
pkgdesc="GNU ls reimplementation: byte-identical output, radix sorts, parallel stat"
arch=('x86_64' 'aarch64')
url="https://github.com/tenseleyFlow/liszt"
license=('GPL-3.0-or-later')
makedepends=('gcc')
source=("$url/releases/download/v$pkgver/liszt-$pkgver.tar.gz")
sha256sums=('62be1698a0a8c767056be3e4fbc03812d97adc152643f2a559cad241ef825eb8')

build() {
	cd "$pkgname-$pkgver"
	./configure
	# Respect makepkg CFLAGS; no -march=native anywhere - kernels are
	# baseline SIMD with scalar tails.
	make
}

# Unit suite is self-contained; the golden parity suite builds GNU ls
# from source as its oracle (network fetch), which clean-chroot builds
# forbid. The release pipeline runs the full suite before tagging.
check() {
	cd "$pkgname-$pkgver"
	sh tests/unit/run.sh
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	# mtools conflict: drop the alias and its man page on Arch.
	rm "$pkgdir/usr/bin/lz" "$pkgdir/usr/share/man/man1/lz.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
