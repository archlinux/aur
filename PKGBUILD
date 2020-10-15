# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Contributor: Goncalo Camelo Neves Pereira <up201503829@fe.up.pt>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=opendds
_pkgname=OpenDDS
pkgver=3.14.0
pkgrel=2
_opendds_version=$(echo $pkgver | sed -e 's/\.0$//g')
_ace_tao_version=6.5.11
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
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
  '09f4281db7a398b20dddcbfa787ac04f'
  '604aca1898673a7ce5af0f72a0fda8cf'
  'c44b0c8d7ebccc2b9be0a040ec9f8c2b'
)

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
    --no-tests
  make
}

package() {
  cd "$srcdir/OpenDDS"
  source setenv.sh
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 "$DDS_ROOT/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/OpenDDS_LICENSE"
  install -Dm644 ACE_wrappers/COPYING "$pkgdir/usr/share/licenses/$pkgname/ACE_TAO_LICENSE"
  # TODO Other licences
}

# vim:set ts=2 sw=2 et:
