# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Contributor: Goncalo Camelo Neves Pereira <up201503829@fe.up.pt>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=opendds
pkgver=3.14.1
pkgrel=1
_opendds_version=$(echo $pkgver | sed -e 's/\.0$//g')
_ace_tao_version=6.5.12
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="https://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
provides=('ace' 'tao')
options=('!buildflags')
source=(
  "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-$(echo $_ace_tao_version | sed -e 's/\./_/g')/ACE+TAO-$_ace_tao_version.tar.gz"
  "https://github.com/objectcomputing/OpenDDS/releases/download/DDS-$_opendds_version/OpenDDS-$_opendds_version.tar.gz"
  build.patch
)
md5sums=(
  'ae54336fbbec7a5d2e197c4b0dc0d5b8'
  'bfbb96e6cfe1304e60c778fb7a6bc278'
  'c44b0c8d7ebccc2b9be0a040ec9f8c2b'
)

_strip_pl="$(realpath strip.pl)"

prepare() {
  cd "$srcdir"
  mv "OpenDDS-$_opendds_version" OpenDDS
  patch --strip=1 -i ../build.patch
}

build() {
  cd "$srcdir/OpenDDS"
  ./configure \
    --ace="$srcdir/ACE_wrappers" \
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
  install -Dm644 ACE_wrappers/COPYING "$pkgdir/usr/share/licenses/$pkgname/ACE_TAO_LICENSE"
  # TODO Other licences

  # Strip $srcdir from Generated Files
  cd "$pkgdir"
  perl "$_strip_pl" "$srcdir"
}

# vim:set ts=2 sw=2 et:
