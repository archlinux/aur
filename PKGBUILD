# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=sbupdate-mkinitcpio
_srcname=sbupdate
pkgver=0.4
pkgrel=1
pkgdesc="Generate (signed) Unified Kernel Images"
arch=('any')
url="https://github.com/YHNdnzj/sbupdate"
license=('GPL3')
provides=('sbupdate')
conflicts=('sbupdate' 'sbupdate-git')
backup=("etc/sbupdate.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('cc102aee4c78afff0141cecaf870017cc0339b1ae73f26c82c05082adb340dff001d2d2e584e192a35c70b209bacc588e86e2f610bd8e155b88abce24a447569')

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
