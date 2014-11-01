# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=cdogs-git
pkgver=0.5.6.r215.ga1ac1b7
pkgrel=1
pkgdesc='SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2", development version)'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'physfs')
makedepends=('git' 'cmake')
conflicts=('cdogs')
provides=('cdogs')
source=(cdogs::"git+https://github.com/cxong/cdogs-sdl.git"
        "git+https://github.com/cxong/hqx.git"
        "git+https://github.com/cxong/cbehave.git"
        "git+https://github.com/cxong/rlutil.git"
        "git+https://github.com/cxong/tinydir.git")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd cdogs
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd cdogs

  # disable -Werror (aborts build) and change data directory
  sed 's| -Werror||;s|CDOGS_DATA_DIR "../"|CDOGS_DATA_DIR "/usr/share/cdogs/"|' \
    -i CMakeLists.txt

  # change name in .desktop file
  sed 's|cdogs-sdl|cdogs|g' -i build/linux/cdogs-sdl.desktop

  # submodules magic
  git submodule init
  git config submodule.src/cdogs/hqx.url "$srcdir"/hqx
  git config submodule.src/tinydir.url "$srcdir"/tinydir
  git config submodule.src/tests/cbehave.url "$srcdir"/cbehave
  git submodule update
  cd src/tests/cbehave
  git config submodule.rlutil.url "$srcdir"/rlutil
  git submodule update
}

build() {
  cd cdogs

  cmake ./
  make
}

package() {
  cd cdogs

  # binary
  install -Dm755 src/cdogs-sdl "$pkgdir"/usr/bin/cdogs
  # data
  install -d "$pkgdir"/usr/share/cdogs
  cp -r data doc dogfights graphics missions music sounds "$pkgdir"/usr/share/cdogs
  # doc
  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/share/cdogs/doc "$pkgdir"/usr/share/doc/cdogs
  # .desktop entry
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs.desktop
}
