# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=regrader.lv2-git
pkgdesc="A delay effect where the repeats degrade in resolution."
pkgver=v1.0.0.r4.g9154881
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/linuxmao-org/regrader-port"
license=(MIT)
groups=(lv2-plugins)
depends=('pkgconf' 'cairo' 'jack' 'mesa')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(regrader.lv2-git::git+https://github.com/linuxmao-org/regrader-port)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive
  # Patch: global.h defines maybe_unused macro that breaks GCC 16 system headers
  # which use [[maybe_unused]] attribute on parameters. Rename to IGOR_UNUSED.
  sed -i 's/maybe_unused/IGOR_UNUSED/g' sources/global.h
}

build() {
	cd "$pkgname"
  make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" BUILD_VST2=false BUILD_JACK=false install
}
