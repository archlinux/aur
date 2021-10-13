# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=huawei-wmi
pkgver=1.1.2
pkgrel=1
pkgdesc="Sets group write privileges and reinstates battery charge-thresholds."
arch=(any)
url="https://github.com/qu1x/huawei-wmi"
license=('custom:Fair')
optdepends=('huawei-wmi-dkms: for kernel <5.5')
install='huawei-wmi.install'
source=("https://github.com/qu1x/huawei-wmi/archive/v${pkgver}.tar.gz"
        'huawei-wmi.users'
        'huawei-wmi.files')
sha256sums=('03e3b28e2b5d5380f04f44847005e97f3b5f02cb54233f0ccc8f6f2deb418ed1'
            'd56eea27ee8dad292956d3a39e6d47f5acba676da56890c9b73081789782975e'
            '7179b5ca0ef6fae55a33dac664a5de853aab8c898cc6c2ff6d2f8a4cb6c0eb42')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "${srcdir}/huawei-wmi.users" "${pkgdir}/usr/lib/sysusers.d/huawei-wmi.conf"
	install -Dm644 "${srcdir}/huawei-wmi.files" "${pkgdir}/usr/lib/tmpfiles.d/huawei-wmi.conf"

	cd './generic'
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	cd "./${pkgname}-${pkgver}"
	install -d "${pkgdir}/etc/default/huawei-wmi"
	install -Dm644 '10-huawei-wmi.rules' -t "${pkgdir}/usr/lib/udev/rules.d/"
	install -Dm644 'huawei-wmi-'{privilege,reinstate}'.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm755 'available' 'privilege' 'reinstate' -t "${pkgdir}/usr/lib/huawei-wmi/"
}
