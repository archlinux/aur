# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=calibre-plugin-dedrm
pkgver=10.0.3
pkgrel=1
pkgdesc="DeDRM tools for ebooks - Calibre plugin"
arch=(x86_64)
url=https://github.com/noDRM/DeDRM_tools/
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
sha256sums=('19af048a4caef3e3e7539a496ee2d4906fe500d238c5db66b5aff5df3fdbde73')

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
set -x
	cd "${srcdir}/DeDRM_tools-${pkgver}/DeDRM_plugin"

	cp "${srcdir}/${_libalfcryptodir}/libalfcrypto.so" libalfcrypto64.so

	cd "${srcdir}/DeDRM_tools-${pkgver}"
	./make_release.py ${pkgver}
	unzip DeDRM_tools_${pkgver}.zip DeDRM_plugin.zip

	install -m644 -D -t "${pkgdir}/${_calibre_system_plugin_dir}" DeDRM_plugin.zip
	install -m644 -D -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md ReadMe_Overview.txt DeDRM_plugin_ReadMe.txt
}
