# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=opendds-git
pkgver=3.14
pkgrel=1
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="https://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
provides=('opendds' 'ace' 'tao')
conflicts=('opendds' 'ace' 'tao')
options=('!buildflags')
makedepends=('git')
source=(
  "MPC.tar.gz::https://github.com/DOCGroup/MPC/tarball/master"
  "ACE_TAO.tar.gz::https://github.com/DOCGroup/ACE_TAO/tarball/master"
  "OpenDDS::git+https://github.com/objectcomputing/OpenDDS"
  build.patch
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'c44b0c8d7ebccc2b9be0a040ec9f8c2b'
)

_strip_pl="$(realpath strip.pl)"

prepare() {
  cd "$srcdir"
  mv DOCGroup-ACE_TAO-* ACE_TAO
  mv DOCGroup-MPC-* MPC
  patch --strip=1 -i ../build.patch
}

pkgver() {
  cd "$srcdir/OpenDDS"
  git describe --long | \
    sed 's/\([^-]*-g\)/r\1/;s/^DDS-//g;s/-/./g' | \
    sed 's/^\([0-9]\+\)\.\([0-9]\+\)\.r/\1.\2.0\.r/g'
}

build() {
  cd "$srcdir/OpenDDS"
  ./configure \
    --mpc="$srcdir/MPC" \
    --ace="$srcdir/ACE_TAO/ACE" \
    --tao="$srcdir/ACE_TAO/TAO" \
    --configh '#define ACE_LACKS_READDIR_R' \
    --configh '#define ACE_DISABLE_MKTEMP' \
    --configh '#define ACE_DISABLE_TEMPNAM' \
    --no-tests \
    --no-debug
  make
}

package() {
  cd "$srcdir/OpenDDS"
  source setenv.sh
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install

  # Copy Licences
  cd "$srcdir"
  install -Dm644 "$DDS_ROOT/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/OpenDDS_LICENSE"
  install -Dm644 "$ACE_ROOT/COPYING" "$pkgdir/usr/share/licenses/$pkgname/ACE_TAO_LICENSE"
  # TODO Other licences

  # Strip $srcdir from Generated Files
  cd "$pkgdir"
  perl "$_strip_pl" "$srcdir"
}

# vim:set ts=2 sw=2 et:
