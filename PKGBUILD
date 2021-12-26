# Maintainer: Cole Deck <cole at deck dot sh>
pkgname=fw-ectool-git
_gitname=ectool
pkgver=r21603.35580ec63
pkgrel=1
pkgdesc="ectool for the Framework laptop."
arch=(x86_64)
url="https://www.howett.net/posts/2021-12-framework-ec/#software"
provides=('ectool')
depends=()
makedepends=('inetutils')
license=('BSD')
source=(git+https://github.com/DHowett/fw-ectool)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/fw-ectool"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fw-ectool"
  sed -i "s/-Werror / /g" Makefile.toolchain
  make utils PREFIX=/usr
}

package() {
  cd "$srcdir/fw-ectool"
  install -Dm755 build/bds/util/ectool "$pkgdir/usr/bin/ectool"
  printf "#!/bin/bash\n/usr/bin/ectool --interface=fwk \$@" > "$pkgdir/usr/bin/fw-ectool"
  chmod +x "$pkgdir/usr/bin/fw-ectool"
  # install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
