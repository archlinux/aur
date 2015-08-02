# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_28
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
rpmname=("$pkgname-${pkgver//_/-}.fc23.src.rpm")
source=("http://mirrors.kernel.org/fedora/development/rawhide/source/SRPMS/c/$rpmname")
noextract=($rpmname)
sha512sums=('33d7fe8996e1444304a2e5ac3786d6c9c70b49549dfee1c7c304f03576098eebfde082086fbb5961941576075f27e960a5996950ca68f59946d27fe21ee8913e')

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
