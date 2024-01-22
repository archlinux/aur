# Maintainer: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.18.8
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
sha256sums=('d84cf6b5d7eb50c3f9db7d534c05e659d6be5d0cf17441fb700c14ecd9a370b8')

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


