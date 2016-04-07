# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_30
pkgrel=1
pkgdesc="Provides PKCS11 module support for smart-card readers, now with 144k smartcard/CAC support and downstream Fedora patches."
arch=('i686' 'x86_64')
url="http://directory.fedora.redhat.com/wiki/CoolKey"
license=('GPL')
depends=('pcsclite' 'ccid')
makedepends=(rpmextract)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
rpmname=("$pkgname-${pkgver//_/-}.fc24.src.rpm")
source=("https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/c/$rpmname")
noextract=($rpmname)
sha512sums=('04c17b81e7fd3cf89110a7be8387cfbbcddd8ac9a9d13924af0075597478b8e0d9585908ebb4f39ed08c1e82b7f35cedab3fa5ccbb36f7a9235fb7cdd863a8bb')

build() {
  cd $srcdir
  rpmextract.sh $rpmname
  tar xf coolkey-1.1.0.tar.gz
  cd "$srcdir/coolkey-1.1.0"
  patch -p0 < $srcdir/coolkey-cache-dir-move.patch
  patch -p0 < $srcdir/coolkey-gcc43.patch
  patch -p0 < $srcdir/coolkey-latest.patch
  patch -p0 < $srcdir/coolkey-simple-bugs.patch
  patch -p0 < $srcdir/coolkey-thread-fix.patch
  patch -p0 < $srcdir/coolkey-cac.patch
  patch -p0 < $srcdir/coolkey-cac-1.patch
  patch -p0 < $srcdir/coolkey-pcsc-lite-fix.patch
  patch -p1 < $srcdir/coolkey-fix-token-removal-failure.patch
  patch -p1 < $srcdir/coolkey-update.patch
  patch -p1 < $srcdir/coolkey-more-keys.patch
 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make -j1 DESTDIR="$pkgdir/" install
}
