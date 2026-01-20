# Maintainer: Hoang Dinh <dinhmanhhoang150197@gmail.com>
pkgbase='foundationdb'
# 1. Define BOTH packages here
pkgname=('foundationdb-clients' 'foundationdb')
pkgver='7.3.67'
# Note: Since the download URL depends on pkgrel, do not change this unless upstream updates!
pkgrel='1'
pkgdesc='FoundationDB scalable, fault-tolerant, ordered key-value store'
arch=('x86_64')
url='https://www.foundationdb.org'
license=('Apache')
options=('!debug')
makedepends=('binutils') # Needed for 'ar' command

# Source array contains files for BOTH packages
source=("https://github.com/apple/foundationdb/releases/download/$pkgver/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb"
  "https://github.com/apple/foundationdb/releases/download/$pkgver/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb"
  'foundationdb-clients.sysusers'
  'foundationdb-clients.tmpfiles'
  'foundationdb-server.tmpfiles'
  'foundationdb-server.service'
  'foundationdb-server.install')

sha256sums=('6e61112a35432e9e12c823681291b5ce4a3e07f5a77f5480c91362bf1ceef56e'
            '310b638bb262c9bbeff3ccd49db6faa045a552834c8706c46177d4e902bea792'
            '323a67bfef40289eabc1924d0032c7d9578c9d6c1da0de407b39ea81b40b53e2'
            'd562815a86ef3343f55ef18c061298558f73e9cd23f6a9f10d630285057498a1'
            'ef9f201d4de05d62278ceb6c0773f7522ea113c01407ecc4eac1b226de29f013'
            'dded6e66c1e31d877ed7d9ead59f970f64c22569c36e52c6d2f4356757ea0341'
            'f892cc840d3d3432a4f37b4a33be9454b9bf0750b179a7fb5c449e3f56a1ba3f')

# --- PACKAGE: foundationdb-clients ---
package_foundationdb-clients() {
  pkgdesc='FoundationDB clients'
  depends=('glibc')
  optdepends=('python: for recommended features')

  # Extract the clients .deb
  ar p "$srcdir/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb" data.tar.gz | tar -zx -C "$pkgdir/"

  # Install its helper files
  install -Dm644 "$srcdir/foundationdb-clients.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/foundationdb-clients.conf"

  install -Dm644 "$srcdir/foundationdb-clients.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/foundationdb-clients.conf"
}

# --- PACKAGE: foundationdb (The Server) ---
# Renamed from 'package_foundationdb-server' to match pkgname
package_foundationdb() {
  pkgdesc='FoundationDB server daemon and utilities'
  depends=('foundationdb-clients' 'systemd')

  # 2. Assign the install script ONLY to the server package
  install='foundationdb-server.install'

  # Provides/Conflicts/Replaces allows this to satisfy "foundationdb-server" if needed
  provides=('foundationdb-server')
  conflicts=('foundationdb-server')
  replaces=('foundationdb-server')

  # Extract the server .deb
  ar p "$srcdir/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb" data.tar.gz | tar -zx -C "$pkgdir/"

  # --- Fix Binary Locations ---
  install -d "$pkgdir/usr/bin"
  mv "$pkgdir/usr/sbin/fdbserver" "$pkgdir/usr/bin/fdbserver"
  rm -rf "$pkgdir/usr/sbin"
  sed -i 's|/usr/sbin/fdbserver|/usr/bin/fdbserver|' \
    "$pkgdir/etc/foundationdb/foundationdb.conf"

  # Remove useless Debian init files
  rm -rf "$pkgdir/etc/init.d"

  # Install server helper files
  install -Dm644 "$srcdir/foundationdb-server.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/foundationdb-server.conf"

  # 3. Rename service file to standard name during install
  # This matches what our install script expects (foundationdb.service)
  install -Dm644 "$srcdir/foundationdb-server.service" \
    "$pkgdir/usr/lib/systemd/system/foundationdb.service"
}
