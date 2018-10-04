# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dropbear-hg
pkgver=r1621.8cdabd7d34aa
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
        "dropbear.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/dropbear.service?h=packages/dropbear"
        "localoptions.h::https://git.archlinux.org/svntogit/community.git/plain/trunk/localoptions.h?h=packages/dropbear")
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
  ./configure --prefix="/usr" --sbindir="/usr/bin" --enable-pam
  make
}

package() {
  cd "dropbear"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/dropbear/LICENSE"

  install -Dm644 "$srcdir/dropbear.service" "$pkgdir/usr/lib/systemd/system/dropbear.service"
}
