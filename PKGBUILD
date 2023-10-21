# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=plasma-gamemode-git
pkgver=r4.3adea2b
pkgrel=2
pkgdesc="Gamemode UI for the Plasma Desktop"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('x86_64')
url="https://invent.kde.org/sitter/${pkgname%-git}"
license=('MIT' 'BSD' 'GPL2' 'GPL3' 'LGPL' 'custom:CC0')
depends=(
  'gamemode'
  'fontconfig'
  'freetype2'
  'pkgconf'
  'qt5-base>=5.15.0'
  'kcoreaddons5>=5.82'
  'kdbusaddons5>=5.82'
  'ki18n5>=5.82'
  'kdeclarative5>=5.82'
  'kpackage5>=5.82'
  'kservice5>=5.82'
  'plasma-framework5>=5.82')

makedepends=('git' 'cmake>=3.16' 'extra-cmake-modules>=5.82')
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
