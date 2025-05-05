pkgname=ktls-utils
pkgver=1.0.0
_commit=c787cd26330af457e1ca9cf43232db2c71c03154
pkgrel=1
pkgdesc="TLS handshake utilities for NFSv4, NVMe-oF, and other in-kernel TLS consumers"
url="https://github.com/oracle/ktls-utils"
license=(GPL-2.0-only)
arch=(x86_64)
depends=(
  glib2
  gnutls
  libkeyutils.so
  libnl-3.so
  libnl-genl-3.so
)
makedepends=(gcc git make pkg-config)
# recent releases do not have signed tags
#source=("git+https://github.com/oracle/ktls-utils#tag=v$pkgver?signed")
#sha256sums=('SKIP')
# and no more release tarballs either, apparently
#source=("https://github.com/oracle/ktls-utils/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
#sha256sums=('37262bff4e63764aa22949887a3d571c8081a0249800fcf24483214a7144f9ba')
source=("git+https://github.com/oracle/ktls-utils#commit=$_commit")
sha256sums=('a111d0d0aa3471d0d7880686b537382d00d60bc170f6aa45d4feb642d9b168af')
backup=(etc/tlshd.conf)

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
  sed -i 's,/usr/sbin/,/usr/bin/,g' "$pkgdir"/usr/lib/systemd/system/*.service

  # As packaged, the unit installs into remote-fs.target which is a "client"
  # target (and could, theoretically, be disabled on a server); although it
  # works, it's better to have nfs-server explicitly depend on tlshd.
  echo 'WantedBy=nfs-server.service' >> "$pkgdir"/usr/lib/systemd/system/tlshd.service
  echo 'WantedBy=nfsv4-server.service' >> "$pkgdir"/usr/lib/systemd/system/tlshd.service
}

# vim: ft=sh:ts=2:sw=2:et
