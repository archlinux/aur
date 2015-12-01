# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_28
pkgrel=2
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
rpmname=("$pkgname-${pkgver//_/-}.fc23.src.rpm")
source=("https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/c/$rpmname")
noextract=($rpmname)
sha512sums=('e5b9210c6f06a06ec8a134a8ea3200a2d024814b8a14392511fd6309ae3d16cdee5a52b4abd707559e8a854f48a0ebdd52d156a49af1285d8916c3359411a0f7')

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
 ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make DESTDIR="$pkgdir/" install
}
