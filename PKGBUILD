# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
_kernver="$(uname -r)"
_extramodules="extramodules-$(sed 's/\.[0-9]*-[0-9]*-/-/' <<< "${_kernver}")"
pkgname='vtuner-module-lts'
pkgdesc="VTuner client kernel module for virtual DVB's"
pkgver=1.4
pkgrel=2
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://code.google.com/p/vtuner/"
license=('GPL2')
makedepends=('linux-lts-headers')
depends=('linux-lts')
install='vtunerc-lts.install'
source=("vtuner.linux-driver-rel${pkgver}.tar.gz::https://github.com/lecotex/vtuner.linux-driver/archive/rel${pkgver}.tar.gz"
        'kernel-3.10.patch'
        'kernel-4.2.patch'
        'tweaks.patch'
        '93-vtunerc-lts.rules')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            'caf2b8c5c4bf7808da4c48fa272f1706e0ca1ca4db84a08d9d2373e6e38e7812'
            'ab7f8c73aa578e4bc0a7cf58c112115cb6f215eb0a7f013773d6d4a50730d527'
            'bd5d9b0659fb8a2d8555adc7f60bcf2915f29244402a744aac9e10b1a50adb8c'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d')

prepare() {
	cd ${srcdir}/vtuner.linux-driver-rel${pkgver}
	# some tweaks from https://code.google.com/p/satip
	patch -p1 -i ${srcdir}/tweaks.patch
	# compat patches
	patch -p1 -i ${srcdir}/kernel-3.10.patch
	patch -p1 -i ${srcdir}/kernel-4.2.patch
}

build() {
	cd ${srcdir}/vtuner.linux-driver-rel${pkgver}
	make KDIR="/usr/lib/modules/${_kernver}/build" VTUNERC_MAX_ADAPTERS=8
}

package() {
	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg
	sed \
		-e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
		-i "${startdir}/${install}"
	# package module
	install -Dm644 ${srcdir}/vtuner.linux-driver-rel${pkgver}/vtunerc.ko ${pkgdir}/usr/lib/modules/${_extramodules}/vtunerc.ko
	find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;
	# udev rule
	install -Dm644 ${srcdir}/93-vtunerc-lts.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc-lts.rules
}
