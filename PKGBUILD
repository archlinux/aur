# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dropbear-hg
pkgver=r1818.587c76726b5f
pkgrel=1
pkgdesc="Small SSH server and client"
arch=('i686' 'x86_64')
url="https://matt.ucc.asn.au/dropbear/dropbear.html"
license=('custom')
depends=('glibc' 'pam' 'zlib')
makedepends=('mercurial')
provides=('dropbear')
conflicts=('dropbear')
source=("hg+https://hg.ucc.asn.au/dropbear/"
        "dropbear.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/dropbear/trunk/dropbear.service"
        "localoptions.h::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/dropbear/trunk/localoptions.h")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "dropbear"

  cp -f "$srcdir/localoptions.h" ./
}

pkgver() {
  cd "dropbear"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "dropbear"

  autoconf
  autoheader
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --enable-pam
  make
}

package() {
  cd "dropbear"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dropbear"

  install -Dm644 "$srcdir/dropbear.service" -t "$pkgdir/usr/lib/systemd/system"
}
