# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=sbupdate-mkinitcpio
_srcname=sbupdate
pkgver=1.3
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
b2sums=('924e8b5d5c923436f9dd4275fd826f414688d7a1d978a73be7819e896dff6a63ddca95b3a08226a54a8fe1f1643206b46549639bd55f49194440d9a9e9d55a5c')

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
