# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

# Upstream's own PKGBUILD for this pkgbase (trojita-git) sets
# pkgname=trojita-qt5-git -- a copy-paste bug carried over from the
# separate trojita-qt5-git pkgbase (see arch/maintained/trojita-qt5-git,
# a genuinely different, Qt5+WebKit package). Corrected locally; this
# is the Qt6 variant (WITH_WEBKIT=OFF below).
pkgname=trojita-git
pkgver=0.7.r839.g5aefb8f1
pkgrel=4
pkgdesc="A fast QT IMAP e-mail client"
# i686 dropped: kitemmodels (KF6 flavor) isn't ported to i686 on
# archlinux32 (only the old KF5-era kitemmodels5-lineage package
# exists there) -- unsatisfiable, not fixable locally.
arch=(x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qtkeychain-qt6' 'qt6-tools' 'qt6-svg' 'qt6-5compat' 'mimetic'
         'qgpgme' 'desktop-file-utils' 'sonnet' 'ragel' 'kitemmodels')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'boost')

_commit=c10f2990c090eb0821f78888d42981e33c18cc3c
source=('git+https://invent.kde.org/pim/trojita.git'
        'trojita-qgpgme5.patch')
md5sums=('SKIP'
         '18c5e0061400e3180969b7edf2128a6e')

pkgver() {
  cd "$srcdir/trojita"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/trojita"
#  patch -Np1 < "${srcdir}"/trojita-qgpgme5.patch
}

build() {
  cd "$srcdir/trojita"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_WEBKIT=OFF \
        -DWITH_TESTS=OFF \
        -DWITH_QTKEYCHAIN_PLUGIN=ON \
        -DWITH_GPGMEPP=ON \
        -DWITH_CRYPTO_MESSAGES=ON \
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake/QGpgmeQt6 \
        .
  make
}

package() {
  cd "$srcdir/trojita"
  make install DESTDIR="$pkgdir"
}
