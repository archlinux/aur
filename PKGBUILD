# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.12.1
pkgrel=2
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'qt6-base' 'libstdc++' 'libgcc')
makedepends=('ninja' 'cmake' 'git' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"git+https://github.com/SpartanJ/efsw.git"
	"git+https://github.com/p-ranav/indicators.git"
	"git+https://github.com/Tencent/rapidjson.git"
	"bump-bcdec.patch::https://github.com/craftablescience/sourcepp/commit/e2e3482251d51ff70669459de7de581634be2027.patch"
	"bump-minizip.patch::https://github.com/craftablescience/sourcepp/commit/cdabda52e78f49b6c66c3824114b90c6bef97f12.patch"
	"bump-minizip2.patch::https://github.com/craftablescience/sourcepp/commit/ddcf3d2d23adef9651693afd35f602cccd8e3469.patch"
	"bump-minizip3.patch::https://github.com/craftablescience/sourcepp/commit/408f23af649d7f985802d2f54df16e0fa1d50513.patch"
	)
sha256sums=('7061e430c6b94acbb761dc34961f619abba9a4383fe174af5c9984e1d2c19a2d'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b268b4269adad2bfeda81c449f68442c696793993b40a2a21f486c3f1e0c2e7e'
            'd8093c193ffcc74758fde24ef6e0f5efb21c9d18558ef4a864fe10dcb07c25cb'
            '692d0c294eedd91671988d6f8b2ce286921a093fd977d31e7f3ac6feed1c1ebf'
            '2fb9f3bffd958a5fba47a0b397b625eb30c54a7087d12768aa309a87c4de6738')
replaces=("vtf-thumbnailer") #vtf-thumbnailer was merged
conflicts=("vtf-thumbnailer")

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {sourcepp,argparse,efsw,indicators,discord};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
	pushd ext/sourcepp
	patch -Np1 < "$srcdir/bump-bcdec.patch"
	patch -Np1 < "$srcdir/bump-minizip.patch"
	patch -Np1 < "$srcdir/bump-minizip2.patch"
	patch -Np1 < "$srcdir/bump-minizip3.patch"

	cd "$srcdir/$pkgname/ext/discord"
	git submodule init
	git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DMARETF_BUILD_INSTALLER=ON \
	-DCPACK_GENERATOR=RPM \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_SKIP_INSTALL_RPATH=YES

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
