pkgname=python-r3pcomms-git
pkgver=3.2.0
pkgrel=1
pkgdesc="Local communication with a River 3 Plus over USB HID and/or CDC(ACM)"
arch=('x86_64')
url='https://github.com/greyltc/r3pcomms'
license=('MIT')
depends=(
	python-pyserial
	python-hidapi
	udev-hid-bpf
	mqttui
)
makedepends=(
	git
	python-build
	python-installer
	python-wheel
	python-hatchling
	python-hatch-vcs
	python-hatch
	clang
	bpf
	libbpf
	)
source=(
	git+https://github.com/greyltc/r3pcomms.git
	99-r3pcomms.rules
	r3pcomms.sysusers
)
conflicts=(python-r3pcomms)
provides=(python-r3pcomms)
sha256sums=('SKIP'
            '7bba049cfd3aa1cfc36f61a069555f514e665be228f484ee08aa7296752bdd2c'
            'd12f182cd8780884592616d523e879dca9d69c60d7cf0f746ba9750da0dd5cd4')

install=r3pcomms.install

pkgver() {
  cd r3pcomms
  hatch version
}

build() {
  cd r3pcomms
  python -m build --wheel --no-isolation

  cd hid_fixes
  bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h
  clang -O2 -g -target bpf -c r3p_rd_patch.c -o r3p_fix_hid.bpf.o
}

package() {
  cd r3pcomms
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dt "${pkgdir}/etc/udev/rules.d" -m644 ../99-r3pcomms.rules
  install -Dt "${pkgdir}/etc/udev-hid-bpf" -m644 hid_fixes/r3p_fix_hid.bpf.o
  install -Dt "${pkgdir}/usr/bin" -m755 scripts/ups-poweroff.sh
  install -Dt "${pkgdir}/usr/bin" -m755 scripts/homeassistant-mqtt-publisher.sh
  install -Dm 644 ../r3pcomms.sysusers "${pkgdir}/usr/lib/sysusers.d/r3pcomms.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
