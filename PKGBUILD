# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=open-webui
pkgname=${_pkgname}-no-venv
pkgver=0.6.41
pkgrel=4
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama, built without creating virtualenv"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
depends=(python
        python-accelerate
        python-aiocache
        python-aiofiles
        python-aiohttp
        python-alembic
        python-anyio
        python-authlib
        python-asgiref
        python-azure-core
        python-azure-identity
        python-azure-search-documents
        python-azure-storage-blob
        python-bcrypt
        python-beautifulsoup4
        python-black
        python-boto3
        python-botocore
        python-certifi
        python-chromadb
        python-colbert-ai
        python-cryptography
        python-pycrdt
        python-datasets
        python-dotenv
        python-ddgs
        python-elasticsearch
        python-fastapi
        python-faster-whisper
        python-firecrawl-py
        python-fpdf2
        python-ftfy
        python-google-cloud-storage
        python-grpcio
        python-huggingface-hub
        python-importlib-metadata
        python-pyjwt
        python-langchain
        python-langchain-classic
        python-langchain-community
        python-langchain-core
        python-langchain-text-splitters
        python-ldap3
        python-loguru
        python-markdown
        python-mcp
        python-numpy
        python-opensearch
        python-opentelemetry-api
        python-opentelemetry-exporter-otlp-proto-grpc
        python-opentelemetry-exporter-otlp-proto-http
        python-opentelemetry-instrumentation
        python-opentelemetry-instrumentation-httpx
        python-opentelemetry-instrumentation-logging
        python-opentelemetry-instrumentation-redis
        python-opentelemetry-instrumentation-requests
        python-opentelemetry-instrumentation-sqlalchemy
        python-opentelemetry-instrumentation-aiohttp-client
        python-opentelemetry-sdk
        python-opentelemetry-semantic-conventions
        python-oracledb
        python-peewee
        python-peewee-migrate
        python-playwright
        python-pgvector
        python-pinecone
        python-pydantic
        python-pydub
        python-pymilvus
        python-python-multipart
        python-pytz
        python-qdrant-client
        python-redis
        python-requests
        python-sentence-transformers
        python-socketio
        python-soundfile
        python-sqlalchemy
        python-sqlcipher3
        python-starlette
        python-starlette-compress
        python-starsessions
        python-tiktoken
        python-pytorch
        python-transformers
        python-typer
        python-typing_extensions
        uvicorn
        python-urllib3
        python-validators
        python-weaviate-client
        python-websocket-client
        python-websockets
        python-yaml
        python-yarl
        python-youtube-transcript-api
        tencentcloud-sdk-python
        )
makedepends=('git' 'npm' 'nvm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-hatch')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui-git' 'open-webui')
provides=('open-webui')
source=("git+https://github.com/open-webui/open-webui.git#tag=v$pkgver"
        "build-only-backend.patch"
        "fix-langchain-1.0.0-imports.patch"
        "open-webui.service"
        "open-webui.conf")

b2sums=('66cdc36d552a26aaaeb79d7c79aa632d6a5b72de7002cf547ad74c4887c989505ea6045b2d611995075395f9682297312e24fb995426591f80ca172b48388aa8'
        '36ee27927719cd6cf761a62cd89404129326595f9cde35555f5fe5e2a616bac55346eba2a2882dd883f0d6b1a77e6da64c22521f7a7a18ca0d0b2eeac4781814'
        '08b46ba47027773040b4bf4f6cf1b14298cb7a15fdc856f6277651ac6981418a46598684d793b7af9879b51294257b42b14c83ea19d31203befde43c0c79a173'
        'f5dd97d4809160f3cc183a8c86ad5ead33163ba009fde2bb92935f766b6688f86bedecff9f1c805393d7e77736dd481d3da1d22cef6941a22bb0ef3856aee484'
        '9e9935cec52386c2397d53a02adf0befd82d9f6e7b95997abe75c156f7d2c0e29e67c9fe550da7e42c54faf97800de7501226b4ee6305530c5ced286dfed86a3')
options=(!strip !debug)
install="$_pkgname.install"

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    # Frontend part
    _ensure_local_nvm
    nvm install lts/jod

    # Backend part
    cd "${_pkgname}"
    patch -i ../build-only-backend.patch
    patch -p1 -i ../fix-langchain-1.0.0-imports.patch
}

build() {
    _ensure_local_nvm
    cd "${_pkgname}"

    # Backend part
    python -m build --wheel --no-isolation

    # Frontend part
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install --force
    npm run format
    npm run i18n:parse
    npm run build
}

package() {
    # Install systemd service
    install -Dm644 "./$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

    # Install license
    install -Dm 644 "$srcdir/${_pkgname}"/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"

    # Install the default config file to /usr/share/$_pkgname/open-webui.conf
    install -d "$pkgdir/usr/share/$_pkgname"
    install -Dm644 "./$_pkgname.conf" "$pkgdir/usr/share/$_pkgname/$_pkgname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir/opt"  # /opt

    install -d "$pkgdir/opt/$_pkgname"
    install -d "$pkgdir/var/opt/$_pkgname"
    install -d "$pkgdir/var/opt/$_pkgname/data"

    # copy over files
    cp -R "$srcdir/${_pkgname}/build/." "$pkgdir/opt/$_pkgname"

    # Fix permissions
    echo "Setting permissions for $pkgdiropt/$_pkgname"
    chmod 755 "$pkgdir/opt/$_pkgname"
    find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/$_pkgname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdirvar/opt/$_pkgname"
    chmod 700 "$pkgdir/var/opt/$_pkgname"
    find "$pkgdir/var/opt/$_pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/var/opt/$_pkgname" -type f -exec chmod 664 {} \;

    cd "${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -r "$pkgdir/usr/lib/python3.13/site-packages/data"
}
