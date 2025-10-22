pkgname=ktls-utils
pkgver=1.3.0
pkgrel=1
pkgdesc="TLS handshake utilities for NFSv4, NVMe-oF, and other in-kernel TLS consumers"
url="https://github.com/oracle/ktls-utils"
license=(GPL-2.0-only)
arch=(x86_64)
depends=(
  glib2
  gnutls
  keyutils          # libkeyutils.so
  libnl             # libnl-3.so libnl-genl-3.so
)
makedepends=(gcc git make pkg-config)
source=("git+https://github.com/oracle/ktls-utils#tag=ktls-utils-$pkgver?signed")
sha256sums=('38bafb09c22d90929c3d4462cef5342815ef8abb39cd42283181a27431a741fa')
validpgpkeys=('28B2E5B01286DF243CF23EFE336AB3336F667F97')
install=$pkgname.install
backup=(etc/tlshd/config)

prepare() {
  cd $pkgname
  autoreconf -f -i
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --with-systemd            \
    ;
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # tlshd is a daemon, not a user-facing command, so I'm very much tempted to
  # place it in /usr/lib(exec) in order to declutter $PATH tab-completion.
  #mkdir -p "$pkgdir"/usr/lib/ktls-utils
  #mv "$pkgdir"/usr/{bin,lib/ktls-utils}/tlshd
  # ...or just, --sbindir=/usr/lib ??

  # Fix non-templated units to match ${sbindir}.
  sed -i 's,/usr/sbin/,/usr/bin/,g' "$pkgdir"/usr/lib/systemd/system/tlshd.service
  sed -i 's,/usr/sbin/,/usr/bin/,g' "$pkgdir"/usr/share/man/man8/tlshd.8

  # As packaged, the unit installs into remote-fs.target which is a "client"
  # target (and could, theoretically, be disabled on a server); although it
  # works, it's better to have nfs-server explicitly depend on tlshd.
  echo 'WantedBy=nfs-server.service' >> "$pkgdir"/usr/lib/systemd/system/tlshd.service
  echo 'WantedBy=nfsv4-server.service' >> "$pkgdir"/usr/lib/systemd/system/tlshd.service
}

# vim: ft=sh:ts=2:sw=2:et
