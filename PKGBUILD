# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=sssd-nosmb
_pkgname=sssd
pkgver=2.6.1
pkgrel=3
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
  'libtevent.so'
  'libldb.so'
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
backup=('etc/logrotate.d/sssd')
source=("https://github.com/SSSD/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('5b35a66c37593de738f52d5ad2f7860067af4061bd11b2f5c4b701177ef1bc3091d3c3df573d751339e9c9bb07476988b0b030b91b6a33adcb663df16be80d81'
            'SKIP')
validpgpkeys=('E4E366758CA0716AAB8048671EC6AB7532E7BC25'
              '16F24229488E736048952737BA88000FE6398272'
              '1A41DC67505F89A330828B66AFFE75DDE8508E12')
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
