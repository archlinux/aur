# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.2.r278.gf8cd9a11
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('libpng' 'libwebp' 'sdl2_mixer' 'freetype2' 'libzip' 'hicolor-icon-theme')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson' 'python-docutils')
source=('git+https://github.com/taisei-project/taisei.git'
        'git+https://github.com/taisei-project/cglm.git'
        'git+https://github.com/taisei-project/SDL_GameControllerDB.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd taisei
  git describe --long --tags --match "v[0-9]*[!a-z]" | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd taisei
  git submodule init
  git config submodule.external/cglm.url ../cglm
  git config submodule.external/gamecontrollerdb.url ../SDL_GameControllerDB
  git submodule update
  arch-meson build
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
