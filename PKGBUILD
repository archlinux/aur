# Maintainer: Masanori Ogino <masanori.ogino@gmail.com>

pkgname=ypsilon-scheme2
pkgver=2.0.8
pkgrel=1
epoch=
pkgdesc="R7RS/R6RS Scheme implementation"
arch=(x86_64 i686)
url="https://github.com/fujita-y/ypsilon"
license=('custom:BSD-2-Clause')

depends=('llvm')
makedepends=('clang' 'cmake' 'lld')

source=($url/archive/v$pkgver.tar.gz
        0001-rename-to-ypsilon2.patch
        0002-use-__FILE_NAME__-Clang-extension.patch)
sha256sums=('355c95d5e4ba6f549f3efde4773d8e9e21b4154bde19a21b4ef7a57006501288'
            'ded702bcc0ad82d84bee5db209a933b6c11aba779fa540d3d5a967b5a2d2c118'
            'b40cdde226e2cf9c9f6e326c30d8cb6bed07104e0b8be00b71ea78ccc74fb58c')

build() {
	cd "ypsilon-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/0001-rename-to-ypsilon2.patch"
	patch --forward --strip=1 --input="${srcdir}/0002-use-__FILE_NAME__-Clang-extension.patch"
	mkdir -p "build"
	cd "build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ ..
	make
}

check() {
	cd "ypsilon-$pkgver/build"
	make test
}

package() {
	cd "ypsilon-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
