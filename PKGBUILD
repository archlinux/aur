# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=2.1.5
_pkgname="${pkgname%-bin}"
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64' 'aarch64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libgl' 'glfw')
provides=('mujoco')
conflicts=('mujoco')
source=("${pkgname}.patch")
_src_url_prefix="https://github.com/deepmind/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux"
source_x86_64=("${_src_url_prefix}-x86_64.tar.gz")
source_aarch64=("${_src_url_prefix}-aarch64.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('3f1804d28833295a310aac23279401936f2558dee63cd3778429577e4ab55dff')
sha256sums_aarch64=('e00e5952c79e9164d3ea98d2b9c02b2b94449f428615c7fcbd9182db27b36e6e')

prepare() {
	cd "${_pkgname}-${pkgver}"

	# Patch testxml so that it works when the model directory is read only
	patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
	cd "${_pkgname}-${pkgver}/sample"

	# Compile sample programs
	make
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" \
		THIRD_PARTY_NOTICES

	# Include headers
	install -Dm644 -t "$pkgdir/usr/include/${_pkgname}" include/*.h

	# Library
	install -D -t "$pkgdir/usr/lib" "lib/lib${_pkgname}.so.${pkgver}"
	# Library symlinks
	cp -r "lib/lib${_pkgname}.so" "$pkgdir/usr/lib/"

	# Sample binaries
	install -Dm755 -t "$pkgdir/usr/lib/${_pkgname}" \
		bin/{basic,compile,derivative,record,simulate,testspeed,testxml}

	# Documentation
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}/sample" sample/*
	cp -r model "$pkgdir/usr/share/doc/${_pkgname}/model"
}
