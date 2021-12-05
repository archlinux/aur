# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=calibre-plugin-dedrm
pkgver=10.0.2
pkgrel=1
pkgdesc="DeDRM tools for ebooks - Calibre plugin"
arch=(x86_64)
url=https://github.com/apprenticeharper/DeDRM_tools/
license=(GPL3)
depends=('calibre>=5.15')
makedepends=(unzip zip)
optdepends=(
	'openssl: for crytographic primitives'
	'python-pycryptodome: for crytographic primitives'
)
source=(
	DeDRM_tools-$pkgver.tar.gz::https://github.com/noDRM/DeDRM_tools/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('227220a88b0c87d0c8dc511bd91be59d3bffd74ef82bacf75bdcf9d5c2f56094')

_calibre_system_plugin_dir='/usr/share/calibre/system-plugins'
_libalfcryptodir="libalfcrypto-${pkgver}"

prepare() {
	cd "${srcdir}/DeDRM_tools-${pkgver}/DeDRM_plugin"

	find -name '*.dll' -delete
	find -name '*.so' -delete
	find -name '*.dylib' -delete
	find -name .DS_Store -delete
}

build() {
	cd "${srcdir}/DeDRM_tools-${pkgver}/DeDRM_plugin"

	mkdir -p "${srcdir}/${_libalfcryptodir}"

	unzip -oj alfcrypto_src.zip -d "${srcdir}/${_libalfcryptodir}"
	cd "${srcdir}/${_libalfcryptodir}"

	rm -f libalfcrypto.so
	bash ./makelinux.sh
}

package() {
	cd "${srcdir}/DeDRM_tools-${pkgver}/DeDRM_plugin"

	cp "${srcdir}/${_libalfcryptodir}/libalfcrypto.so" libalfcrypto64.so

	mkdir -p "${pkgdir}/${_calibre_system_plugin_dir}/"
	zip -r "${pkgdir}/${_calibre_system_plugin_dir}/DeDRM.zip" .

	install -m644 -D -t "${pkgdir}/usr/share/doc/${pkgname}/" ../README.md ../ReadMe_Overview.txt ../DeDRM_plugin_ReadMe.txt
}
