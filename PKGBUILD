# Maintainer: Hermann Höhne <hoehermann@gmx.de>
pkgname=purple-gowhatsapp-git
_pkgnam=${pkgname%-git}
pkgver=1.17.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
groups=()
depends=('libpurple')
optdepends=('webp-pixbuf-loader: Stickers' 'gdk-pixbuf2: Stickers' 'opusfile: Upload opus audio as PTT voice message')
makedepends=('git' 'go' 'cmake' 'make' 'pkg-config')
provides=("${_pkgnam}")
conflicts=("${_pkgnam}")
install=
source=("${_pkgnam}::git+https://github.com/hoehermann/purple-gowhatsapp.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  export GOPATH="$srcdir/${_pkgnam}/build/_go"
  bash "$srcdir/${_pkgnam}/scripts/version.sh"
}

prepare() {
  cd "$srcdir/${_pkgnam}"
  git submodule update --init
  rm go.mod go.sum # have bleeding edge whatsmeow
  cmake -G "Unix Makefiles" -S . -B build -DCMAKE_Go_FLAGS="-mod=vendor" # prepare vendored build
  cmake --build build --target download-modules # download whatsmeow's and its dependencies' sources
  env GOPATH="$srcdir/${_pkgnam}/build/_go" go mod vendor # copy downloaded sources into source tree
}

build() {
  cd "$srcdir/${_pkgnam}/build"
  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgnam}/build"
  make DESTDIR="$pkgdir/" install/strip
}
