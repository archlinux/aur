# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Abakus <java5@arcor.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=opie
pkgver=2.32
pkgrel=4
pkgdesc="S/KEY Client utilities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/sid/opie-server"
replaces=('opie-client' 'opie-server')
source=("http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1-0.2+squeeze1.diff.gz")
sha256sums=('6472b5214a031330b933a2b2ffbdab08054093eb4ca283f97284b04319d1060b'
            'cd2816e294c666ea51f3b2a914916164c50cbaf4e4ec33c4c5aae1326f919e07')

build() {
  # Yes, I'm forced to do this because rebuilds error out otherwise.
  cd "$srcdir"
  rm -rf "opie-build"
  cp -a "opie-$pkgver.dfsg.1" "opie-build"
  cd "opie-build"

  patch -p1 < "../opie_$pkgver.dfsg.1-0.2+squeeze1.diff"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-retype ;

  # And I'm forced to do this because all builds error out otherwise.
  make -j1 all

  # I'm not forced to do this, but what the hell. Fixes roff syntax.
  sed -i 's/\(^\.BR opiegen(1)\) /&\n/' opiegen.1
}

package() {
  cd "$srcdir/opie-build"

  install -d "$pkgdir/etc"
  make install \
    LOCALBIN="$pkgdir/usr/bin" \
    KEY_FILE="$pkgdir/etc/opiekeys" \
    LOCK_DIR="$pkgdir/etc/opielocks" ;
  install -Dm0755 "opiegen" "$pkgdir/usr/bin/opiegen"

  for page in *.[0-9]; do
    install -Dm0644 "$page" "$pkgdir/usr/share/man/man${page##*.}/$page"
  done
}

# vim: ts=2:sw=2:et:nowrap
