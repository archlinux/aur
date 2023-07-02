# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
pkgname=kde-thumbnailer-qoi
commit_num=10
commit_hash=c75b6185e0a70b16e7ba2e1601c4766290909a03
qoi_commit_hash=7094132132f76df0239e4954ecbd91f855c8d6a2
pkgver=${commit_num}_${commit_hash}
pkgrel=1
pkgdesc="KDE thumbnailer for QOI (Quite OK Image Format)"
arch=(x86_64)
url="https://github.com/tobozo/kde-thumbnailer-qoi"
license=('MIT')
depends=(plasma-desktop)
makedepends=(cmake extra-cmake-modules git libgsf)
source=("$pkgname::git+https://github.com/tobozo/kde-thumbnailer-qoi.git#commit=$commit_hash"
        "qoi::git+https://github.com/phoboslab/qoi.git#commit=$qoi_commit_hash")
md5sums=(SKIP SKIP)

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule.qoi.url "$srcdir/qoi"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$pkgname/mime/q-qoi.xml" "$pkgdir/usr/share/mime/packages/q-qoi.xml"
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
