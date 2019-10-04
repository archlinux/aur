# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot-git
_srcname=btrfs-snapshot
pkgver=1.0.2.r1.g4dd6670
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
optdepends=('systemd: Daily create snapshots')
source=("git+https://github.com/YHNdnzj/$_srcname.git")
md5sums=('SKIP')

pkgver() {
    cd "${_srcname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${_srcname}"
    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot/parseopts|' \
        -e "s|VERSION|${pkgver}|g" \
        -i btrfs-snapshot
}

package() {
    cd "${_srcname}"

    install -dm755 "${pkgdir}"/usr/{bin,lib/{btrfs-snapshot,systemd/system}}

    install -Dm755 btrfs-snapshot "${pkgdir}"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "${pkgdir}"/usr/lib/btrfs-snapshot/parseopts

    install -Dt ${pkgdir}/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}
}

# vim: set ts=4 sw=4 et:
