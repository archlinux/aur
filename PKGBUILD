# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname='desmume'
pkgname="$_pkgname-git"
_pkgver='0.9.11'
_lastrelease='ccbf85ed42e4350af415d56b1465e83614c85ef8'
pkgver=0.9.11.r1463.eab1fb95
pkgrel=1
pkgdesc="Nintendo DS emulator"
arch=('x86_64')
url="https://desmume.org/"
license=('GPL2')
provides=('desmume')
conflicts=('desmume')
depends=('glib2' 'sdl2' 'zlib' 'libgl' 'openal' 'gtk3' 'libpcap' 'libpng')
makedepends=('meson' 'pkg-config' 'desktop-file-utils' 'git')
source=("$_pkgname::git+https://github.com/TASVideos/desmume.git")
sha512sums=('SKIP')

optdepends=('agg: to enable the HUD, requires --enable-hud at build time')

pkgver() {
  cd $_pkgname
  echo "$_pkgver.r$(git rev-list --count $_lastrelease..HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  cd $_pkgname

  meson setup build \
        $_pkgname/src/frontend/posix \
        --prefix=/usr \
        --buildtype=release \
        --optimization=2 \
        --strip \
        -Dc_args='-minline-all-stringops -D_FORTIFY_SOURCE=2' \
        -Db_pie=true \
        -Dopenal=true \
        -Dwifi=true
}

build() {
  cd $_pkgname
  ninja -C build
}

package() {
  cd $_pkgname/build
  DESTDIR="$pkgdir" meson install
}
