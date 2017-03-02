# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=sssd-git
pkgver=1.13.0.r69.gafa6ac7
pkgrel=1
pkgdesc="System Security Services Daemon"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/sssd/"
license=('GPL3')
depends=(
  'augeas'
  'bind'          # for nsupdate
  'c-ares'
  'cyrus-sasl-gssapi'
  'dbus-core'
  'ding-libs'
  'krb5'
  'ldb'
  'libldap'
  'libnl'
  'libsasl'
  'libunistring'
  'libxml2'
  'nspr'
  'nss'
  'pcre'
  'smbclient'     # for libndr-nbt
  'talloc'
  'tdb'
  'tevent'
)
makedepends=(
  'docbook-xsl'
  'doxygen'
  'python'
  'python2'
  'samba'         # for libndr-nbt headers
)
provides=("sssd=$pkgver")
conflicts=('sssd')
source=('git+https://pagure.io/SSSD/sssd.git'
        'sssd.service')
sha1sums=('SKIP'
          '2d10db3d6f54a58bbf8d1f27328e68555256e0ce')

pkgver() {
  cd "$srcdir/sssd"
  git describe | sed 's/^sssd-//; s/-/.r/; s/[_-]/./g'
}

prepare() {
  cd "$srcdir/sssd"
  sed -i '1s/\<python\>/&2/' src/sbus/sbus_codegen
}

build() {
  cd "$srcdir/sssd"
  export PYTHON=/usr/bin/python2
  autoreconf -i -f
  ./configure \
    --prefix=/usr                                 \
    --sbindir=/usr/bin                            \
    --sysconfdir=/etc                             \
    --localstatedir=/var                          \
    --libexecdir=/usr/lib/sssd                    \
    --datadir=/usr/share                          \
    --enable-all-experimental-features            \
    --enable-pammoddir=/usr/lib/security          \
    --with-initscript=systemd                     \
    --with-os=fedora                              \
    --with-pid-path=/run                          \
    --with-python2-bindings                       \
    --with-python3-bindings                       \
    --with-syslog=journald                        \
    --without-selinux                             \
    --without-semanage                            \
    --with-systemdunitdir=/usr/lib/systemd/system \
    ;
  sed -i '/\<HAVE_KRB5_SET_TRACE_CALLBACK\>/d' config.h
  make
}

package() {
  cd "$srcdir/sssd"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/etc/rc.d"
  rm -rf "$pkgdir/lib"
  rm -rf "$pkgdir/run"
  rm -f "$pkgdir/usr/lib/ldb/modules/ldb/memberof.la"
  find "$pkgdir/usr" -depth -type d \
    -exec rmdir --ignore-fail-on-non-empty {} \;

  cd "$srcdir"
  rm -rf "$pkgdir/etc/systemd" # remove the drop-in
  install -Dm644 sssd.service  "$pkgdir/usr/lib/systemd/system/sssd.service"
}

# vim: ts=2:sw=2:et
