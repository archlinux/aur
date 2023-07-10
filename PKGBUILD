# Maintainer: Hermann Höhne <hoehermann@gmx.de>
pkgname=purple-gowhatsapp-git
pkgnam=${pkgname%-git}
pkgver=1.13.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
groups=()
depends=('libpurple' 'opusfile' 'gdk-pixbuf2' 'webp-pixbuf-loader')
makedepends=('git' 'go' 'cmake' 'make' 'pkg-config' 'opusfile' 'gdk-pixbuf2' 'webp-pixbuf-loader' 'jq')
provides=("${pkgnam}")
conflicts=("${pkgnam}")
install=
source=("${pkgnam}::git+https://github.com/hoehermann/purple-gowhatsapp.git#branch=whatsmeow")
noextract=()
sha256sums=('SKIP')

pkgver() {
  export GOPATH="$srcdir/${pkgnam}/build/src/go/go"
  cd "$srcdir/${pkgnam}"
  bash version.sh "$srcdir/${pkgnam}/build"
}

prepare() {
  git -C "$srcdir/${pkgnam}" submodule update --init
}

build() {
  mkdir -p "$srcdir/${pkgnam}/build"
  cd "$srcdir/${pkgnam}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgnam}/build"
  make DESTDIR="$pkgdir/" install/strip
}
