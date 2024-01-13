# Maintainer: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.17.4
pkgrel=1
pkgdesc='Call all LLM APIs using the OpenAI format'
arch=(any)
url='https://pypi.org/project/litellm/'
license=(MIT)
depends=(
	'gunicorn'
	'python'
	'python-appdirs'
	'python-backoff'
	'python-click'
	'python-dotenv'
	'python-fastapi'
	'python-importlib-metadata'
	'python-jinja'
	'python-openai'
	'python-tiktoken'
	'python-tomli-w'
	'python-tokenizers'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
	'python-wheel'
)
optdepends=(
	'ollama: serve local ollama models'
)

source=(
	"https://files.pythonhosted.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('911a6bfe768554ceb29c328778c4e88c8041a36bf8cb965dff0598d8122eeb74')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf dist
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	
	# wrapper script for server
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/usr/bin/env python3
import litellm
litellm.run_server()
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"
}


