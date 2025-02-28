# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=open-webui
pkgname=${_pkgname}-no-venv
pkgver=0.5.18
pkgrel=2
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama, built without creating virtualenv"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('MIT')
depends=(python
        python-aiocache
        python-aiofiles
        python-aiohttp
        python-alembic
        python-authlib
        python-asgiref
        python-azure-core
        python-azure-identity
        python-azure-storage-blob
        python-beautifulsoup4
        python-black
        python-boto3
        python-botocore
        python-certifi
        python-chromadb
        python-colbert-ai
        python-datasets
        python-dotenv
        python-duckduckgo-search
        python-fastapi
        python-faster-whisper
        python-fpdf2
        python-ftfy
        python-google-cloud-storage
        python-huggingface-hub
        python-importlib-metadata
        python-pyjwt
        python-langchain
        python-langchain-community
        python-langchain-core
        python-ldap3
        python-loguru
        python-markdown
        python-numpy
        python-opensearch
        python-passlib
        python-peewee
        python-peewee-migrate
        python-playwright
        python-pgvector
        python-pydantic
        python-pydub
        python-pymilvus
        python-python-multipart
        python-qdrant-client
        python-redis
        python-requests
        python-sentence-transformers
        python-socketio
        python-soundfile
        python-sqlalchemy
        python-starlette
        python-tiktoken
        python-pytorch
        python-transformers
        python-typer
        python-typing_extensions
        uvicorn
        python-urllib3
        python-validators
        python-websocket-client
        python-websockets
        python-yarl
        python-youtube-transcript-api
        )
makedepends=('npm' 'nvm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'python-ctranslate2-bin' 'python-jaxlib-bin' 'python-tensorstore-bin' 'python-primp-bin')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui-git' 'open-webui')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "build-only-backend.patch"
        "open-webui.service"
        "open-webui.conf")
sha1sums=('8c6a327dd650a3d5bcb94ea01f132383ea7ed14a'
          '3dc37cbf6a962fe16c3f5f740b7100e9ae87fd8e'
          '8a1fad8ffad186f3265e173557eb160c06497435'
          'fc563a2f3e240d76672b09c4627d654248d70186')
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
    nvm install lts/iron

    # Backend part
    cd "${_pkgname}-${pkgver}"
    patch -i ../build-only-backend.patch
}

build() {
    _ensure_local_nvm
    cd "${_pkgname}-${pkgver}"

    # Backend part
    python -m build --wheel --no-isolation

    # Frontend part
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install
    npm run format
    npm run i18n:parse
    npm run build
}

package() {
    # Install systemd service
    install -Dm644 "./$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

    # Install license
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}"/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"

    # Install the default config file to /usr/share/$_pkgname/open-webui.conf
    install -d "$pkgdir/usr/share/$_pkgname"
    install -Dm644 "./$_pkgname.conf" "$pkgdir/usr/share/$_pkgname/$_pkgname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir/opt"  # /opt

    install -d "$pkgdir/opt/$_pkgname"
    install -d "$pkgdir/var/opt/$_pkgname"
    install -d "$pkgdir/var/opt/$_pkgname/data"

    # copy over files
    cp -R "$srcdir/${_pkgname}-${pkgver}/build/." "$pkgdir/opt/$_pkgname"

    # Fix permissions
    echo "Setting permissions for $pkgdiropt/$_pkgname"
    chmod 755 "$pkgdir/opt/$_pkgname"
    find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/$_pkgname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdirvar/opt/$_pkgname"
    chmod 700 "$pkgdir/var/opt/$_pkgname"
    find "$pkgdir/var/opt/$_pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/var/opt/$_pkgname" -type f -exec chmod 664 {} \;

    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -r "$pkgdir/usr/lib/python3.13/site-packages/data"
}
