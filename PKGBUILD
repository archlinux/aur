# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Mantas M. <grawity@gmail.com>

pkgname=sssd-nosmb
_pkgname=sssd
pkgver=2.2.0
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
sha512sums=('9ebd8784e1f0c72cb808bbc153c0b0aa9bf507938f78336a260073a89b49350dc2c6172653509738ea7a50bb9da596725e1d6c92f99c7a03308aa42f6378dbbb')
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
