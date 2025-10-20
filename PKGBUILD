# Maintainer: Hoang Dinh <dinhmanhhoang150197@gmail.com>
pkgbase='foundationdb'
pkgname='foundationdb'
pkgver='7.3.67'
pkgrel='1'
pkgdesc='FoundationDB scalable, fault-tolerant, ordered key-value store'
arch=('x86_64')
url='https://www.foundationdb.org'
license=('Apache')
options=('!debug')
# Common dependencies
depends=('glibc')
optdepends=('python: for recommended features')
# Server-specific
conflicts=('foundationdb')
replaces=('foundationdb')
install='foundationdb-server.install'
backup=('etc/foundationdb/foundationdb.conf')

# Source array contains files for BOTH packages
source=("https://github.com/apple/foundationdb/releases/download/$pkgver/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb"
  "https://github.com/apple/foundationdb/releases/download/$pkgver/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb"
  'foundationdb-clients.sysusers'
  'foundationdb-clients.tmpfiles'
  'foundationdb-server.tmpfiles'
  'foundationdb-server.service'
  'foundationdb-server.install')

# SHA256 sums for ALL source files
sha256sums=('6e61112a35432e9e12c823681291b5ce4a3e07f5a77f5480c91362bf1ceef56e'
  '310b638bb262c9bbeff3ccd49db6faa045a552834c8706c46177d4e902bea792'
  '323a67bfef40289eabc1924d0032c7d9578c9d6c1da0de407b39ea81b40b53e2'
  'd562815a86ef3343f55ef18c061298558f73e9cd23f6a9f10d630285057498a1'
  'ef9f201d4de05d62278ceb6c0773f7522ea113c01407ecc4eac1b226de29f013'
  'dded6e66c1e31d877ed7d9ead59f970f64c22569c36e52c6d2f4356757ea0341'
  '199726f9af1d8d4a73ee650faf5fa2f863c33b5bec71ebc166593528ded9abed')

# --- PACKAGE: foundationdb-clients ---
package_foundationdb-clients() {
  pkgdesc='FoundationDB clients'
  # Clients depends only on glibc, which is at the top

  # Extract the clients .deb
  ar p "$srcdir/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb" data.tar.gz | tar -zx -C "$pkgdir/"

  # Install its helper files
  install -Dm644 "$srcdir/foundationdb-clients.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/foundationdb-clients.conf"

  install -Dm644 "$srcdir/foundationdb-clients.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/foundationdb-clients.conf"
}

# --- PACKAGE: foundationdb-server ---
package_foundationdb-server() {
  pkgdesc='FoundationDB server daemon and utilities'
  # Server depends on clients
  depends=('foundationdb-clients' 'systemd')

  # Extract the server .deb
  ar p "$srcdir/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb" data.tar.gz | tar -zx -C "$pkgdir/"

  # --- This is our fix from before ---
  install -d "$pkgdir/usr/bin"
  mv "$pkgdir/usr/sbin/fdbserver" "$pkgdir/usr/bin/fdbserver"
  rm -rf "$pkgdir/usr/sbin"
  sed -i 's|/usr/sbin/fdbserver|/usr/bin/fdbserver|' \
    "$pkgdir/etc/foundationdb/foundationdb.conf"
  # --- End fix ---

  # Remove useless Debian files
  rm -rf "$pkgdir/etc/init.d"

  # Install server helper files
  install -Dm644 "$srcdir/foundationdb-server.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/foundationdb-server.conf"

  install -Dm644 "$srcdir/foundationdb-server.service" \
    "$pkgdir/usr/lib/systemd/system/foundationdb.service"
}
