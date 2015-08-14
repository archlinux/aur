# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=arx-git
pkgver=1.1.2.r5464.gc87968a
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person fantasy RPG (executables only; Git version)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'devil' 'openal' 'zlib' 'boost' 'glew' 'mesa' 'libgl')
optdepends=('arxfatalis-data-gog: game data from GOG.com installer'
            'arxfatalis-data-copy: game data from existing win32 installation'
            'arxfatalis-data-demo: game data from official freeware demo'
            'qt: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports')
makedepends=('git' 'cmake')
provides=('arx')
conflicts=('arx')
install=arx.install

_gitname=ArxLibertatis
source=(git+https://github.com/arx/ArxLibertatis.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    _version=$(git describe --tags $(git rev-list --tags --max-count=1))
    _commits=$(git log 1.1.2..master --pretty=oneline | wc -l)
    _rev=$(git log -1 --format="%h")
    echo "$_version.r$_commits.g$_rev"
}

build() {
  cd $_gitname
  
  msg "Starting cmake for: ${pkgname}"
  cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr
   
   make || return 1
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install || return 1
}

