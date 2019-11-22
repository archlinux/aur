# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Former Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=opendds
pkgver=3.13.3
pkgrel=1
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
provides=('ace' 'tao')
options=('!buildflags')
install=opendds.install
source=(
  "https://github.com/objectcomputing/OpenDDS/releases/download/DDS-${pkgver}/OpenDDS-${pkgver}.tar.gz"
  build.patch
  tao-cosnaming.service
)
sha256sums=(
  # OpenDDS-VERSION.tar.gz
  '2f0600fb1bdeea0f8e8b6d1720f0552d20d5a3ea983c1c329095f9940dfa402c'
  # build.patch
  '17b1846d2c98daf4e51924a0deab767651ed29821a516414693363ee949614d8'
  # tao-cosnaming.service
  '2b8af1b2ce852a6bf79a4cdaa6e975b4668f82d56f1bde0b70446b8ce328bd1d'
)

prepare() {
  cd "$srcdir"
  mv "OpenDDS-$pkgver" OpenDDS
  #patch -Np1 -b -z .orig -i ../build.patch
}

build() {
  cd "$srcdir/OpenDDS"
  ACE_ROOT="$srcdir/ACE_wrappers" \
  TAO_ROOT="$ACE_ROOT/TAO" \
  MPC_ROOT="$ACE_ROOT/MPC" \
  ./configure \
    --prefix="/usr" \
    --no-tests \
    --ace-github-latest
  make
}

package() {
  source "$srcdir/OpenDDS/setenv.sh"
  cd "$DDS_ROOT"
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 ACE_wrappers/rpmbuild/etc/tao/tao-cosnaming.conf "$pkgdir/etc/tao/tao-cosnaming.conf"
  install -Dm644 ACE_wrappers/rpmbuild/ace-tao-init-fedora/tao/tao-cosnaming.opt "$pkgdir/etc/tao/tao-cosnaming.opt"
  install -Dm644 tao-cosnaming.service "$pkgdir/usr/lib/systemd/system/tao-cosnaming.service"
  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  printf 'd /run/tao 0750 tao tao\n' >"$pkgdir/usr/lib/tmpfiles.d/tao.conf"
  install -Dm644 "$DDS_ROOT/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/opendds_LICENSE"
  install -Dm644 ACE_wrappers/COPYING "$pkgdir/usr/share/licenses/$pkgname/acetao_LICENSE"
}

# vim:set ts=2 sw=2 et:
