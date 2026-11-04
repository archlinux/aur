# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13-tablet-kit
pkgver=1.0.5
pkgrel=1
pkgdesc='Posture-aware tablet mode for the 2025 ASUS ROG Flow Z13 (GZ302) 3-in-1 on KDE Plasma 6 / Wayland'
arch=('any')
url='https://github.com/aic0d3r/z13-tablet-kit'
license=('Apache-2.0')
depends=('python' 'python-evdev' 'qt6-tools' 'glib2' 'libkscreen' 'kconfig' 'plasma-keyboard' 'z13ctl-plus-bin')
optdepends=('maliit-keyboard: alternative on-screen keyboard in the session'
            'iio-sensor-proxy: Plasma auto-rotate'
            'z13gui-plus-bin: posture/health overlay and tablet settings')
install=z13-tablet-kit.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aic0d3r/z13-tablet-kit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b946edf34848acf3dbf717101b3a8d752a254e97182c622d8237056a65394c15')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 bin/dock bin/z13-tablet-switch bin/z13-touch-scroll -t "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 systemd/*.service -t "${pkgdir}/usr/lib/systemd/user/"
    sed -i "s#%h/.local/bin/#/usr/lib/${pkgname}/#" "${pkgdir}"/usr/lib/systemd/user/*.service
    install -Dm644 udev/*.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    # Sorts after the distro's zz-wayland.conf; /etc/sddm.conf.d still overrides it.
    install -Dm644 sddm/z13-osk.conf "${pkgdir}/usr/lib/sddm/sddm.conf.d/zzz-z13-osk.conf"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
