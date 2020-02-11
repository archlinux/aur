# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=opendds-git
pkgver=3.13
pkgrel=2
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
options=('!buildflags')
makedepends=('git')
source=(
    "MPC.tar.gz::https://github.com/DOCGroup/MPC/tarball/master"
    "ACE_TAO.tar.gz::https://github.com/DOCGroup/ACE_TAO/tarball/master"
    "OpenDDS.tar.gz::https://github.com/objectcomputing/OpenDDS/tarball/master"
    build.patch
    )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'c44b0c8d7ebccc2b9be0a040ec9f8c2b')

prepare() {
  cd "$srcdir"
  mv DOCGroup-ACE_TAO-* ACE_TAO
  mv DOCGroup-MPC-* MPC
  mv objectcomputing-OpenDDS-* OpenDDS
  patch --strip=1 -i ../build.patch
}

build() {
  cd "$srcdir/OpenDDS"
  ./configure \
    --mpc="$srcdir/MPC" \
    --ace="$srcdir/ACE_TAO/ACE" \
    --tao="$srcdir/ACE_TAO/TAO"
  make
}

package() {
  cd "$srcdir/OpenDDS"
  source setenv.sh
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 "$DDS_ROOT/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/OpenDDS_LICENSE"
  install -Dm644 "$ACE_ROOT/COPYING" "$pkgdir/usr/share/licenses/$pkgname/ACE_TAO_LICENSE"
  # TODO Other licences
}

# vim:set ts=2 sw=2 et:
