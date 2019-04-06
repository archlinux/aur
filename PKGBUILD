# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=gpgme-git
pkgname=('gpgme-git' 'python-gpgme-git' 'qgpgme-git')
pkgver=1.13.0.r4.g4a4680f8
pkgrel=1
pkgdesc="GnuPG Made Easy"
arch=('i686' 'x86_64')
url="https://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('git' 'gnupg' 'python' 'qt5-base' 'swig')
source=("git+https://dev.gnupg.org/source/gpgme.git")
sha256sums=('SKIP')


pkgver() {
  cd "gpgme"

  git describe --long --tags | sed 's/^gpgme-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gpgme"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --disable-fd-passing \
    --disable-gpgsm-test
  make
}

check() {
  cd "gpgme"

  make check
}

package_gpgme-git() {
  depends=('glibc' 'gnupg' 'libgpg-error')
  provides=('gpgme')
  conflicts=('gpgme')

  cd "gpgme"

  make DESTDIR="$pkgdir" install

  # split packages
  rm -r "$pkgdir/usr/include"/{qgpgme,QGpgME}
  rm -r "$pkgdir/usr/lib"/{cmake/QGpgme/,libqgpgme.*,python*}
}

package_python-gpgme-git() {
  pkgdesc="Python bindings for GPGme"
  depends=('python' 'gpgme-git')
  provides=('python-gpgme')
  conflicts=('python-gpgme')

  cd "gpgme/lang/python"

  make DESTDIR="$pkgdir" install
}

package_qgpgme-git() {
  pkgdesc="Qt bindings for GPGme"
  depends=('qt5-base' 'gpgme-git')
  provides=('qgpgme')
  conflicts=('qgpgme')

  cd "gpgme/lang/qt"

  make DESTDIR="$pkgdir" install
}
