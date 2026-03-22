# Maintainer: Sergius <sergius@codeberg.org>
pkgname=sarbs-st-git
pkgver=r14.422b45e
pkgrel=1
pkgdesc="Simple terminal implementation for X - Sergius' fork (st)"
arch=('x86_64')
url="https://codeberg.org/Sergius/st"
license=('MIT')
depends=('libx11' 'libxft' 'fontconfig' 'libxrender')
makedepends=('git' 'ncurses')
provides=('st')
conflicts=('st')
source=("git+https://codeberg.org/Sergius/st.git")
md5sums=('SKIP')

pkgver() {
  cd "st"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  
  # Terminfo - crucial for st to work correctly
  mkdir -p "${pkgdir}/usr/share/terminfo"
  tic -sx -o "${pkgdir}/usr/share/terminfo" st.info
  
  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
