# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=sssd-nosmb
_pkgname=sssd
pkgver=2.2.2
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
sha512sums=('4cce8fdbcc05d1469dad5ba987cb0f9bc33702b37f85e8e248975461bb50b0740fec92ff213bdb640b506405be7ead936ff253ab02d4a27205ddf20cc0e54801')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=($_pkgname)


prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  for f in "${source[@]}"; do
    if [[ $f == *.patch ]]; then
      msg2 "Applying $f"
      patch -p1 < "$srcdir/$f"
    fi
  done

  # dbus policy files in /usr/share/dbus-1
  sed -i -e 's/^dbuspolicydir = $(sysconfdir)/dbuspolicydir = $(datadir)/' Makefile.in
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

# sed '1 s/python$/python2/' -i "$pkgdir"/usr/bin/sss_obfuscate
}

# vim: ts=2:sw=2:et:nowrap
