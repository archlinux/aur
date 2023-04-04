# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=sbupdate-mkinitcpio
_srcname=sbupdate
pkgver=1.0
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
b2sums=('757927d43a992ba7cd97d0d322934f7a40ca743705b6e6306f64a21188e72601efbe30463f12add67031694fc3d75f4b87ae548907665c06f01802bf90d78e30')

package() {
    depends=('bash' 'systemd' 'systemd-ukify' 'mkinitcpio' 'sbsigntools')

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
