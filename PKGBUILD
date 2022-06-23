# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-kpuinput
pkgver=1.3
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
sha256sums=('f4619df4c27f0ca07cc4705124aeffb4072dbd164c5920d95e1fc4a946c79e40'
            '20fb468085a6c0b0f87f95efe7b94406acbacbc132d2f52b17d3d3087ee4a294'
            '44f988874f4bf7fe7b154b075293bf7cdd048be59ea99252fa9d48bcc0995cab'
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
	install -Dm644 "${srcdir}/KPUInput.plgx" "${pkgdir}/usr/share/keepass/Plugins/KPUInput.plgx"
	install -Dm644 "${srcdir}/KPUInputN.so" "${pkgdir}/usr/share/keepass/Plugins/KPUInputN.so"
	install -Dm644 "${srcdir}/89-kpuinput.rules" "${pkgdir}/usr/lib/udev/rules.d/89-kpuinput.rules"
}
