# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=ipfs-fuse-daemon
pkgver=0.0.0
pkgrel=1
pkgdesc="systemd daemon to mount ipfs as a fuse"
url=https://github.com/KSXGitHub/ipfs-fuse-daemon.pkgbuild
arch=(any)
license=(MIT)
depends=(bash go-ipfs fuse2)
source=(https://raw.githubusercontent.com/KSXGitHub/MIT/master/LICENSE.md)
sha512sums=(SKIP)

package() {
  cd "$srcdir"/${_dirname}

  (
    echo '#! /usr/bin/bash'
    echo 'fusermount -u /ipfs'
    echo 'fusermount -u /ipns'
    echo 'ipfs mount'
  ) > start-ipfs-fuse-daemon.sh

  (
    echo '[Unit]'
    echo 'Description=Daemon to mount IPFS'
    echo 'After=ipfs.service'
    echo ''
    echo '[Service]'
    echo 'ExecStart=/usr/bin/start-ipfs-fuse-daemon.sh'
    echo 'Restart=on-failure'
    echo 'RestartSec=3'
    echo ''
    echo '[Install]'
    echo 'WantedBy=default.target'
  ) > ipfs-fuse.service

  install -Dm755 start-ipfs-fuse-daemon.sh "$pkgdir"/usr/bin/start-ipfs-fuse-daemon.sh
  install -Dm644 ipfs-fuse.service "$pkgdir"/usr/lib/systemd/user/ipfs-fuse.service
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
