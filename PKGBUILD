pkgname=python-r3pcomms-git
pkgver=2.1.1
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
	99-ef.rules
	efusb.sysusers
)
conflicts=(python-r3pcomms)
provides=(python-r3pcomms)
sha256sums=('SKIP'
            '279cfba01f5d9cdccf1c96708d964077435a145f00bd15113d351bf19bd0e7fd'
            'ea304f66f09bd8b989bb53e99f02ac8f3b538c2afa82d287594a371800acd25e')

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
  install -Dt "${pkgdir}/etc/udev/rules.d" -m644 ../99-ef.rules
  install -Dt "${pkgdir}/usr/bin" -m755 scripts/ups-poweroff.sh
  install -Dm 644 ../efusb.sysusers "${pkgdir}/usr/lib/sysusers.d/efusb.conf"
}
