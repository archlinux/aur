# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=liero-git
_pkgname=liero
pkgver=r281.2d0dc4d
pkgrel=2
pkgdesc="Real-time version of Worms"
arch=('i686' 'x86_64')
license=('custom')
url='http://www.liero.be/'
depends=('sdl2_image')
makedepends=('gendesk' 'cmake' 'unzip')
source=("${pkgname}"::'git+https://github.com/ahockersten/liero.git'
        "http://www.liero.be/download/lierov133winxp.zip"
        "liero.sh"
        "liero.cfg")
noextract=('lierov133winxp.zip')
install='liero.install'
md5sums=('SKIP'
         '6cc57f55bf9654f26406aa796dad5cd4'
         '4375928292421632218faded42596c58'
         '13ce1b6e14648574bb3fd659597174ee')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  gendesk -f -n --pkgname Liero --pkgdesc "${pkgdesc}" --exec "liero" --categories "Game;Shooter;ActionGame"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake .
  make
  unzip -o "${srcdir}/lierov133winxp.zip" -d 'Liero v1.33'
  ./tctool 'Liero v1.33'
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/liero/TC" "${pkgdir}/usr/bin"
  cp -r "TC/Liero v1.33" "${pkgdir}/usr/share/liero/TC"
  install -Dm755 openliero "${pkgdir}/usr/share/liero/openliero"
  install -Dm644 Liero.desktop "${pkgdir}/usr/share/applications/Liero.desktop"
  install -Dm644 pkg/icon.png "${pkgdir}/usr/share/pixmaps/Liero.png"
  install -Dm755 "${srcdir}/liero.sh" "${pkgdir}/usr/bin/liero"
  install -g games -d -m 755 "${pkgdir}/usr/share/liero/Replays"
}
