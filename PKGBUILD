# Maintainer: Fred Hornsey <hornseyf@objectcomputing.com>
# Former Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=opendds
_pkgname=OpenDDS
pkgver=3.13
pkgrel=1
_oci_ace_tao_patch=15
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
provides=('ace' 'tao')
options=('!buildflags')
install=opendds.install
source=(
  "http://download.ociweb.com/TAO-2.2a_patches/ACE+TAO-2.2a_p${_oci_ace_tao_patch}_complete_NO_makefiles.tar.gz"
  "http://download.ociweb.com/OpenDDS/OpenDDS-$pkgver.tar.gz"
  build.patch
  tao-cosnaming.service
)
md5sums=(
  # ACE+TAO-2.2a_pPATCH_complete_NO_makefiles.tar.gz
  '2ccae8afe84ef9978cb6a1ab21b91402'
  # OpenDDS-VERSION.tar.gz
  '0ff8fed7b1590f460ca0d6ae3de219ec'
  # build.patch
  'd8dda850a09ba6ba621be2eef7bc9329'
  # tao-cosnaming.service
  '63fba1c486fb3ed8b216e0b456b50988'
)

prepare() {
  cd "$srcdir"
  mv "OpenDDS-$pkgver" OpenDDS
  patch -Np1 -b -z .orig -i ../build.patch
}

build() {
  cd "$srcdir/OpenDDS"
  ACE_ROOT="$srcdir/ACE_wrappers" \
  TAO_ROOT="$ACE_ROOT/TAO" \
  MPC_ROOT="$ACE_ROOT/MPC" \
  ./configure \
    --prefix="/usr" \
    --no-tests
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
