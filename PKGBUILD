# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot-git
_srcname=btrfs-snapshot
pkgver=1.2.1.r0.ge2fcc88
pkgrel=2
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
makedepends=('git')
provides=('btrfs-snapshot')
conflicts=('btrfs-snapshot')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_srcname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${_srcname}"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|' \
        -e "s|VERSION|${pkgver}|g" \
        -i btrfs-snapshot

    install -Dm755 btrfs-snapshot "${pkgdir}"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "${pkgdir}"/usr/lib/btrfs-snapshot-po

    install -Dt "${pkgdir}"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
