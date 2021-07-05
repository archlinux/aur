# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
         "${pkgbase}-host"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B3
pkgrel=2
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'sdl2_ttf' 'fontconfig' 'spice-protocol' 'wayland-protocols'
             'libxss' 'libxi' 'obs-studio')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/ci/host/source?id=551"
        "version-fix.patch::https://github.com/gnif/LookingGlass/commit/6c545806abc5441be994a1f9315cfd75d4b89682.diff")
sha512sums=('a76e4b373c53bd2cb87d8ab6179da47567ac75c9144c74c6df212e9cb3f4b929be8901163e3b6fc04b54a1ae6a5c10815b7ee921ceab1aa9a3df2cb9b0b82a2c'
            '729252c6cb346d9f78b4c6d8a1aa6d9991a2fa683e2b77168d09aaf9eec37621d418828330db63b1f786d86014449d5f4f807607483654f5927867e6e7aecca1')

_lgdir="looking-glass-B3-0-g2973319bff"

prepare() {
	cd "${srcdir}/${_lgdir}"

	# https://aur.archlinux.org/pkgbase/looking-glass/#comment-815934
	patch -Np1 < "${srcdir}/version-fix.patch"
}

build() {
	cd "${srcdir}/${_lgdir}"
	for b in {client,host,obs}; do
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr .
		make
		popd
	done
}

package_looking-glass() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'nettle' 'fontconfig' 'libxss' 'libxi')

	cd "${srcdir}/${_lgdir}/client"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-module-dkms() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')

	cd "${srcdir}/${_lgdir}/module"
	install -Dm644 -t "${pkgdir}/usr/src/${pkgbase}-${pkgver}" \
		Makefile \
		dkms.conf \
		kvmfr.{h,c}
}

package_looking-glass-host() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('libxcb' 'zlib')

	cd "${srcdir}/${_lgdir}/host"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/liblooking-glass-obs.so"
}
