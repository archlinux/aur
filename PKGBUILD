# Maintainer: Masanori Ogino <masanori.ogino@gmail.com>

pkgname=ypsilon-scheme2
pkgver=2.0.8
pkgrel=3
epoch=
pkgdesc="R7RS/R6RS Scheme implementation"
arch=(x86_64 i686)
url="https://github.com/fujita-y/ypsilon"
license=('custom:BSD-2-Clause')

depends=('llvm>=10' 'llvm<15')
makedepends=('clang' 'cmake' 'lld')
optdepends=('rlwrap: readline support')

source=("ypsilon-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        0001-rename-to-ypsilon2.patch
        0002-use-__FILE_NAME__-Clang-extension.patch
        0003-supports-llvm-14.patch)
sha256sums=('355c95d5e4ba6f549f3efde4773d8e9e21b4154bde19a21b4ef7a57006501288'
            'aaec0de23c27a65ca965b760eaae99188bd3c69f3d636604c100f108624ef71d'
            '9de678399687da197f0fe8b77a6631e2ff343f90b42bf8b7e0915b2f5325bb27'
            '969237b15c3a7e44d47bb4220e84828dc644828abd102802fb99c3206b3ba0f8')

build() {
	cd "ypsilon-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/0001-rename-to-ypsilon2.patch"
	patch --forward --strip=1 --input="${srcdir}/0002-use-__FILE_NAME__-Clang-extension.patch"
        patch --forward --strip=1 --input="${srcdir}/0003-supports-llvm-14.patch"
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
