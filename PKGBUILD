# Contributor: mewmew <rnd0x00@gmail.com>
# Contributor: Robin Eklind <rnd0x00@gmail.com>
# Contributor: Benjamin Levy <blevy@protonmail.com>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Maintainer : xiliuya <xiliuya@aliyun.com>

pkgname=retdec-git
pkgver=v5.0.r81.g94505857
pkgrel=1
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('i686' 'x86_64')
url="https://retdec.com/"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('git' 'cmake')
optdepends=('upx' 'graphviz')
options=(!debug)
provides=('retdec')
conflicts=('retdec')
source=("$pkgname::git+https://github.com/avast/retdec.git"
	gcc15.patch)
sha256sums=('SKIP'
	'06f610199a13b9832b152a7f62b6256f5b43a6d73927a9366c4cdca0289e32f0')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build && cd build
	export CMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make install
	cd "$srcdir/$pkgname"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
