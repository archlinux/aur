# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Mantas M. <grawity@gmail.com>

pkgname=sssd-nosmb
_pkgname=sssd
pkgver=2.0.0
pkgrel=1
pkgdesc="System Security Services Daemon"
arch=('x86_64' 'i686')
url="https://pagure.io/SSSD/sssd"
license=('GPL3')
depends=(
  'bind'          # for nsupdate
  'c-ares'
  'cyrus-sasl-gssapi'
  'ding-libs'
  'libnl'
  'libunistring'
  'nss'
#  'smbclient'     # for libndr-nbt
  'ldb'
  'cifs-utils'
  'dbus'
  'glib2'
  'nfsidmap'
  'jansson'
)
makedepends=(
  'docbook-xsl'
  'doxygen'
  'python'
  'python2'
#  'samba'         # for libndr-nbt headers
#  'systemd'
)
source=("https://releases.pagure.org/SSSD/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('affeb0799d8a4fcbcb4b2ed7925b397ae6ba0e2982c5603e98636b765d3820a3b29ac58b0771e5cc00c752512f091ae4fd271d441544147a0570d3c14b535701')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)


prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  for f in "${source[@]}"; do
    if [[ $f == *.patch ]]; then
      msg2 "Applying $f"
      patch -p1 < "$srcdir/$f"
    fi
  done
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr                                 \
    --sbindir=/usr/bin                            \
    --sysconfdir=/etc                             \
    --localstatedir=/var                          \
    --libexecdir=/usr/lib/sssd                    \
    --datadir=/usr/share                          \
    --enable-pammoddir=/usr/lib/security          \
    --with-initscript=systemd                     \
    --with-os=fedora                              \
    --with-pid-path=/run                          \
    --without-python2-bindings                       \
    --without-python3-bindings                       \
    --with-syslog=journald                        \
    --without-samba                               \
    --without-selinux                             \
    --without-semanage                            \
    --with-systemdunitdir=/usr/lib/systemd/system \
    ;
  sed -i '/\<HAVE_KRB5_SET_TRACE_CALLBACK\>/d' config.h
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/etc/rc.d
  rm -rf "$pkgdir"/lib
  rm -rf "$pkgdir"/run
  rm -f "$pkgdir"/usr/lib/ldb/modules/ldb/memberof.la
  find "$pkgdir"/usr -depth -type d \
    -exec rmdir --ignore-fail-on-non-empty {} \;

  cd "$srcdir"
  rm -rf "$pkgdir/etc/systemd" # remove the drop-in
}

# vim: ts=2:sw=2:et:nowrap
