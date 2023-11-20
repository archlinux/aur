pkgname=ktls-utils
pkgver=0.10
pkgrel=2
pkgdesc="TLS handshake utilities for NFSv4, NVMe-oF, and other in-kernel TLS consumers"
url="https://github.com/oracle/ktls-utils"
license=(GPL2)
arch=(x86_64)
depends=(
  glib2
  gnutls
  libkeyutils.so
  libnl-3.so
)
makedepends=(gcc make pkg-config)
#_commit='175030fa5edd5b325cb7666b8691ac60365cf005'
#source=("git+https://github.com/oracle/ktls-utils#commit=$_commit")
#sha256sums=('SKIP')
source=("https://github.com/oracle/ktls-utils/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('919a5d34c274a6dfdd5d27754baf98c940f46bd732d8418e861d5cfe0d2f32b4')
backup=(etc/tlshd.conf)

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --with-systemd            \
    ;
  make
}

package() {
  cd $pkgname-$pkgver
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
