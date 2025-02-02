# Maintainer: Gustavo Ramos Rehermann (wallabra) <rehermann6046@gmail.com>
pkgname=nuvie-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1988.350c89b5
pkgrel=1
pkgdesc="A modern open-source engine for Ultima 6, Martian Dreams, and Savage Empire"
arch=(x86_64)
url="https://github.com/nuvie/nuvie"
license=('GPL-2.0-only')
groups=()
depends=(sdl2)
makedepends=('git' cmake) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(ultima6)
conflicts=(nuvie)
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/nuvie/nuvie.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  
  local cmake_options=(
    -B build
    -S ${pkgname%-git}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  # For some reason, the CMake way to install isn't working.
  # Hit me up in the AUR comments if you know how to fix this!
  #DESTDIR="$pkgdir" cmake --install build

  install -D -m755 "$srcdir/build/nuvie" "$pkgdir/usr/bin/nuvie"
}
