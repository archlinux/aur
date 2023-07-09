# Maintainer: Cole Deck <cole at deck dot sh>
pkgname=fw-ectool-git
_gitname=ectool
pkgver=r22544.54c140399
pkgrel=1
pkgdesc="ectool for the Framework laptop."
arch=(x86_64)
url="https://www.howett.net/posts/2021-12-framework-ec/#software"
provides=('ectool')
depends=()
makedepends=('inetutils' 'git')
license=('BSD')
source=(git+https://github.com/DHowett/framework-ec)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/framework-ec"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/framework-ec"
  sed -i "s/-Werror / /g" Makefile.toolchain
  make utils PREFIX=/usr
}

package() {
  cd "$srcdir/framework-ec"
  install -Dm755 build/bds/util/ectool "$pkgdir/usr/bin/ectool"
  printf "#!/bin/bash\n/usr/bin/ectool --interface=fwk \$@" > "$pkgdir/usr/bin/fw-ectool"
  chmod +x "$pkgdir/usr/bin/fw-ectool"
  # install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
