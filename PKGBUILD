# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=torrent7z
pkgver=1.3
pkgrel=2
pkgdesc="A derivative of 7zip that produces invariant .7z archives for torrenting"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/BubblesInTheTub/torrent7z"
license=('GPL3')
depends=('gcc-libs')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	'fix-gcc-error.patch'
)
b2sums=(
	'61fae6f2938ef4eebd4c7718e152c3b220dcf7446c479014a5f788b70bdb63c6f0cbf81d4467f18ef9db3ef84abe066865b03a50429435ace95003a44d19cbae'
	'8bfb5314e5c6055d7d9611c0f73f0d3fc42b0e8f5843eed8c841ec6919587ef193ff44c0a50f12170881e3f4542124c0d20a56fbdc75c148f84a44e2dcced376'
)

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 < ../fix-gcc-error.patch
	sed -i -E 's/^(\s*(CFLAGS|CXXFLAGS)\s*):?=/\1+=/' linux_src/p7zip_4.65/makefile.glb
	sed -i '/fprintf/s/kSep/"%s", &/' linux_src/p7zip_4.65/CPP/7zip/Compress/LZMA_Alone/LzmaBenchCon.cpp
}

build() {
	make -C $pkgname-$pkgver/linux_src/p7zip_4.65
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin $pkgname-$pkgver/linux_src/p7zip_4.65/bin/t7z
}
