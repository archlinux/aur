# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Contributor: Goncalo Camelo Neves Pereira <up201503829@fe.up.pt>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=opendds
_pkgname=OpenDDS
pkgver=3.13.3
pkgrel=3
_ace_tao_version=6.5.8
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
provides=('ace' 'tao')
options=('!buildflags')
source=(
  "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-$(echo $_ace_tao_version | sed -e 's/\./_/g')/ACE+TAO-$_ace_tao_version.tar.gz"
  "https://github.com/objectcomputing/OpenDDS/releases/download/DDS-$pkgver/OpenDDS-$pkgver.tar.gz"
  build.patch
)
md5sums=('456034b884332f68ecaabbbfac4b0b64'
         '35a0907fd6d6b9c29a5c4718e8c35624'
         'e0e1e325285a4b3e81a87673a43b4194')

prepare() {
  cd "$srcdir"
  mv "OpenDDS-$pkgver" OpenDDS
  patch --strip=1 -i ../build.patch
}

build() {
  cd "$srcdir/OpenDDS"
  ./configure \
    --ace="$srcdir/ACE_wrappers" \
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
