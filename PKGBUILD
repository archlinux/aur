# Maintainer: xpt <user.xpt@gmail.com>
# Contributor: Serge K <arch@phnx47.net>

pkgname=prey-node-client
pkgver=1.10.10
pkgrel=2
pkgdesc="Remote tracking and monitoring application for laptops, smartphones, and other electronic devices"
url="https://preyproject.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python' 'networkmanager' 'npm' 'gtk3' 'python-gobject')
provides=('prey-tracker')
install='prey-node-client.install'
source=('prey-tracker' 'fix-symlink-path-and-disable-auto-updates.patch' 'fix-lock.patch')
source_x86_64=("https://downloads.preyproject.com/prey-client-releases/node-client/$pkgver/prey-linux-$pkgver-x64.zip")
source_i686=("https://downloads.preyproject.com/prey-client-releases/node-client/$pkgver/prey-linux-$pkgver-x86.zip")
sha256sums=('41f29d334e7671b07cfdc848b2752ccc51710471285e8ebe61c07faa0d36160d'
            '0ec04bab461633885aa30ec673322e80c582b2478aab376f938a42fa75500707'
            'd4df726fb87b652b352ca44ddb78afe0e16e40dc130753d86c2cbfa92ac2781d')
sha256sums_x86_64=('c677d8279255ee505e454f38c922deab49168b2797a58f1990673a37d84923b3')
sha256sums_i686=('c09094dbea08c179d737573958280ba500cdb2422d85397fcd13918b42f54583')

package() {
  cd "$srcdir/prey-$pkgver"

  # Now, we use prey's node, so we don't delete bin/node
  # --------------------------------
  # We don't need the bundled node.js as we have it installed in the system.
  # Conveniently, the bash script probes for node.js and automatically uses
  # the system node if the bundled one is not found.
  # rm bin/node

  # Fix symlink path, and default-disable automatic updates
  patch -p0 < ${srcdir}/fix-symlink-path-and-disable-auto-updates.patch
  # Fix broken lock
  patch -p0 < ${srcdir}/fix-lock.patch

  mkdir -p "$pkgdir/opt/prey-node-client/"
  cp -r ./* "$pkgdir/opt/prey-node-client/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  mkdir -p "$pkgdir/usr/bin/"
  # Binary prey named as prey-tracker
  # ln -s /opt/prey-node-client/bin/prey "$pkgdir/usr/bin/prey-tracker"
  cp "$srcdir/prey-tracker" "$pkgdir/usr/bin/prey-tracker"
}

# vim:set ts=2 sw=2 et: 
