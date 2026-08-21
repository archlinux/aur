# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=ssr.lv2-git
pkgdesc="A sympathetic string resonator."
pkgver=r10.e1999da
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/jpcima/ssr"
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
source=(ssr.lv2-git::git+https://github.com/jpcima/ssr)
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
  git config protocol.file.allow always
  git submodule update --init --recursive
}

build() {
	cd "$pkgname"
  make CXXFLAGS="$CXXFLAGS -include cstdint -Wno-template-body"
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" BUILD_VST2=false BUILD_JACK=false install
}
