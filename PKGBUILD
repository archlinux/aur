# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=simmonitor
pkgname=simmonitor
pkgrel=1
pkgver=v1.0.0r0
pkgdesc="Dashboards and Telemetry Monitoring for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/simmonitor"
license=('GPL3')
_commit=adab850e699a2cbaf623deee17e51f6b10840a28

depends=(
  argtable
  libconfig
  libxdg-basedir
  libuv
  ncurses
  libmicrohttpd
  hoel
  sdl2
  sdl2_image
  postgresql-libs
  mariadb-libs
  sqlite3
  libtar
)

makedepends=(
  git
  cmake
  make
  gcc
)

sha256sums=(
  'SKIP'
)

source=("git+https://github.com/spacefreak18/simmonitor.git#commit=$_commit")

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -d "-" -f 1-2 | tr "-" "r"
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  mkdir -p build
  cd build
  export CFLAGS=-Wno-unused-result
  cmake ..
  make
  mkdir -p "${pkgdir}/usr/bin/"
  cp "$srcdir/$_reponame"/build/simmonitor "${pkgdir}/usr/bin/simmonitor"
  install -D -m644 "$srcdir/$_reponame"/LICENSE.rst -t "${pkgdir}/usr/share/licenses/$_reponame"
}
