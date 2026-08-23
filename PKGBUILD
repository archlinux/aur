# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='extract-msg'
_repo='msg-extractor'
pkgname="python-${_pkgname}"
pkgver=0.56.0
pkgrel=1
pkgdesc="Extracts emails and attachments saved in Microsoft Outlook's .msg files"
arch=('any')
url="https://github.com/TeamMsgExtractor/${_repo}"
license=('GPL-3.0-or-later')
depends=(
	'python>=3.8'
	'python-beautifulsoup4>=4.11.1'
	'python-beautifulsoup4<5'
	'python-compressed-rtf>=1.0.6'
	'python-compressed-rtf<2'
	'python-ebcdic>=1.1.1'
	'python-ebcdic<3'
	'python-olefile=0.47'
	'python-red-black-tree-mod>=1.20'
	'python-red-black-tree-mod<=1.23'
	'python-rtfde>=0.1.1'
	'python-rtfde<0.2'
	'python-tzlocal>=1:4.2'
	'python-tzlocal<1:6'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-chardet>=3.0.0'
	'python-chardet<7'
	'python-magic>=1:0.4.27'
	'python-magic<1:0.5'
	'python-pillow>=9.5.0'
	'python-pillow<13'
)
optdepends=(
	'python-chardet<7: Guess encodings for MSG files without a usable codepage'
	'python-magic<1:0.5: Detect MIME types'
	'python-pillow<13: Parse and convert Outlook image attachments'
	'wkhtmltopdf: Export message bodies as PDF'
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'fix-build-and-dependency-bounds.patch'
	'test-optional-dependencies.py'
)
b2sums=(
	'190648020f31fde96b6290216fc53d7060dd9e7d79c3c9a57135435032546fe523e7d896b831e4c5bfe1e534ce48cd990cc30e62fd39ff8d57b956b55c8107ad'
	'9968bd6eb9bbae66f61de8cf59fac3f716fe261b343d7c9549349fe70c3164b7bf9fbfa34c66fde0836b27112844c0f9b3274aba815e41a435ad1f26f921ad30'
	'd2f05ce3b61b49e875414e496825da34f162c149aa516124f46af8fa3e3fe29104752de66e82f53a535c9c29e1472f4d057677b20bd9391dd5acb0c439091130'
)

prepare() {
	cd -- "${_repo}-${pkgver}" || return 1

	# Upstream caps Pillow at <10 and chardet at <6, while Arch ships Pillow 12
	# and chardet 6. I tested the current Arch versions with upstream's test suite
	# and the affected runtime paths, so the patch widens these bounds to <13 and
	# <7. It also fixes upstream's setuptools config so the GitHub source builds.
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
