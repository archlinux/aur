# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dropbear-hg
pkgver=r1450.5b25d86b865b
pkgrel=1
pkgdesc="Small SSH server and client"
arch=('i686' 'x86_64')
url="https://matt.ucc.asn.au/dropbear/dropbear.html"
license=('custom')
depends=('glibc' 'pam' 'zlib')
makedepends=('mercurial')
provides=('dropbear')
conflicts=('dropbear')
source=("hg+https://secure.ucc.asn.au/hg/dropbear/"
        "dropbear.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/dropbear.service?h=packages/dropbear")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "dropbear"

  sed -i 's/DROPBEAR_SMALL_CODE 1/DROPBEAR_SMALL_CODE 0/' "default_options.h"
}

pkgver() {
  cd "dropbear"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "dropbear"

  autoconf
  autoheader
  ./configure --prefix="/usr" --sbindir="/usr/bin" --enable-pam
  make
}

package() {
  cd "dropbear"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/dropbear/LICENSE"

  install -Dm644 "$srcdir/dropbear.service" "$pkgdir/usr/lib/systemd/system/dropbear.service"
}
