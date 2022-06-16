# Maintainer: Jacob McSwain <jacob@mcswain.dev>
pkgname=cuttlefish-common-git
pkgver=0.9.24
pkgrel=1
pkgdesc="Cuttlefish host support package."
arch=(any)
license=(Apache)
url="https://github.com/google/android-cuttlefish"
makedepends=("git")
depends=(
    "xterm"
    "dnsmasq"
    "python"
    "ssvnc-nojava"
)
source=("${pkgname%-git}::git+https://github.com/google/android-cuttlefish.git")
sha256sums=('SKIP')
install="install.sh"

prepare() {
    patch "$srcdir/${pkgname%-git}"/debian/cuttlefish-base.cuttlefish-host-resources.init < ../0001-Fixup-init.d-service-to-be-used-in-usr-bin-for-syste.patch
}

package() {
    install -Dm0644 ../cuttlefish-common.service "$pkgdir/usr/lib/systemd/system/cuttlefish-common.service"

    cd "$srcdir/${pkgname%-git}"

    install -Dm0644 debian/cuttlefish-base.cuttlefish-host-resources.default "$pkgdir/etc/default/cuttlefish-common"
    install -Dm0755 debian/cuttlefish-base.cuttlefish-host-resources.init "$pkgdir/usr/bin/cuttlefish-common"
    install -Dm0644 host/packages/cuttlefish-base/etc/modules-load.d/cuttlefish-common.conf "$pkgdir/etc/modules-load.d/cuttlefish-common.conf"
    install -Dm0644 debian/cuttlefish-base.udev "$pkgdir/usr/lib/udev/rules.d/60-cuttlefish-common.rules"
    install -Dm0755 host/deploy/install_zip.sh "$pkgdir/usr/bin/install_zip.sh"
    install -Dm0755 host/deploy/capability_query.py "$pkgdir/usr/lib/cuttlefish-common/bin/capability_query.py"
    install -Dm0755 host/deploy/unpack_boot_image.py "$pkgdir/usr/lib/cuttlefish-common/bin/unpack_boot_image.py"

    cp -a host/packages/cuttlefish-integration/etc "$pkgdir/"
    install -Dm0644 debian/cuttlefish-integration.udev "$pkgdir/usr/lib/udev/rules.d/60-cuttlefish-integration.rules"

    install -Dm0644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm0644 debian/changelog "$pkgdir"/usr/share/doc/$pkgname/changelog
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
