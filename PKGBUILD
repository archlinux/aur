# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=0.5.6
pkgrel=1
pkgdesc='Call all LLM APIs using the OpenAI format'
arch=(any)
url='https://pypi.org/project/litellm/'
license=(MIT)
depends=(
	'uvicorn'
	'python'
	'python-appdirs'
	'python-click'
	'python-dotenv'
	'python-fastapi'
	'python-importlib-metadata'
	'python-jinja'
	'python-openai'
	'python-tiktoken'
	'python-tokenizers'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
)
optdepends=(
	'ollama: serve local ollama models'
)

source=(
	"https://files.pythonhosted.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('33ff15df6d4c84ca6c703e3df088d9b91611b6653faf36386f3c3893e3d5fd80')

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


