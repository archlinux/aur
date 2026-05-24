# Maintainer: SoftExpert <softexpert at gmail dot com>

_basename=word-sys-pdf-editor
pkgname=${_basename}-bin
pkgver=1.9.2
pkgrel=1
pkgdesc='A simple and user-friendly PDF Editor'
arch=(x86_64)
url='https://github.com/word-sys/word-sys-pdf-editor'
license=("GPL-3.0-or-later")
depends=(
	# As reported by namcap
	'glib2'
	'gtk4'
	'gdk-pixbuf2'
	'hicolor-icon-theme' 
	'libadwaita'
	'pango'
	'python'
	'python-cairo' 
	'python-gobject' 
	'python-pymupdf' 
	'python-numpy'
)
optdepends=('libreoffice-fresh: export document to format .docx')
provides=('word-sys-pdf-editor')
conflicts=(
	'pardf'
	'fospx-pdf-editor'
)
replaces=(
	'pardf' 
	'fospx-pdf-editor'
	'word-sys-pdf-editor'
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${_basename}_${pkgver}.deb::https://github.com/word-sys/word-sys-pdf-editor/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb"
	"${_basename}_${pkgver}.LICENSE::https://raw.githubusercontent.com/word-sys/word-sys-pdf-editor/refs/heads/main/LICENSE"
	"rectify_cmdline.patch"
)
b2sums_x86_64=('729de0a268446f8774e608410593bf9b1907a8c7d0fc4669ae88d67fefa0c67f7ea60b4aa23c41405331a3fd588a0704c25125a2dcadad20b4e8956dc708d1c2'
               '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
               '6a5ea316641a5f0569ab9002dd6b2acf242599f7ae9ddd696cf37eb4918011559f2bed36138940d59705b2d15b21c6b00876e9c05434c7ce64c7c91336a105a6')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}/"
}

build() {
	cd "usr/bin"
	# deb package packs a command line that uses a virtual Python environment specific to developer's environment
	# we fix that by using the system Python
	patch -p1 -i "${srcdir}/rectify_cmdline.patch"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"

	cp -a \
		"${srcdir}/opt/" \
		"${pkgdir}/opt/"
	
	install -Dm644 \
		"${srcdir}/${_basename}_${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
