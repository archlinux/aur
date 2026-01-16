# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matthias Ellmer (halcyon)

pkgname="duc-git"
_pkgname="duc"
pkgver=r951.a58fa4e
epoch=1
pkgrel=5
pkgdesc="Collection of tools for inspecting and visualizing disk usage (git version)"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://duc.zevv.nl/"
license=('LGPL-3.0-only')
depends=('cairo' 'pango' 'sqlite' 'ncurses' 'libx11' 'glib2' 'glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/zevv/duc.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Generates version based on commit count and short hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Create config.h.in if it does not exist (necessary for autoreconf in some cases)
  if [[ ! -f "config.h.in" ]]; then
    touch "config.h.in"
  fi

  # Temporary fix for ncurses (consider reporting this upstream)
  sed -i 's+ncursesw/ncurses.h+ncurses.h+' "src/duc/cmd-ui.c"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # autoreconf -vfi is more robust than manually invoking aclocal/automake
  autoreconf -vfi

  ./configure --prefix="/usr" --with-db-backend="sqlite3"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  # Explicit license installation
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
