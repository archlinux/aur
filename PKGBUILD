# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>
# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=gitahead
pkgver=2.6.3
pkgrel=5
pkgdesc='Understand your Git history!'
url='https://www.gitahead.com/'
arch=(x86_64)
license=(MIT)
depends=(desktop-file-utils
         git
         org.freedesktop.secrets
         qt5-base)
makedepends=(cmake
             qt5-tools
             qt5-translations)
source=("git+https://github.com/$pkgname/$pkgname#tag=v$pkgver"
        "$pkgname.desktop"
        "$pkgname.patch")
sha256sums=('SKIP'
            '254b4e970a942c6ac94df177e54a6169fe7e5f5c5d0d92b6f0c0f03b7b7b2fb0'
            '096e8f3700d7d74884e81eae3282fa1b4fad1cfa7a179ff03f1a7d89867538a0')

prepare() {
	cd "$pkgname"
	patch -p1 < "../gitahead.patch"
	git submodule update --init --recursive
}

build() {
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_PREFIX_PATH=/usr/lib \
		-B build \
		-S "$pkgname"
	cmake --build build
}

package() {
	cd "$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "../$pkgname.desktop"
	cmake --build ../build --target package
	mkdir -p "$pkgdir/usr/"{share,bin}
	cp -r "../build/_CPack_Packages/Linux/STGZ/GitAhead-$pkgver" "$pkgdir/usr/share/gitahead"
	rm -rf "$pkgdir/usr/share/gitahead/"*.so.*
	ln -s "/usr/share/gitahead/GitAhead" "$pkgdir/usr/bin/gitahead"
	cd "$pkgdir/usr/share"
	for s in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "gitahead/Resources/GitAhead.iconset/icon_$s.png" "icons/hicolor/$s/apps/$pkgname.png"
	done
}
