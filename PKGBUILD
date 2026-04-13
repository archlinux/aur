# Maintainer: Anysets <anysets@qq.com>
pkgname=spark-store
pkgver=5.0.0_beta4
pkgrel=1
pkgdesc="A community powered app store."
arch=('x86_64' 'aarch64')
url="https://www.spark-app.store/"
license=('GPL3')
_tag_pkgver=5.0.0beta4
_deb_pkgver=5.0.0~beta4
depends=(
    nss
    libxss
    libxtst
    at-spi2-core
    desktop-file-utils
    libsecret
    xdg-utils
    lsb-release
    shared-mime-info
    libnotify
    util-linux
    polkit
    aria2
    zenity
    amber-package-manager
    flatpak
    qt5-base
    gtk3
)
install=spark-store.install
options=(!strip !debug)
source_x86_64=("https://gitee.com/spark-store-project/spark-store/releases/download/${_tag_pkgver}/spark-store_${_deb_pkgver}_amd64.deb")
source_aarch64=("https://gitee.com/spark-store-project/spark-store/releases/download/${_tag_pkgver}/spark-store_${_deb_pkgver}_arm64.deb")
sha256sums_x86_64=('e87d3b2b4ca4afd83c57e209373954ce8b9f1b9174341173fda6ed6eee5d6c29')
sha256sums_aarch64=('42910c277e66fb46470c335e74ea55799460dcc84daa5638a4501ad6da760750')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    # sed -i '2i\exit 0' "${pkgdir}/opt/durapps/spark-store/bin/aptss" || true

    # spark-store postinst
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/polkit-1/actions"
    # ln -sf $pkgdir/opt/durapps/spark-store/bin/ssinstall "$pkgdir/usr/bin/ssinstall"
    # ln -sf $pkgdir/opt/durapps/spark-store/bin/ssaudit "$pkgdir/usr/bin/ssaudit"
    ln -sf /opt/durapps/spark-store/bin/spark-dstore-patch "$pkgdir/usr/bin/spark-dstore-patch"
    ln -sf /opt/durapps/spark-store/bin/spark-store "$pkgdir/usr/bin/spark-store"
    ln -sf /opt/durapps/spark-store/bin/aptss "$pkgdir/usr/bin/aptss"


    # polkit policy
    install -Dm644 \
        "$pkgdir/opt/spark-store/extras/store.spark-app.spark-store.policy" \
        "$pkgdir/usr/share/polkit-1/actions/store.spark-app.spark-store.policy"
}
