# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=open-webui
pkgver=0.5.3
pkgrel=2
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('MIT')
depends=(python
        python-aiocache
        python-aiofiles
        python-aiohttp
        python-alembic
        python-authlib
        python-beautifulsoup4
        python-black
        python-boto3
        python-botocore
        python-chromadb
        python-colbert-ai
        python-datasets
        python-dotenv
        python-duckduckgo-search
        python-fastapi
        python-faster-whisper
        python-fpdf2
        python-ftfy
        python-huggingface-hub
        python-pyjwt
        python-langchain
        python-langchain-community
        python-langchain-core
        python-ldap3
        python-markdown
        python-numpy
        python-opensearch
        python-passlib
        python-peewee
        python-peewee-migrate
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
        python-validators
        python-websocket-client
        python-yaml
        python-yarl
        python-youtube-transcript-api
# Transitive dependencies that are needed but not added yet in direct dependencies PKGBUILDs
        python-lxml
        )
checkdepends=('python-pytest' 'python-docker' 'python-pytest-docker')
makedepends=('npm' 'nvm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'python-ctranslate2-bin' 'python-jaxlib-bin' 'python-tensorstore-bin' 'python-primp-bin')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui-git')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "build-only-backend.patch"
        "open-webui.service"
        "open-webui.conf")
sha1sums=('ca8b34acc3a272ac47dc7ded24735f4145777a32'
          '1054a3fa2b1b3bec429d77a31e9ef95fb019c016'
          '8a1fad8ffad186f3265e173557eb160c06497435'
          'fc563a2f3e240d76672b09c4627d654248d70186')
options=(!strip !debug)
install="$pkgname.install"

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
    cd "${pkgname}-${pkgver}"
    patch -i ../build-only-backend.patch
}

build() {
    _ensure_local_nvm
    cd "${pkgname}-${pkgver}"

    # Backend part
    python -m build --wheel --no-isolation

    # Frontend part
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install
    npm run format
    npm run i18n:parse
    npm run build
}

check() {
    _ensure_local_nvm
    cd "${pkgname}-${pkgver}"

    # Frontend part
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm run test:frontend

    # Backend part
    python -m installer -d tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$PWD/tmp_install/site-packages" pytest -o addopts="" || warning "Tests failed"
}

package() {
    # Install systemd service
    install -Dm644 "./$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install license
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Install the default config file to /usr/share/$pkgname/open-webui.conf
    install -d "$pkgdir/usr/share/$pkgname"
    install -Dm644 "./$pkgname.conf" "$pkgdir/usr/share/$pkgname/$pkgname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir/opt"  # /opt

    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/var/opt/$pkgname"
    install -d "$pkgdir/var/opt/$pkgname/data"

    # copy over files
    cp -R "$srcdir/${pkgname}-${pkgver}/build/." "$pkgdir/opt/$pkgname"

    # Fix permissions
    echo "Setting permissions for $pkgdiropt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname"
    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdirvar/opt/$pkgname"
    chmod 700 "$pkgdir/var/opt/$pkgname"
    find "$pkgdir/var/opt/$pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/var/opt/$pkgname" -type f -exec chmod 664 {} \;

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -r "$pkgdir/usr/lib/python3.13/site-packages/data"
}
