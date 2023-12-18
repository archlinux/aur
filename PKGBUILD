# Maintainer: Cole Deck <cole at deck dot sh>
pkgname=fw-ectool-git
_gitname=ectool
pkgver=r2760.3ebe7b8
pkgrel=1
pkgdesc="ectool for the Framework laptop."
arch=(x86_64)
url="https://www.howett.net/posts/2021-12-framework-ec/#software"
provides=('ectool')
depends=()
makedepends=('inetutils' 'git')
license=('BSD')
source=(git+https://gitlab.howett.net/DHowett/ectool.git)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/ectool"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ectool"
  mkdir -p build && cd build
  cmake ..
  make PREFIX=/usr
}

package() {
  cd "$srcdir/ectool"
  install -Dm755 build/src/ectool "$pkgdir/usr/bin/ectool"
  # legacy: install "fw-ectool" binary
  # previously used to specify the framework interface
  # which led to it's inclusion in scripts
  # however that's no longer necessary to use ectool, so it's just calling ectool as-is
  printf "#!/bin/bash\n/usr/bin/ectool \$@" > "$pkgdir/usr/bin/fw-ectool"
  chmod +x "$pkgdir/usr/bin/fw-ectool"
}
