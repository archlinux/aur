# Maintainer: Hermann Höhne <hoehermann@gmx.de>
pkgname=purple-gowhatsapp-git
_pkgnam=${pkgname%-git}
pkgver=1.13.0
pkgrel=2
pkgdesc="A libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
groups=()
depends=('libpurple' 'opusfile' 'gdk-pixbuf2' 'webp-pixbuf-loader')
makedepends=('git' 'go' 'cmake' 'make' 'pkg-config')
provides=("${_pkgnam}")
conflicts=("${_pkgnam}")
install=
source=("${_pkgnam}::git+https://github.com/hoehermann/purple-gowhatsapp.git#branch=whatsmeow")
noextract=()
sha256sums=('SKIP')

pkgver() {
  export GOPATH="$srcdir/${_pkgnam}/build/src/go/go"
  cd "$srcdir/${_pkgnam}"
  bash version.sh "$srcdir/${_pkgnam}/build"
}

prepare() {
  git -C "$srcdir/${_pkgnam}" submodule update --init
  mkdir -p "$srcdir/${_pkgnam}/build"
  cd "$srcdir/${_pkgnam}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build . --target download-modules
}

build() {
  cd "$srcdir/${_pkgnam}/build"
  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgnam}/build"
  make DESTDIR="$pkgdir/" install/strip
}
