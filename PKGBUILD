# Maintainer: Victor Zhuk <zhuk at pm dot me>
pkgname=mon-1stplayer-git
pkgver=r1.2d82ba4
pkgrel=1
pkgdesc='Linux hardware monitor daemon for the 1STPLAYER USB display'
arch=('x86_64')
url='https://github.com/victorzhuk/mon-1stplayer-linux'
license=('Apache-2.0')
depends=('glibc' 'systemd' 'nvidia-utils')
makedepends=('git' 'go>=1.27.3')
provides=('mon-1stplayer')
conflicts=('mon-1stplayer' 'mon-1stplayer-bin')
backup=('etc/mon-1stplayer.conf')
source=('mon-1stplayer-linux::git+https://github.com/victorzhuk/mon-1stplayer-linux.git')
sha256sums=('SKIP')

pkgver() {
    cd mon-1stplayer-linux
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd mon-1stplayer-linux
    timeout --kill-after=5s 120s go mod download
    timeout --kill-after=5s 60s go mod verify
}

build() {
    cd mon-1stplayer-linux
    make build
}

check() {
    cd mon-1stplayer-linux
    make test
}

package() {
    cd mon-1stplayer-linux
    install -Dm755 'bin/mon-1stplayer' "$pkgdir/usr/bin/mon-1stplayer"
    install -Dm644 'deploy/mon-1stplayer.service' "$pkgdir/usr/lib/systemd/system/mon-1stplayer.service"
    install -Dm644 'deploy/mon-1stplayer.sysusers' "$pkgdir/usr/lib/sysusers.d/mon-1stplayer.conf"
    install -Dm644 'deploy/70-mon-1stplayer.rules' "$pkgdir/usr/lib/udev/rules.d/70-mon-1stplayer.rules"
    install -Dm644 'deploy/mon-1stplayer.conf' "$pkgdir/etc/mon-1stplayer.conf"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/mon-1stplayer-git/LICENSE"
}
