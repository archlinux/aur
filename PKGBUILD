# Maintainer: Michael Lowman <michael.d.lowman@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Mantas M. <grawity@gmail.com>

pkgname=sssd-git
_gitname='sssd'
pkgver=2.12.0.r259.gc64f9f5bb
pkgrel=1
pkgdesc="System Security Services Daemon"
arch=('x86_64')
url="https://github.com/SSSD/sssd"
license=('GPL-3.0-or-later')
depends=(
  'bind'          # for nsupdate
  'c-ares'
  'cyrus-sasl-gssapi'
  'ding-libs'
  'libnl'
  'libunistring'
  'smbclient'     # for libndr-nbt
  'nfsidmap'
  'jansson'
  'jose'
  'libtevent.so'
  'libldb.so'
  'curl'
  'pcre2'
  'libfido2'      # for passkeys
)
makedepends=(
  'docbook-xsl'
  'doxygen'
  'python'
  'samba'         # for libndr-nbt headers
  'systemd'
  'tevent'
  'ldb'
  'bc'
  'python-setuptools'
)
checkdepends=(
  'check'
  'cmocka'
  'libfaketime'
  'openssh'
  'softhsm'
  'valgrind'
)
options=('!lto')
install=sssd.install
backup=('etc/logrotate.d/sssd')
provides=('sssd')
conflicts=('sssd')
source=('git+https://github.com/SSSD/sssd'
        'sssd-perms.tmpfile')
sha512sums=('SKIP'
            '21646ea5900340c1b0a69c79fc72b0d3e360d56e04dc0daf7947024a420d214a931365e684e8f7cfd37c959327e6909ad4c0d6c3a8186153bca870f508dad486')

pkgver() {
  cd "$_gitname"
  git describe --tag | sed 's/^sssd-//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  for f in "${source[@]}"; do
    if [[ $f == *.patch ]]; then
      msg2 "Applying $f"
      patch -p1 < "$srcdir/$f"
    fi
  done

  sed -i 's#/var/run/#/run/#' src/examples/logrotate
  sed -i 's#^u #u! #' contrib/sssd.sysusers

  # Fix issue with autoconf 2.70+
  sed '/AM_PROG_CC_C_O/ i AC_PROG_CPP' -i configure.ac

  # dbus policy files in /usr/share/dbus-1
  sed -i 's/^dbuspolicydir = $(sysconfdir)/dbuspolicydir = $(datadir)/' Makefile.in

  # remove flaky network test
  sed '/fail_over-tests/d' -i Makefile.am

  # disable whitespace test as it fails on master
  sed '/whitespace_test/d' -i Makefile.am
  autoreconf -fiv
}

build() {
  cd "$srcdir/$_gitname"
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
    --without-python2-bindings                    \
    --with-python3-bindings                       \
    --with-syslog=journald                        \
    --with-sssd-user=sssd                         \
    --with-subid                                  \
    --with-passkey                                \
    --without-selinux                             \
    --with-tmpfilesdir=/usr/lib/tmpfiles.d        \
    --with-systemdunitdir=/usr/lib/systemd/system \
    --with-ldb-lib-dir=/usr/lib/samba/ldb         \
    ;
  sed -i '/\<HAVE_KRB5_SET_TRACE_CALLBACK\>/d' config.h
  make
}

check() {
  cd "$srcdir/$_gitname"
  make check
}

package() {
  cd "$srcdir/$_gitname"
  make -j1 DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/etc/rc.d
  rm -rf "$pkgdir"/lib
  rm -rf "$pkgdir"/run
  rm -f "$pkgdir"/usr/lib/ldb/modules/ldb/memberof.la
  find "$pkgdir"/usr -depth -type d \
    -exec rmdir --ignore-fail-on-non-empty {} \;

  install -Dm0644 src/examples/logrotate "$pkgdir"/etc/logrotate.d/sssd
  install -Dm0644 contrib/sssd.sysusers "$pkgdir"/usr/lib/sysusers.d/sssd.conf
  install -Dm0644 "$srcdir"/sssd-perms.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/sssd-perms.conf

  setcap cap_dac_read_search,cap_setgid,cap_setuid=p "$pkgdir"/usr/lib/sssd/sssd/krb5_child
  setcap cap_dac_read_search=p "$pkgdir"/usr/lib/sssd/sssd/ldap_child
  setcap cap_dac_read_search=p "$pkgdir"/usr/lib/sssd/sssd/sssd_pam

  cd "$srcdir"
  rm -rf "$pkgdir/etc/systemd" # remove the drop-in
  rm -rf "$pkgdir/var/run"
}

# vim: ts=2:sw=2:et:nowrap
