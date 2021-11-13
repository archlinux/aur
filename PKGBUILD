# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Mopi <mopi@dotslashplay.it>

pkgbase=play.it-git
pkgname=(play.it-git play.it-games-git)
pkgver=r3072.bbf6b17e
pkgrel=1
arch=('any')
url="https://wiki.dotslashplay.it"
license=('BSD')
makedepends=('pandoc')
source=('git+https://forge.dotslashplay.it/play.it/scripts.git'
        'git+https://forge.dotslashplay.it/play.it/games.git')
sha1sums=('SKIP' 'SKIP')

pkgver() {
  cd scripts
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd scripts
  sed -i '/^\s\+DEFAULT_OPTION_ARCHITECTURE=/s,=.*,=auto,' play.it-2/src/99_init.sh
}

build() {
  cd scripts
  make
}

package_play.it-git() {
  pkgdesc="Easy way to install games on Linux - git version"
  depends=('bash')
  optdepends=(
    'imagemagick: to convert images between formats'
    'libarchive: to extract various archive formats'
    'icoutils: to manipulate Windows icon files'
    'innoextract: to extract some Windows installers'
    'unzip: to extract some archives'
  )
  provides=('play.it')
  conflicts=('play.it')

  cd scripts
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install-library install-wrapper install-manpage
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_play.it-games-git() {
  pkgdesc="Easy way to install games on Linux, game scripts - git version"
  depends=('play.it-git')
  provides=('play.it-games')
  conflicts=('play.it-games')

  cd games
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
}

