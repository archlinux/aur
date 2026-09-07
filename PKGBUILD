# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='extract-msg'
_repo='msg-extractor'
pkgname="python-${_pkgname}"
pkgver=0.56.1
pkgrel=1
pkgdesc="Extracts emails and attachments saved in Microsoft Outlook's .msg files"
arch=('any')
url="https://github.com/TeamMsgExtractor/${_repo}"
license=('GPL-3.0-or-later')
depends=(
	'python>=3.8'
	'python-beautifulsoup4>=4.11.1'
	'python-compressed-rtf>=1.0.6'
	'python-ebcdic>=1.1.1'
	'python-olefile=0.47'
	'python-red-black-tree-mod>=1.20'
	'python-rtfde>=0.1.1'
	'python-tzlocal>=1:4.2'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-chardet>=3.0.0'
	'python-magic>=1:0.4.27'
	'python-pillow>=9.5.0'
)
optdepends=(
	'python-chardet>=3.0.0: Guess encodings for MSG files without a usable codepage'
	'python-magic>=1:0.4.27: Detect MIME types'
	'python-pillow>=9.5.0: Parse and convert Outlook image attachments'
	'wkhtmltopdf: Export message bodies as PDF'
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'fix-build-and-dependency-bounds.patch'
	'test-optional-dependencies.py'
)
b2sums=(
	'1ba0e83323e1c2b4d352ff704fdfdfc976cda02a7c729c1bc0404a2243290a25d3abe720580fd88bfb3f8b26238a0ac80c1e664b7b4d681aacaf6a38f406b9f1'
	'b3952d757efcbadf03b87db8a19d7a085ad31a6d6b5f1ecf31e430b3ffb431d0412af07bcf819d9d0091aa61de49c2df8bf5589d3139009e328751d222763ee7'
	'd2f05ce3b61b49e875414e496825da34f162c149aa516124f46af8fa3e3fe29104752de66e82f53a535c9c29e1472f4d057677b20bd9391dd5acb0c439091130'
)

prepare() {
	cd -- "${_repo}-${pkgver}" || return 1

	# Keep upstream's meaningful minimum versions, but do not encode routine
	# tested-range ceilings as hard Arch dependency bounds. Upstream's explicit
	# olefile==0.47 pin remains intact. The patch also fixes setuptools config so
	# the GitHub source builds correctly.
	patch --fuzz=0 -Np1 -i "${srcdir}/fix-build-and-dependency-bounds.patch"
}

build() {
	cd -- "${_repo}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_repo}-${pkgver}" || return 1
	python tests.py
	PYTHONPATH="${PWD}${PYTHONPATH:+:${PYTHONPATH}}" python "${srcdir}/test-optional-dependencies.py"
}

package() {
	cd -- "${_repo}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 -- LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
