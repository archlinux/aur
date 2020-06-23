# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.3.r398.g8480d41b
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('sdl2' 'libpng' 'libwebp' 'opusfile' 'freetype2' 'libzip' 'hicolor-icon-theme')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson' 'python-docutils')
source=('git+https://github.com/taisei-project/taisei.git'
        'git+https://github.com/taisei-project/cglm.git'
        'git+https://github.com/taisei-project/SDL_GameControllerDB.git'
        'git+https://github.com/taisei-project/koishi.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd taisei
  git describe --long --tags --match "v[0-9]*[!a-z]" | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd taisei
  git config submodule.cglm.url ../cglm
  git config submodule.gamecontrollerdb.url ../SDL_GameControllerDB
  git config submodule.external/koishi.url ../koishi
  git submodule update
  arch-meson build -Dvalidate_glsl=false
}

build() {
  cd taisei
  ninja -C build
}

package() {
  cd taisei

  DESTDIR="$pkgdir/" ninja -C build install

  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
