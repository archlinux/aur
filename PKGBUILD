# Maintainer: Lucas Mior <lucas.bmior@gmail.com>

pkgname=cecup-git
pkgver=r471.9e0ef03
pkgrel=1
pkgdesc="A rsync frontend for making backups"
arch=('x86_64')
url="https://github.com/lucas-mior/cecup"
license=('MIT')
depends=('gtk3' 'rsync')
makedepends=('git' 'gcc' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  chmod +x build.sh
}

build() {
  cd "${pkgname%-git}"
  export CFLAGS="$CFLAGS -Wno-used-but-marked-unused"
  export CFLAGS="$CFLAGS -Wno-warn-unused-result"
  export CFLAGS="$CFLAGS -Wno-unused-result"
  ./build.sh
}

package() {
  cd "${pkgname%-git}"

  export DESTDIR="$pkgdir/" 
  export PREFIX="/usr"
  ./build.sh install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
