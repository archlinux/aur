# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=quickshell
pkgver=0.1.2e18340
pkgrel=1
pkgdesc='Simple and flexbile QtQuick based desktop shell toolkit.'
arch=(x86_64 aarch64)
url='https://github.com/outfoxxed/quickshell'
conflicts=("quickshell")
provides=("quickshell=${pkgver%%.r*}")
options=(!strip)
license=('GPL')
depends=(
	'qt6-declarative'
	'qt6-base'
	'jemalloc'
	'qt6-svg'
	'libpipewire'
	'qt6-wayland'
	'wayland-protocols'
	'libxcb'
	'wayland'
	'cli11'
	'google-breakpad'
)
makedepends=(
	'ninja'
	'cmake'
	'pkgconf'
)

source=(
	"git+https://github.com/outfoxxed/quickshell.git"

)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/quickshell"
	printf "0.1.%s" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	cmake -GNinja -B build \
		-DCMAKE_BUILD_TYPE="RelWithDebInfo" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISTRIBUTOR="AUR (package: quickshell)" \
		-DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO \
		-DINSTALL_QML_PREFIX=/lib/qt6/qml

	cmake --build build
}

package() {
	cd "${pkgname}"
	DESTDIR=$pkgdir cmake --install build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "../../quickshell-check.hook" "$pkgdir/usr/share/libalpm/hooks/quickshell-check.hook"
}
