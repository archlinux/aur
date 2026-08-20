# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-qt5-git
pkgver=0.7.r796.gc10f2990
pkgrel=9
pkgdesc="A fast QT IMAP e-mail client (Qt5 version with webkit viewer)"
# i686/pentium4 dropped: after fixing several real dependency gaps
# (gpgme, gpgmepp, qgpgme-qt5 all needed building ourselves for
# 32-bit; then icu76/icu72/libxml2-legacy makedepends for archlinux32's
# stale qt5-webkit ABI -- see memory/gpgme.md, memory/gpgmepp.md,
# memory/qgpgme-qt5.md), the final blocker is a Qt5 *private* API
# symbol mismatch (libQt5Quick.so needs a Qt_5_PRIVATE_API symbol not
# present in the installed Qt5Quick on i686) -- an internal ABI
# inconsistency between archlinux32's own Qt5 packages, not something
# fixable with a legacy-compat makedepend. See memory/trojita-qt5-git.md.
arch=(x86_64)
url="http://trojita.flaska.net"
license=('GPL')
# qtkeychain -> qtkeychain-qt5: Arch renamed the plain qtkeychain
# package into qt5/qt6-suffixed variants; upstream's own PKGBUILD is
# stale on the old name. gpgmepp added: a real hard dependency
# (Gpgmepp cmake package) upstream's depends=() is missing.
depends=('qt5-webkit' 'qtkeychain-qt5' 'qt5-tools' 'qt5-svg' 'mimetic'
         'qgpgme-qt5' 'gpgmepp' 'desktop-file-utils' 'sonnet5' 'ragel')
conflicts=('trojita' 'trojita-git')
provides=('trojita')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'boost')

_commithash='c10f299'
source=("git+https://invent.kde.org/pim/trojita.git#commit=${_commithash}"
        'trojita-qgpgme5.patch')
md5sums=('SKIP'
         '8c45c3124cf8bdb627388b1356c5fcbd')

pkgver() {
  cd "$srcdir/trojita"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/trojita"
  patch -Np1 < "${srcdir}"/trojita-qgpgme5.patch
}

build() {
  cd "$srcdir/trojita"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_TESTS=OFF \
        -DWITH_QT5=ON \
        -DWITH_QTKEYCHAIN_PLUGIN=ON \
        -DWITH_GPGMEPP=ON \
        -DWITH_CRYPTO_MESSAGES=ON \
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake/QGpgmeQt5 \
        .
  make
}

package() {
  cd "$srcdir/trojita"
  make install DESTDIR="$pkgdir"
}
