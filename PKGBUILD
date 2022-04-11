# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-kpuinput
pkgver=1.3
pkgrel=1
pkgdesc="Keepass plugin to use /dev/uinput for auto-typing"
depends=('keepass' 'libxkbcommon' 'systemd')
makedepends=('gcc' 'linux-headers')
arch=('x86_64')
url="https://keepass.info/"
source=("https://keepass.info/extensions/v2/kpuinput/KPUInput-${pkgver}-Source.zip"
        "https://keepass.info/extensions/v2/kpuinput/KPUInput-${pkgver}.zip"
        "path_fix.patch")
sha256sums=('f4619df4c27f0ca07cc4705124aeffb4072dbd164c5920d95e1fc4a946c79e40'
            '20fb468085a6c0b0f87f95efe7b94406acbacbc132d2f52b17d3d3087ee4a294'
            '81dbb6d635f6f52347e43dbbb27b6171eeb2f2bdedb6312d308ddf5a240cd982')

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
}
