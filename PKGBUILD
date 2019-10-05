# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot-git
_srcname=btrfs-snapshot
pkgver=1.1.1.r0.g10e6e4a
pkgrel=4
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
makedepends=('git')
provides=('btrfs-snapshot')
conflicts=('btrfs-snapshot')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$_srcname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$_srcname"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot/parseopts|' \
        -e "s|VERSION|$pkgver|g" \
        -i btrfs-snapshot

    install -dm755 "$pkgdir"/usr/{bin,lib/{btrfs-snapshot,systemd/system}}

    install -Dm755 btrfs-snapshot "$pkgdir"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "$pkgdir"/usr/lib/btrfs-snapshot/parseopts

    install -Dt "$pkgdir"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}
}

# vim: set ts=4 sw=4 et:
