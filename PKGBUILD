# Maintainer: Sergius <sergius AT sarbs DOT xyz>
pkgname=sarbs-st-git
pkgver=2026.09.06.r19.gdd97a93
pkgrel=1
pkgdesc="Sergi's build of st (Simple Terminal) teil von SARBS"
arch=('x86_64')
url="https://codeberg.org/Sergius/st"
license=('MIT')
depends=('libx11' 'libxft' 'fontconfig' 'libxrender')
makedepends=('git')
provides=('st')
conflicts=('st')
source=("git+https://codeberg.org/Sergius/st.git")
sha256sums=('SKIP')

pkgver() {
  cd "st"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "st"
  make
}

package() {
  cd "st"

  # Binaries
  install -Dm755 st "${pkgdir}/usr/bin/st"
  install -m755 st-copyout "${pkgdir}/usr/bin/st-copyout"
  install -m755 st-urlhandler "${pkgdir}/usr/bin/st-urlhandler"
  install -m755 st-embedintabbed "${pkgdir}/usr/bin/st-embedintabbed"

  # Manpage
  install -Dm644 st.1 "${pkgdir}/usr/share/man/man1/st.1"
  sed -i "s/VERSION/${pkgver}/g" "${pkgdir}/usr/share/man/man1/st.1"

  # Terminfo: Die st-Einträge werden von ncurses mitgeliefert,
  # daher kein eigener tic-Schritt (würde Dateikonflikte erzeugen).

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
