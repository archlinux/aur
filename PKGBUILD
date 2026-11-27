# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13-tablet-kit
pkgver=1.0.7
pkgrel=1
pkgdesc='Posture-aware tablet mode for the 2025 ASUS ROG Flow Z13 (GZ302) 3-in-1 on KDE Plasma 6 / Wayland'
arch=('any')
url='https://github.com/aic0d3r/z13-tablet-kit'
license=('Apache-2.0')
depends=('python' 'python-evdev' 'qt6-tools' 'glib2' 'libkscreen' 'kconfig' 'plasma-keyboard' 'z13ctl-plus-bin>=2.7.0')
optdepends=('maliit-keyboard: alternative on-screen keyboard in the session'
            'iio-sensor-proxy: Plasma auto-rotate'
            'z13gui-plus-bin>=2.9.0: posture/health overlay and tablet settings')
install=z13-tablet-kit.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aic0d3r/z13-tablet-kit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30440c06023748bd27a40df70ed415306e841d7ebc6f2331859faf9051f6ab1a')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 bin/dock bin/z13-tablet-switch bin/z13-touch-scroll bin/z13-touch-toggle -t "${pkgdir}/usr/lib/${pkgname}/"
    sed "s#@BIN@#/usr/lib/${pkgname}#" contrib/z13-touch-toggle.desktop \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/z13-touch-toggle.desktop"
    install -d "${pkgdir}/usr/share/kglobalaccel"
    ln -s ../applications/z13-touch-toggle.desktop "${pkgdir}/usr/share/kglobalaccel/z13-touch-toggle.desktop"
    install -Dm644 systemd/*.service -t "${pkgdir}/usr/lib/systemd/user/"
    sed -i "s#%h/.local/bin/#/usr/lib/${pkgname}/#" "${pkgdir}"/usr/lib/systemd/user/*.service
    install -Dm644 udev/*.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    # Sorts after the distro's zz-wayland.conf; /etc/sddm.conf.d still overrides it.
    install -Dm644 sddm/z13-osk.conf "${pkgdir}/usr/lib/sddm/sddm.conf.d/zzz-z13-osk.conf"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 docs/ARCHITECTURE.md docs/INSTALL.md docs/TIPS.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"
}
