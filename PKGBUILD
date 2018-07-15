# Maintainer: Jesse Harjunpää <harjuje1@gmail.com>
# Contributor: Jens Adam <jra@byte.cx>

pkgname=bastet
pkgver=0.43.2
pkgrel=2
pkgdesc="Tetris(r) clone with 'bastard' block-choosing AI"
url="http://fph.altervista.org/prog/bastet.html"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('boost-libs' 'ncurses')
makedepends=('boost')
backup=('var/games/bastet.scores2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fph/bastet/archive/${pkgver}.tar.gz" "fix_build_new_boost.patch")
md5sums=('aee009b77b8cf9516d686bd24673800e' '8009e922bd24dd89b896a95ac7004a8a')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/fix_build_new_boost.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # populate files
  install -D bastet "${pkgdir}"/usr/bin/bastet
  install -D -m 0644 bastet.6 "${pkgdir}"/usr/share/man/man6/bastet.6
  install -D -m 0644 bastet.png "${pkgdir}"/usr/share/pixmaps/bastet.png
  install -D -m 0644 bastet.desktop "${pkgdir}"/usr/share/applications/bastet.desktop
  install -D -m 0644 bastet.appdata.xml "${pkgdir}"/usr/share/appdata/bastet.appdata.xml
  for F in AUTHORS INSTALL NEWS README; do
    install -D -m 0644 ${F} "${pkgdir}"/usr/share/doc/bastet/${F}
  done

  # prepare the (optional) global highscore file
  # (users need to be in 'games' group, obviously)
  install -d -m 0775 -g games "${pkgdir}"/var/games
  touch "${pkgdir}"/var/games/bastet.scores2
  chmod 0664 "${pkgdir}"/var/games/bastet.scores2
  chown root:games "${pkgdir}"/var/games/bastet.scores2
}
