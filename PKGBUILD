# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

pkgname=fido2-hid-bridge
pkgver=0.1.0
pkgrel=1
pkgdesc="This allows using authenticators over PC/SC from applications that only support USB-HID, such as Firefox; with this program running you can use NFC authenticators or Smartcards."
url="https://github.com/BryanJacobs/fido2-hid-bridge"
license=('MIT')
arch=('any')
depends=('python'
	 'python-fido2'
	 'python-pyscard')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=('git+https://github.com/BryanJacobs/fido2-hid-bridge.git#commit=6aa6c203f25132da4cc35207f4967b65683bac99'
	'uhid.py::https://raw.githubusercontent.com/FFY00/python-uhid/1addc8ac84443bc5a58f72128218a4e139b42ee4/src/uhid/__init__.py'
	"${pkgname}.service")
sha256sums=('806eb6b7b9e5a15dfbe7248e7da3bead5a578c14a99f916bc7db37c9f22adf4e'
            '7fad13e22f2c96fb4fb626e59a1f868badee29dd7ce03992b859d77d1e2bccaf'
            '5463b8d0c25bfa8ca9bef534e204be5e1b431268d6b5b5bdb14a70217b375904')

build() {
	cd "${srcdir}/${pkgname}"
	cp ../uhid.py fido2_hid_bridge/
	sed -i 's/^from uhid/from fido2_hid_bridge.uhid/' fido2_hid_bridge/ctap_hid_device.py 
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	cd "${srcdir}"
	install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
