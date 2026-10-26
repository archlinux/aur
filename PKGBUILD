# Maintainer: Victor Zhuk <zhuk at pm dot me>

pkgname=mon-1stplayer
pkgver=0.1.2
pkgrel=1
pkgdesc='Linux hardware monitor daemon for the 1STPLAYER USB display'
arch=('x86_64')
url='https://github.com/victorzhuk/mon-1stplayer-linux'
license=('Apache-2.0')
depends=('glibc' 'systemd' 'nvidia-utils')
makedepends=('go>=1.27.3')
conflicts=('mon-1stplayer-bin' 'mon-1stplayer-git')
backup=('etc/mon-1stplayer.conf')
source=("mon-1stplayer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2f01c87ab71cb4afc78a03bb0c3380857261ecf36840995acb0a03c3d6671d1')

prepare() {
    cd "mon-1stplayer-linux-$pkgver"
    timeout --kill-after=5s 120s go mod download
    timeout --kill-after=5s 60s go mod verify
}

build() {
    cd "mon-1stplayer-linux-$pkgver"
    make build
}

check() {
    cd "mon-1stplayer-linux-$pkgver"
    make test
}

package() {
    cd "mon-1stplayer-linux-$pkgver"
    install -Dm755 'bin/mon-1stplayer' "$pkgdir/usr/bin/mon-1stplayer"
    install -Dm644 'deploy/mon-1stplayer.service' "$pkgdir/usr/lib/systemd/system/mon-1stplayer.service"
    install -Dm644 'deploy/mon-1stplayer.sysusers' "$pkgdir/usr/lib/sysusers.d/mon-1stplayer.conf"
    install -Dm644 'deploy/70-mon-1stplayer.rules' "$pkgdir/usr/lib/udev/rules.d/70-mon-1stplayer.rules"
    install -Dm644 'deploy/mon-1stplayer.conf' "$pkgdir/etc/mon-1stplayer.conf"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
