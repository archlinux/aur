# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-git
pkgver=r974.3865181d
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake python-jsonschema python-jinja)
provides=(advancely)
conflicts=(advancely advancely-bin)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Advancely"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Advancely"

  echo $pkgver > version
}

build() {
  cd "$srcdir/Advancely"

  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  cd "$srcdir/Advancely"

  DESTDIR="$pkgdir" cmake --install build

  install -D -m 644 "version" "${pkgdir}/usr/share/advancely/version"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
