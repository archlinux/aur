# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alex Wiggins <alex.d.wiggins at gmail . com>

pkgname=penguin-subtitle-player
pkgver=1.5.0
pkgrel=3
pkgdesc='Standalone subtitle player'
arch=('x86_64')
url='https://github.com/carsonip/Penguin-Subtitle-Player'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('git')
_commit=ca6a87e7ec3fe4ab0925525bfa771700022c5697  # tags/v1.5.0
source=("git+https://github.com/carsonip/Penguin-Subtitle-Player.git#commit=$_commit"
        'git+https://gitlab.freedesktop.org/uchardet/uchardet.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Penguin-Subtitle-Player
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Penguin-Subtitle-Player
  git submodule init
  git submodule set-url src/uchardet "$srcdir/uchardet"
  git -c protocol.file.allow=always submodule update

  # Add better integration for Linux
  git cherry-pick -n 96ec9e4d7b1adf6de3b3ed71b6c57c8cb362fcae
}

build() {
  cd Penguin-Subtitle-Player
  qmake-qt5 PREFIX=/usr PenguinSubtitlePlayer.pro
  make
}

package() {
  cd Penguin-Subtitle-Player
  make INSTALL_ROOT="$pkgdir" install
}
