pkgname=python-r3pcomms-git
pkgver=2.1.1.dev1+g25fb505
pkgrel=1
pkgdesc="Local communication with a River 3 Plus over USB HID and/or CDC(ACM)"
arch=('any')
url='https://github.com/greyltc/r3pcomms'
license=('MIT')
depends=(
	python-pyserial
	python-pyusb
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-hatchling
	python-hatch-vcs
	python-hatch
	)
source=(
	git+https://github.com/greyltc/r3pcomms.git
	99-r3pcomms.rules
	r3pcomms.sysusers
)
conflicts=(python-r3pcomms)
provides=(python-r3pcomms)
sha256sums=('SKIP'
            '3e045646c311e6c68e12fca85fdc5a7d151069aaa4c4214e27ede13ca7bc427d'
            '7210679c9799b504f6f64f50966b099893691793da669fc1cea25e8a5a8df78e')

install=r3pcomms.install

pkgver() {
  cd r3pcomms
  hatch version
}

build() {
  cd r3pcomms
  python -m build --wheel --no-isolation
}

package() {
  cd r3pcomms
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dt "${pkgdir}/etc/udev/rules.d" -m644 ../99-r3pcomms.rules
  install -Dt "${pkgdir}/usr/bin" -m755 scripts/ups-poweroff.sh
  install -Dm 644 ../r3pcomms.sysusers "${pkgdir}/usr/lib/sysusers.d/r3pcomms.conf"
}
