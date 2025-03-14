# Maintainer: sudacode <suda@sudacode.com>
pkgname=python-manga-ocr
_pkgname=manga_ocr
pkgver=0.1.14
pkgrel=1
pkgdesc="A tool for extracting text from manga images using OCR"
arch=('x86_64')
url="https://github.com/kha-white/manga-ocr"
license=('Apache-2.0')
makedepends=('python-pip' 'python-installer' 'python-wheel')
depends=(
	'python>=3.6'
	'python-fire'
	'python-fugashi'
	'python-jaconv'
	'python-loguru'
	'python-numpy'
	'python-pillow>=10.0.0'
	'python-pyperclip'
	'python-pytorch>=1.0'
	'python-transformers>=4.25.0'
	'python-unidic-lite'
)
optdepends=(
	'python-pytorch: GPU acceleration'
	'wl-clipboard: Read images from the clipboard in the command-line mode on Wayland'
	'xclip: Read images from the clipbaord in the command-line mode on X11'
)
checkdepends=('python-pytest')

conflicts=('manga-ocr-git')

source=(
	"https://github.com/kha-white/manga_ocr/archive/refs/tags/v${pkgver}.tar.gz"
	"skip-example-run-on-boot.patch"
)
sha256sums=('f7d73bbf482cbefb6f91ff3c628a3131d6c7dc863612539fe5d03a4b7d640643'
	'e0458743eebd9baac05d31031511477c81f20157821becf3d8da1d487df7d9c1')

prepare() {
	cd "${_pkgname//_/-}-$pkgver"
	patch --forward --strip=0 --input=../skip-example-run-on-boot.patch
}

build() {
	cd "${_pkgname//_/-}-$pkgver"
	python -m pip wheel . --no-deps --wheel-dir dist
}

check() {
	cd "${_pkgname//_/-}-$pkgver"
	pytest
}

package() {
	cd "${_pkgname//_/-}-$pkgver"
	python -m pip install --no-deps --root="$pkgdir" --prefix=/usr --ignore-installed .
}
