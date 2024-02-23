# Maintainer: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.26.8
pkgrel=1
pkgdesc='Call all LLM APIs using the OpenAI format'
arch=(any)
url='https://pypi.org/project/litellm/'
license=(MIT)
depends=(
    'python'
    'python-openai'
    'python-dotenv'
    'python-tiktoken'
    'python-importlib-metadata'
    'python-tokenizers'
    'python-click'
    'python-jinja'
    'python-aiohttp'
    'python-requests'
    'python-setuptools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
optdepends=(
    'uvicorn: ASGI server for asyncio'
    'gunicorn: WSGI HTTP Server'
    'python-fastapi: Framework for building APIs'
    'python-backoff: Backoff strategies for retrying operations'
    'python-yaml: YAML parser and emitter'
    'python-rq: Simple job queues for Python'
    'python-orjson: Fast JSON parser and serializer'
    'python-apscheduler: Task scheduler'
    'python-streamlit: App framework for Machine Learning and Data Science'
    'ollama: Serve local ollama models'
)

source=(
	"https://files.pythonhosted.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('4b19605d22ea52966e703b66dda0d37a21f51b74bf7a7e5dce571322c7f852ac')

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


