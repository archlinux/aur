# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=opendds
_pkgname=OpenDDS
pkgver=3.5.1
pkgrel=1
pkgdesc="Open source C++ implementaiton of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
options=('!buildflags')
install=opendds.install
source=(
    "http://download.ociweb.com/TAO-2.2a/ACE+TAO-2.2a_with_latest_patches_NO_makefiles.tar.gz"
    "http://download.ociweb.com/$_pkgname/$_pkgname-$pkgver.tar.gz"
    build.patch
    tao-cosnaming.service
    )
md5sums=('ba295977283364c4e03375442d2c1648'
         'aac9eaf951b9eabdd75c4365946f06d0'
         'fe01901b585b7d52724847aab9402775'
         '63fba1c486fb3ed8b216e0b456b50988')

prepare() {
  cd "$srcdir"
  patch -Np1 -b -z .orig -i ../build.patch
}

build() {
  cd DDS
  ./configure \
    --ace="$srcdir/ACE_wrappers" \
    --tao="$srcdir/ACE_wrappers/TAO"
  make
}

package() {
  cd DDS
  sh ./setenv.sh
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 ACE_wrappers/rpmbuild/etc/tao/tao-cosnaming.conf "$pkgdir/etc/tao/tao-cosnaming.conf"
  install -Dm644 ACE_wrappers/rpmbuild/ace-tao-init-fedora/tao/tao-cosnaming.opt "$pkgdir/etc/tao/tao-cosnaming.opt"
  install -Dm644 tao-cosnaming.service "$pkgdir/etc/systemd/system/tao-cosnaming.service"
  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  printf 'd /run/tao 0750 tao tao\n' >"$pkgdir/usr/lib/tmpfiles.d/tao.conf"
  install -Dm644 DDS/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.opendds"
  install -Dm644 ACE_wrappers/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE.docorb"
}

# vim:set ts=2 sw=2 et:
