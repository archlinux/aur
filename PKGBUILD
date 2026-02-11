# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-git
pkgver=r685.eeb863e
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake)
provides=(advancely)
conflicts=(advancely advancely-bin)
source=("git+$url"
        "launcher"
        "https://raw.githubusercontent.com/LNXSeus/Advancely/refs/heads/main/packaging/linux/advancely.png"
        "advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('SKIP'
            'f1ebe29085984bac0719a8ab7a911075208ea189e3b0c3b6c40179f7df54f80c'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            '7c18cf9f6781c08003aa13fe9ce08ebdf9b54f61fc806d77d29a51e925142b36')

pkgver() {
	cd "$srcdir/Advancely"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
