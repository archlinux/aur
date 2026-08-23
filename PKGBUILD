# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='semchunk'
# Upstream published 4.1.1 to PyPI without creating a matching Git tag;
# this commit is the exact source state used for the 4.1.1 release.
#
# See https://github.com/isaacus-dev/semchunk/issues/26
#
_commit='dccb2f7fc2248e6266d6cbb1c0d986a3f192c3fe'
pkgname="python-${_pkgname}"
pkgver=4.1.1
pkgrel=1
pkgdesc='Python library for splitting text into semantically meaningful chunks'
arch=('any')
url="https://github.com/isaacus-dev/${_pkgname}"
license=('MIT')
depends=(
	'python>=3.10'
	'python-tqdm'
)
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'python-tiktoken: OpenAI tokenizer support'
	'python-transformers: Hugging Face tokenizer support'
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz"
	'package_test.py'
)
b2sums=(
	'90bdbd876595e409256ae009d4fdba4f2abb27d39d01098e19873479ab358ac4c8f0bd886ce891330d925d301f7f27ae88c7929719de11a435599953ba546d1c'
	'cebd3c18c27ed7c569e3aea5d7bfe9fcf0ee7c41e853875cfa34cb5385d00f897cd5e0198ed6c7e705be12453a2dc5662bc15e4fb6b5e1c24580881db5ef0619'
)

_srcdir="${_pkgname}-${_commit}"

prepare() {
	cd -- "${_srcdir}" || return 1
	grep -Fqx -- "version = \"${pkgver}\"" pyproject.toml
}

build() {
	cd -- "${_srcdir}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_srcdir}" || return 1
	PYTHONPATH=src python "${srcdir}/package_test.py"
}

package() {
	cd -- "${_srcdir}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode=2 dist/*.whl
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
