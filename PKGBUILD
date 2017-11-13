# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=scute
pkgver=1.5.0
pkgrel=1
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(gnupg)
makedepends=(texinfo)
_commit='0b49362dab49697bfdf8b0fdc1dcfe66afb3c7fd' # scute-1.5.0
source=("git://git.gnupg.org/scute.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd scute
  git describe | sed "s/^scute-//; s/-/.r/; s/-/./"
}

prepare() {
  cd scute
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd scute
  ./configure --prefix=/usr --sysconfdir=/etc --enable-maintainer-mode
  make
}

package() {
  cd scute
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/lib/pkcs11
  ln -s ../scute.so "$pkgdir"/usr/lib/pkcs11/scute.so

  mkdir -p "$pkgdir"/usr/share/p11-kit/modules
  echo "module: scute.so" > "$pkgdir"/usr/share/p11-kit/modules/scute.module
}

# vim: ts=2:sw=2:et
