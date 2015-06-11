# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=opendds-git
pkgver=3.5.1
pkgrel=1
pkgdesc="Open source C++ implementation of OMG Data Distribution Service (DDS)"
arch=('i686' 'x86_64')
url="http://www.opendds.org/"
license=('custom')
depends=('perl' 'bash')
options=('!buildflags')
makedepends=('git')
install=opendds.install
source=(
    "MPC::git+https://github.com/bbidulock/MPC.git"
    "ORB::git+https://github.com/bbidulock/Middleware.git"
    "DDS::git+https://github.com/bbidulock/DDS.git"
    build.patch
    tao-cosnaming.service
    )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '82faf0c3937f350a76b24e69b3ffa7e5'
         '63fba1c486fb3ed8b216e0b456b50988')

prepare() {
  cd "$srcdir"
  patch -Np1 -b -z .orig -i build.patch
}

build() {
  cd DDS
  export DOC_ROOT="$srcdir/ORB"
  export ACE_ROOT="$DOC_ROOT/ACE"
  export TAO_ROOT="$DOC_ROOT/TAO"
  export CIAO_ROOT="$DOC_ROOT/CIAO"
  export DANCE_ROOT="$DOC_ROOT/DAnCE"
  export DDS_ROOT="$srcdir/DDS"
  export MPC_ROOT="$srcdir/MPC"
  export WIRESHARK_SRC="/usr/include/wiresharek"
  export GLIB_ROOT="/usr"
  export BOOST_ROOT="/usr"
  export JAVA_HOME="/usr"
  ./configure
  make INSTALL_PREFIX="/usr"
}

package() {
  cd DDS
  export DOC_ROOT="$srcdir/ORB"
  export ACE_ROOT="$DOC_ROOT/ACE"
  export TAO_ROOT="$DOC_ROOT/TAO"
  export CIAO_ROOT="$DOC_ROOT/CIAO"
  export DANCE_ROOT="$DOC_ROOT/DAnCE"
  export DDS_ROOT="$srcdir/DDS"
  export MPC_ROOT="$srcdir/MPC"
  export WIRESHARK_SRC="/usr/include/wiresharek"
  export GLIB_ROOT="/usr"
  export BOOST_ROOT="/usr"
  export JAVA_HOME="/usr"
  sh ./setenv.sh
  make INSTALL_PREFIX="/usr" DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 ORB/ACE/rpmbuild/etc/tao/tao-cosnaming.conf "$pkgdir/etc/tao/tao-cosnaming.conf"
  install -Dm644 ORB/ACE/rpmbuild/ace-tao-init-fedora/tao/tao-cosnaming.opt "$pkgdir/etc/tao/tao-cosnaming.opt"
  install -Dm644 tao-cosnaming.service "$pkgdir/etc/systemd/system/tao-cosnaming.service"
  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  printf 'd /run/tao 0750 tao tao\n' >"$pkgdir/usr/lib/tmpfiles.d/tao.conf"
  install -Dm644 DDS/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.opendds"
  install -Dm644 ORB/ACE/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE.docorb"
}

# vim:set ts=2 sw=2 et:
