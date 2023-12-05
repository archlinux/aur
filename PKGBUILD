# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.7.4
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
depends=('glibc' 'libedit')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  '634d1e25884c9bced477a5c3e7a15923447a8a8e41808502e53039bf153c70f8475150b06b9d723d9c98605b3483e715bef11b1ebd4c18242f3daa9f0d133c45'
  '9af6b3b8890486cdc97e511a16e1fc1b78060fc66f8c4a1df59d0e1f5b95974ecaabffc52d13829f74a24bdaf0cacc84e08cb442d06e96492ce604747b7927cb'
)
sha256sums=(
  'ce3bd42779c4534be80a2b9c8995b76acce62654879a4afd27001ed0e6bf602b'
  '0441941e895214051f38e139eeecef779856f2795e6388fd818672b2a7dd4002'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

_ltoflags='-flto=auto'
: "${LTOFLAGS:=$_ltoflags}"

build() {
  cd "bc-$pkgver"

  env CFLAGS="$CFLAGS -O3" \
    PREFIX=/usr ./configure.sh -p GNU -e -G -sbc.banner -sdc.tty_mode
  make
}

check() {
  cd "bc-$pkgver"

  env LANG=C LC_ALL=C make check
}

package() {
  cd "bc-$pkgver"

  DESTDIR="$pkgdir" make install

  # If we have a tty, tell the user what we are doing
  test -t 1 && _verbose='v' || _verbose=''

  install "-${_verbose}Dm0644" LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  for _doc in {NEWS,NOTICE,README}.md; do
    install "-${_verbose}Dm0644" "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# eof
