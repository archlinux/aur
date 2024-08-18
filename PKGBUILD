# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=maelstrom-git
pkgver=r11.767d95c
pkgrel=4
pkgdesc='Asteroids-type game with sound and 3D objects'
arch=('x86_64')
license=('GPL')
url="https://github.com/libsdl-org/Maelstrom"
conflicts=(maelstrom)
provides=(maelstrom)
depends=('sdl_net' 'gcc-libs')
source=("git+$url"
        "Maelstrom.desktop")
sha512sums=('SKIP'
            'c190b121cc2043dfb1d60b46af7b9298abdcf73584b399bd034a3a5036462eb41407f7d3f2a01c9485e2ea3a1ed09ff211774c34f1a381be99b3f4e9ae01c641')

pkgver() {
  cd "${srcdir}/Maelstrom"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Maelstrom"

  ./autogen.sh

  sed -i -e 's/games\/\$PACKAGE/share\/\$PACKAGE/g' configure

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/Maelstrom"

  make prefix="${pkgdir}/usr" install

  install -d "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -m644 "${srcdir}/Maelstrom.desktop" "${pkgdir}/usr/share/applications/Maelstrom.desktop"
  ln -s ../share/Maelstrom/Maelstrom "$pkgdir"/usr/bin/Maelstrom
}

