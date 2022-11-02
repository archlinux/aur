# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.1.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
depends=('libedit')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  'f48bf5997103b040ce8cb5dc7a5b14e659f11b8291692503d13d9bd9a9bbd45435c33df5b12f8e6afc979df02fcbe702feb10e27d70b2568fa9270f460c0eff4'
  'ce2f42ae9d20eaf4d75cf65b2faf86d2e2fd8dd6a88a9aa13e5f2825129eac7b14e2a195505bdba6d77f30b490827a8c4fc6cacbeb0c3ff38a87ad3d417a5d67'
)
sha256sums=(
  'fa7fc70dd67f25ca6f03251ae95302b933a98a5bc302045196ce861e9d2338e3'
  '09140912f2f0c04f937c9d3d653935c722e7a37948a848a4917ed2db565ca16b'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="$CFLAGS -flto=auto -O3"

build() {
  cd "bc-$pkgver"

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

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  for _doc in {NEWS,NOTICE,README}.md; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# eof
