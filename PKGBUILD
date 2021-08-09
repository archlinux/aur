# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fossil-fossil
pkgver=r15951.1e919d6
pkgrel=1
pkgdesc="A simple, high-reliability, distributed software configuration management system"
arch=('i686' 'x86_64')
url="https://fossil-scm.org/home/doc/trunk/www/index.wiki"
license=('BSD')
depends=('glibc' 'openssl' 'zlib')
makedepends=('fossil' 'tcl')
optdepends=('tcl')
provides=('fossil')
conflicts=('fossil')
backup=('etc/xinetd.d/fossil')
source=("fossil.fossil::fossil+https://fossil-scm.org/home"
        "fossil-xinetd::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/fossil/trunk/fossil-xinetd"
        "fossil@.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/fossil/trunk/fossil.service"
        "fossil.socket::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/fossil/trunk/fossil.socket")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "fossil"

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "fossil"

  ./configure \
    --prefix="/usr" \
    --with-tcl="/usr" \
    --with-tcl-private-stubs=1 \
    --json
  make
}

check() {
  cd "fossil"

  #make test
}

package() {
  cd "fossil"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/fossil-xinetd" "$pkgdir/etc/xinetd.d/fossil"
  install -Dm644 "$srcdir/"fossil{.socket,@.service} -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "tools/fossil-autocomplete.bash" "$pkgdir/usr/share/bash-completion/completions/fossil"
  install -Dm644 "COPYRIGHT-BSD2.txt" -t "$pkgdir/usr/share/licenses/fossil"
}
