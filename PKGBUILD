# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dropbear-git
pkgver=2022.83.r41.g5040f21
pkgrel=1
pkgdesc="Small SSH server and client"
arch=('i686' 'x86_64')
url="https://matt.ucc.asn.au/dropbear/dropbear.html"
license=('custom')
depends=('glibc' 'pam' 'zlib')
makedepends=('git')
provides=("dropbear=$pkgver")
conflicts=('dropbear')
source=("git+https://github.com/mkj/dropbear.git"
        "dropbear.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dropbear/-/raw/main/dropbear.service"
        "localoptions.h::https://gitlab.archlinux.org/archlinux/packaging/packages/dropbear/-/raw/main/localoptions.h")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "dropbear"

  cp -f "$srcdir/localoptions.h" ./
}

pkgver() {
  cd "dropbear"

  _tag=$(git tag -l --sort -v:refname | grep -E '^DROPBEAR_[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^DROPBEAR_//'
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
