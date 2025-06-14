# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-google-generativeai
pkgver=0.8.5
pkgrel=4
pkgdesc="Google AI Python SDK for the Gemini API"
arch=('any')
url="https://github.com/google-gemini/generative-ai-python"
license=('Apache-2.0')
makedepends=('python-setuptools')
checkdepends=('ipython' 'libwebp' 'python-absl' 'python-pandas' 'python-pillow')
optdepends=(
	'ipython: for image conversion'
	'libwebp: for webp images'
	'python-pandas: for the notebook feature'
	'python-pillow: for image conversion (as an alternative to ipython)'
)
source=(
	"generative-ai-${pkgver}.tar.gz::https://github.com/google-gemini/generative-ai-python/archive/refs/tags/v${pkgver}.tar.gz"
	'tests-accept-additional-props.patch'
)
sha256sums=(
	'2baa9b7cda3df8d9ca609b0eeac404e697bf0d046294becc5d90aa5b30c4c272'
	'e8e42daf626582db7f1c3e040b7ef10bd7516ddc17d61f854a128587ff885865'
)

# Dependencies listed in https://github.com/google-gemini/generative-ai-python/blob/main/setup.py#L44-L53
depends=(
	'python-google-ai-generativelanguage>=0.6.18'
	'python-google-api-core'
	'python-google-api-python-client'
	'python-google-auth>=2.15.0'
	'python-protobuf'
	'python-pydantic'
	'python-tqdm'
	'python-typing_extensions'
	'python-grpcio'  # optional feature of python-google-api-core but mandatory for us
)

prepare() {
	cd "deprecated-generative-ai-python-${pkgver}"
	patch -p1 < ../tests-accept-additional-props.patch
}

build() {
	cd "deprecated-generative-ai-python-${pkgver}"
	python setup.py build
}

check() {
	cd "deprecated-generative-ai-python-${pkgver}"
	python -m unittest discover -v
}

package() {
	cd "deprecated-generative-ai-python-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
