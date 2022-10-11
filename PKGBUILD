# Maintainer: Jacob McSwain <jacob@mcswain.dev>
pkgname=cuttlefish-base-git
pkgver=0.9.25
pkgrel=1
pkgdesc="Cuttlefish Android Virtual Device companion package contains set of tools and binaries required to boot up and manage Cuttlefish Android Virtual Device that are used in all deployments."
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
    patch "$srcdir/${pkgname%-git}"/base/debian/cuttlefish-base.cuttlefish-host-resources.init < ../0001-Fixup-init.d-service-to-be-used-in-usr-bin-for-syste.patch
}

package() {
    install -Dm0644 ../cuttlefish-host-resources.service "$pkgdir/usr/lib/systemd/system/cuttlefish-host-resources.service"

    cd "$srcdir/${pkgname%-git}"

    install -Dm0644 base/debian/cuttlefish-base.cuttlefish-host-resources.default "$pkgdir/etc/default/cuttlefish-host-resources"
    install -Dm0755 base/debian/cuttlefish-base.cuttlefish-host-resources.init "$pkgdir/usr/bin/cuttlefish-host-resources"
    install -Dm0644 base/debian/cuttlefish-base.udev "$pkgdir/usr/lib/udev/rules.d/60-cuttlefish-base.rules"

    install -Dm0644 base/host/packages/cuttlefish-base/etc/modules-load.d/cuttlefish-common.conf "$pkgdir/etc/modules-load.d/cuttlefish-common.conf"

    install -Dm0755 base/host/deploy/install_zip.sh "$pkgdir/usr/bin/install_zip.sh"
    install -Dm0755 base/host/deploy/capability_query.py "$pkgdir/usr/lib/cuttlefish-common/bin/capability_query.py"
    install -Dm0755 base/host/deploy/unpack_boot_image.py "$pkgdir/usr/lib/cuttlefish-common/bin/unpack_boot_image.py"

    install -Dm0644 base/debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm0644 base/debian/changelog "$pkgdir"/usr/share/doc/$pkgname/changelog
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
