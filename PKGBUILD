# Maintainer: Michael Lowman <michael.d.lowman@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Mantas M. <grawity@gmail.com>

pkgname=sssd-git
_gitname='sssd'
pkgver=2.2.3.r18.g2c13d8bd0
pkgrel=1
pkgdesc="System Security Services Daemon"
arch=('x86_64')
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
  'smbclient'     # for libndr-nbt
  'nfsidmap'
  'jansson'
)
makedepends=(
  'docbook-xsl'
  'doxygen'
  'python'
  'python2'
  'samba'         # for libndr-nbt headers
  'systemd'
)
provides=('sssd')
conflicts=('sssd')
source=('git+https://pagure.io/SSSD/sssd.git')
sha512sums=('SKIP')

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

  autoreconf -if

  # dbus policy files in /usr/share/dbus-1
  sed -i -e 's/^dbuspolicydir = $(sysconfdir)/dbuspolicydir = $(datadir)/' Makefile.in
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
    --with-initscript=systemd                     \
    --with-os=fedora                              \
    --with-pid-path=/run                          \
    --with-python3-bindings                       \
    --with-python2-bindings                       \
    --with-syslog=journald                        \
    --without-selinux                             \
    --without-semanage                            \
    --with-systemdunitdir=/usr/lib/systemd/system \
    ;
  sed -i '/\<HAVE_KRB5_SET_TRACE_CALLBACK\>/d' config.h
  make
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

  cd "$srcdir"
  rm -rf "$pkgdir/etc/systemd" # remove the drop-in
}

# vim: ts=2:sw=2:et:nowrap
