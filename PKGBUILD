# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.2
pkgrel=1
pkgdesc="Kotatogram – experimental Telegram Desktop fork"
arch=(x86_64)
url="https://kotatogram.github.io"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libdbusmenu-qt5
	hunspell
	libtgvoip
	hicolor-icon-theme
	desktop-file-utils
)
makedepends=(
	git
	python
	cmake
	ninja
	microsoft-gsl
	tl-expected
	range-v3
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin')
source=(
	"${pkgname}::git+https://github.com/kotatogram/${pkgname}.git#tag=k${pkgver}"

	"Catch2::git+https://github.com/catchorg/Catch2.git"
	"crl::git+https://github.com/telegramdesktop/crl.git"
	"GSL::git+https://github.com/Microsoft/GSL.git"
	"libdbusmenu-qt::git+https://github.com/desktop-app/libdbusmenu-qt.git"
	"libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
	"lz4::git+https://github.com/lz4/lz4.git"
	"rlottie::git+https://github.com/desktop-app/rlottie.git"
	"variant::git+https://github.com/mapbox/variant.git"
	"xxHash::git+https://github.com/Cyan4973/xxHash.git"
	"codegen::git+https://github.com/desktop-app/codegen.git"
	"lib_base::git+https://github.com/desktop-app/lib_base.git"
	"lib_crl::git+https://github.com/desktop-app/lib_crl.git"
	"lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
	"lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
	"lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
	"lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
	"lib_tl::git+https://github.com/desktop-app/lib_tl.git"
	"lib_ui::git+https://github.com/kotatogram/lib_ui.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init

	git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
	git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
	git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
	git config submodule.Telegram/ThirdParty/libdbusmenu-qt.url "$srcdir/libdbusmenu-qt"
	git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
	git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
	git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
	git config submodule.Telegram/ThirdParty/SPMediaKeyTap.url "$srcdir/SPMediaKeyTap"
	git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
	git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"

	git config submodule.Telegram/codegen.url "$srcdir/codegen"
	git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
	git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
	git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
	git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
	git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
	git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
	git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
	git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"

	git submodule update
}

build() {
	cd "$srcdir/$pkgname"

	cmake -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
		-DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF

	cmake --build .
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" cmake --install .
}
