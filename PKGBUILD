# Maintainer: YuutaW <trumeetc@trumeet.com>
pkgname='telegram-bot-api-git'
pkgver=r98.81f2983
pkgrel=1
pkgdesc="Provides an HTTP API for creating Telegram Bots."
arch=('x86_64')
url="https://github.com/tdlib/telegram-bot-api"
license=('custom')
groups=()
depends=('openssl' 'zlib')
makedepends=('git' 'zlib' 'gperf' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('telegram-bot-api::git+https://github.com/tdlib/telegram-bot-api.git'
'td::git+https://github.com/tdlib/td.git')
noextract=()
md5sums=('SKIP'
'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.td.url $srcdir/td
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	cmake --build .
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}/"
	install -Dm644 "./LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE_1_0.txt"
	cd build
	cmake --build . --target install
}
