# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-kpuinput
pkgver=1.4
pkgrel=2
pkgdesc='Keepass plugin to use /dev/uinput for auto-typing'
depends=('keepass' 'libxkbcommon' 'systemd')
makedepends=('gcc' 'linux-api-headers')
arch=('x86_64')
url='https://keepass.info/help/kb/autotype_wayland.html'
license=('GPL')
source=("https://keepass.info/extensions/v2/kpuinput/KPUInput-${pkgver}-Source.zip"
        "https://keepass.info/extensions/v2/kpuinput/KPUInput-${pkgver}.zip"
        "path_fix.patch"
        "89-kpuinput.rules")
sha256sums=('65723a293fe904c94f37249720db4868ff87c472db6f75d0966100f199bab5af'
            '95af4f9147d43276b5d67b3ccb141757ca95b715d2d52a093ede2e27b5d0c585'
            '81dbb6d635f6f52347e43dbbb27b6171eeb2f2bdedb6312d308ddf5a240cd982'
            'e03ed96e0be14976f618be4f386aebf9ecb38982786295025a1f439ca47ea663')

prepare() {
	patch --forward --strip=1 --input=path_fix.patch

	mkdir KPUInput
	cp -r Properties *.cs *.csproj KPUInput/
}

build() {
	keepass --plgx-create "${srcdir}/KPUInput"
	sh ./KPUInputN.sh
}

package() {
	install -Dm644 "${srcdir}/KPUInput.plgx" "${pkgdir}/usr/share/keepass/plugins/KPUInput.plgx"
	install -Dm644 "${srcdir}/KPUInputN.so" "${pkgdir}/usr/share/keepass/plugins/KPUInputN.so"
	install -Dm644 "${srcdir}/89-kpuinput.rules" "${pkgdir}/usr/lib/udev/rules.d/89-kpuinput.rules"
}
