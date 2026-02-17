# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-git
pkgver=r700.4a53bcc
pkgrel=2
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake)
provides=(advancely)
conflicts=(advancely advancely-bin)
source=("git+$url"
        "launcher::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/heads/linux/packaging/linux/launcher"
        "advancely.png::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/heads/linux/packaging/linux/advancely.png"
        "advancely.desktop::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/heads/linux/packaging/linux/advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/heads/linux/LICENSES.txt")
sha256sums=('SKIP'
            '111527682cf029c30fd09250c494cee576b88b487e29fe0f6a179cc82d378133'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            'f14cf9ae123aa2d5bd975b8766adba9dbe41ac736ff7022b27349cd795970140')

pkgver() {
	cd "$srcdir/Advancely"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  echo $pkgver > version
}

build() {
  cd "$srcdir/Advancely"

  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "$srcdir/Advancely"

  mkdir -p "${pkgdir}/usr/share/${_pkgname}"

  install -D -m 755 "build/Advancely" "${pkgdir}/usr/share/${_pkgname}/Advancely"
  cp -r resources "${pkgdir}/usr/share/${_pkgname}/"
}
