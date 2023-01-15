# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=sssd-nosmb
_pkgname=sssd
pkgver=2.8.1
pkgrel=2
pkgdesc="System Security Services Daemon"
arch=('x86_64' 'i686')
url="https://github.com/SSSD/sssd"
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
  'pcre2'
  'ldb'
  'cifs-utils'
  'dbus'
  'glib2'
  'nfsidmap'
  'jansson'
  'jose'
  'libtevent.so'
  'libldb.so'
  'curl'
  'pcre2'
)
makedepends=(
  'docbook-xsl'
  'doxygen'
  'python'
#  'samba'         # for libndr-nbt headers
  'systemd'
  'tevent'
  'ldb'
)
checkdepends=(
  'check'
  'cmocka'
  'libfaketime'
  'openssh'
  'softhsm'
)
options=('!lto')
backup=('etc/logrotate.d/sssd')
source=("https://github.com/SSSD/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('419798fa3e7ab0ad407d9f53ead183e6c4ffb534c93ed20a944a2eea6760bffaa2336373a8d52bd43f8e7c100e52fccecc9d0859bde04f8ce4e7406102024c0e'
            'SKIP')
validpgpkeys=('C13CD07FFB2DB1408E457A3CD3D21B2910CF6759')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=($_pkgname)


prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  for f in "${source[@]}"; do
    f=$(basename "$f")
    if [[ $f == *.patch ]]; then
      patch -p1 < "$srcdir/$f"
    fi
  done

  sed -i 's#/var/run/#/run/#' src/examples/logrotate

  # Fix issue with autoconf 2.70+
  sed '/AM_PROG_CC_C_O/ i AC_PROG_CPP' -i configure.ac

  # dbus policy files in /usr/share/dbus-1
  sed -i 's/^dbuspolicydir = $(sysconfdir)/dbuspolicydir = $(datadir)/' Makefile.in

  # fix search path for libsofthsm2.so
  # see: https://github.com/SSSD/sssd/issues/5329
  sed -i 's#/usr/lib64/pkcs11/libsofthsm2.so ##' src/external/test_ca.m4

  # remove flaky network test
  sed '/fail_over-tests/d' -i Makefile.am
  autoreconf -fiv
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
    --enable-pac-responder                        \
    --with-initscript=systemd                     \
    --with-os=fedora                              \
    --with-pid-path=/run                          \
    --without-python2-bindings                    \
    --without-python3-bindings                    \
    --with-syslog=journald                        \
    --without-samba                               \
    --without-selinux                             \
    --without-semanage                            \
    --with-systemdunitdir=/usr/lib/systemd/system \
    ;
  sed -i '/\<HAVE_KRB5_SET_TRACE_CALLBACK\>/d' config.h
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make check
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

  install -Dm0644 src/examples/logrotate "$pkgdir/etc/logrotate.d/sssd"

  cd "$srcdir"
  rm -rf "$pkgdir/etc/systemd" # remove the drop-in
}

# vim: ts=2:sw=2:et:nowrap
