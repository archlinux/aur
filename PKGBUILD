# Maintainer: mfwolffe
# AUR package for liszt. Activates once the GitHub repo/release is public.
#
# NOTE: Arch's mtools package owns /usr/bin/lz, so this package does
# NOT install the lz alias (upstream default elsewhere). Create your own
# symlink if you do not use mtools; decision recorded in the README.
pkgname=liszt
pkgver=0.2.0
pkgrel=1
pkgdesc="GNU ls reimplementation: byte-identical output, radix sorts, parallel stat"
arch=('x86_64' 'aarch64')
url="https://github.com/tenseleyFlow/liszt"
license=('GPL-3.0-or-later')
makedepends=('gcc')
source=("$url/releases/download/v$pkgver/liszt-$pkgver.tar.gz")
sha256sums=('c045e8827f1efdae466a7d83cc32cd96b911a3fa27394aa76a2fa028490b1e30')

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
