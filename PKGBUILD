# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=cdogs
pkgname=$_pkgbase-git
pkgver=0.5.3.r93.gf4d0495
pkgrel=1
pkgdesc='SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2", development version)'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl_mixer')
makedepends=('git' 'cmake')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
source=($_pkgbase::"git+https://github.com/cxong/cdogs-sdl.git"
        "git+https://github.com/cxong/hqx.git"
        "git+https://github.com/cxong/tinydir.git"
        "git+https://github.com/cxong/cbehave.git"
        "git+https://github.com/cxong/rlutil.git")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $_pkgbase

  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase

  # disable -Werror (aborts build)
  sed 's|add_definitions(-Winline -Werror)|add_definitions(-Winline)|' -i CMakeLists.txt

  # fix name in .desktop file
  sed 's|Exec=cdogs-sdl|Exec=cdogs|g' -i build/linux/cdogs-sdl.desktop

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
  cd $_pkgbase

  cmake ./ -DDESTDIR=/opt/cdogs/bin
  make
}

package() {
  cd $_pkgbase

  # launcher + binary
  install -Dm755 build/linux/cdogs-sdl "$pkgdir"/usr/bin/cdogs
  install -Dm755 src/cdogs-sdl "$pkgdir"/opt/cdogs/bin/cdogs-sdl
  # data
  cp -r dogfights graphics missions music sounds "$pkgdir"/opt/cdogs/
  # doc
  install -d "$pkgdir"/usr/share/doc/cdogs
  cp -r doc/* "$pkgdir"/usr/share/doc/cdogs
  ln -s /usr/share/doc/cdogs/ "$pkgdir"/opt/cdogs/doc
  # .desktop file
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs_icon.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs.desktop
}
