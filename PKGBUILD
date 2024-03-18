# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=plasma-gamemode-git
pkgver=r6.4d60358
pkgrel=1
pkgdesc="Gamemode UI for the Plasma Desktop"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('x86_64')
url="https://invent.kde.org/sitter/${pkgname%-git}"
license=('MIT' 'BSD-3-Clause' 'GPL-2.0-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'CC0-1.0')
depends=(
  'kirigami'
  'gcc-libs'
  'gamemode'
  'qt6-base'
  'qt6-declarative'
  'kcoreaddons>=6.0.0'
  'kdbusaddons>=6.0.0'
  'ki18n>=6.0.0'
  'kdeclarative>=6.0.0'
  'libplasma>=6.0.0')

makedepends=('git' 'cmake>=3.16' 'extra-cmake-modules>=6.0.0')
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE='None' \
		-Wno-dev 
	cmake --build build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$srcdir/${pkgname%-git}"/LICENSES/*
}
