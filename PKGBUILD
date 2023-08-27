# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=sbupdate-mkinitcpio
_srcname=sbupdate
pkgver=1.5
pkgrel=1
pkgdesc="Generate signed Unified Kernel Images"
arch=('any')
url="https://github.com/YHNdnzj/sbupdate"
license=('GPL3')
provides=('sbupdate')
conflicts=('sbupdate' 'sbupdate-git')
backup=("etc/sbupdate.conf")
install=sbupdate.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('617393d4acde15f75ffaee757b2c5caa2aec44f6c0f92be1bf64263a438db680bfd9e17daaa642a70f28b409234bb6d500c5dd8c4edee8f186b209422a903dd9')

package() {
    depends=('bash' 'systemd' 'systemd-ukify>=254rc1' 'mkinitcpio' 'sbsigntools')

    cd "$_srcname-$pkgver"

    sed -e 's|\(_f_config\)=.*|\1=/etc/sbupdate.conf|' \
        -e 's|\(_f_functions\)=.*|\1=/usr/lib/initcpio/functions|' \
        -i sbupdate

    install -Dm755 sbupdate "$pkgdir/usr/bin/sbupdate"
    install -Dm644 sbupdate.conf "$pkgdir/etc/sbupdate.conf"

    install -dm755 "$pkgdir/usr/lib/initcpio/post"
    ln -s /usr/bin/sbupdate "$pkgdir/usr/lib/initcpio/post/sbupdate"

    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 units/*

    install -Dm644 README.md "$pkgdir/usr/share/doc/$_srcname/README.md"
}

# vim: set ts=4 sw=4 et:
