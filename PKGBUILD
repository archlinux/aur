# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname="litellm"
pkgver=1.40.0
pkgrel=1
pkgdesc="Call all LLM APIs using the OpenAI format"
arch=(any)
url="https://pypi.org/project/litellm/"
license=("MIT")
depends=(
 "gunicorn"
 "uvicorn"
 "python"
 "python-aiohttp"
 "python-argon2_cffi"
 "python-backoff"
 "python-click"
 "python-dotenv"
 "python-fastapi"
 "python-importlib-metadata"
 "python-jinja"
 "python-openai"
 "python-orjson"
 "python-pyjwt"
 "python-python-multipart"
 "python-requests"
 "python-setuptools"
 "python-tiktoken"
 "python-tokenizers"
)
makedepends=(
 "python-build"
 "python-installer"
 "python-poetry-core"
 "python-wheel"
)
optdepends=(
 "uvicorn: ASGI server for asyncio"
 "gunicorn: WSGI HTTP Server"
 "python-fastapi: Framework for building APIs"
 "python-backoff: Backoff strategies for retrying operations"
 "python-yaml: YAML parser and emitter"
 "python-rq: Simple job queues for Python"
 "python-orjson: Fast JSON parser and serializer"
 "python-apscheduler: Task scheduler"
 "python-streamlit: App framework for Machine Learning and Data Science"
 "ollama: Serve local ollama models"
)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('07c90aae6827da3a7c31504cd06de47c1bf83f3295c4e52225ef8ca40b1e06ddf11bb3fd6200373a9c0c2c4c69857ede36b6d8a14a715dd0e94b56075876778f')
options=("!strip")

prepare(){
 cd "$pkgname-$pkgver"
 # fix relative import
 sed -i "litellm/proxy/proxy_cli.py" \
     -e "s|from proxy_server import|from .proxy_server import|g"
}

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
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
