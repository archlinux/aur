# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Maintainer: BlackFuffey <fluffistical@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_pkgname=open-webui
pkgname=${_pkgname}-no-venv
pkgver=0.10.2
pkgrel=1
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama, built without creating virtualenv"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
backup=("etc/conf.d/$_pkgname")

# TODO: Likely some of these should be in optdepends or maybe even makedepends.
#       I'm putting everything I find in requirements.txt here just to be safe
#       As I cannot build and test it myself.
#                       --- BlackFuffey
#
# TODO: Probably organize this so that it matches the ordering in
#       requirements.txt?
#                       --- BlackFuffey
depends=(
  nltk-data
  python
  python-aiocache
  python-aiofiles
  python-aiohttp
  python-aiosqlite
  python-alembic
  python-apscheduler
  python-argon2-cffi
  python-asgiref
  python-authlib
  python-azure-core
  python-azure-identity
  python-azure-storage-blob
  python-async-timeout
  python-anthropic
  python-accelerate
  python-av
  python-fastapi
  python-bcrypt
  python-beautifulsoup4
  python-black
  python-brotlicffi
  python-boto3
  python-brotli
  python-chromadb
  python-cryptography
  python-chardet
  python-colbert-ai
  python-ddgs
  python-dotenv
  python-docx2txt
  python-einops
  python-elasticsearch
  python-fake-useragent
  python-faster-whisper
  python-fpdf2
  python-ftfy
  python-google-cloud-storage
  python-google-genai
  python-httpx
  python-itsdangerous
  python-jose
  python-langchain
  python-langchain-classic
  python-langchain-community
  python-langchain-text-splitters
  python-ldap3
  python-loguru
  python-markdown
  python-mcp
  python-mimeparse
  python-multipart
  python-nltk
  python-numpy
  python-onnxruntime
  python-openpyxl
  python-opencv
  python-openai
  python-oracledb
  python-pandas
  python-pypandoc
  python-peewee
  python-psycopg
  python-psycopg2
  python-peewee-migrate
  python-pillow
  python-pinecone
  python-psutil
  python-pymongo
  python-pymilvus
  python-pydantic
  python-pydub
  python-pyarrow
  python-pycrdt
  python-pymdown-extensions
  python-pymysql
  python-pypdf
  python-pptx
  python-pytube
  python-pytz
  python-pyjwt
  python-rank-bm25
  python-rapidocr-onnxruntime
  python-redis
  python-requests
  python-restrictedpython
  python-sentence-transformers
  python-sentencepiece
  python-socketio
  python-soundfile
  python-sqlalchemy
  python-starlette
  python-starlette-compress
  python-starsessions
  python-tiktoken
  python-typer
  python-typing_extensions
  python-transformers
  python-unstructured
  python-validators
  python-xlrd
  python-youtube-transcript-api
  uvicorn
)
makedepends=(
  git
  nodejs
  npm
  python-build
  python-hatchling
  python-installer
  python-wheel
)

optdepends=(
  'ollama: local LLM runtime'
  'python-azure-ai-documentintelligence: Azure Document Intelligence loader support'
  'python-azure-identity: Azure authentication and storage integrations'
  'python-azure-storage-blob: Azure blob storage support'
  'python-firecrawl-py: Firecrawl-backed web retrieval'
  'python-google-api-python-client: Google service integrations'
  'python-google-auth-httplib2: Google service integrations'
  'python-google-auth-oauthlib: Google service integrations'
  'python-googleapis-common-protos: Google service integrations'
  'python-msoffcrypto-tool: encrypted Office document ingestion'
  'python-opensearch-py: OpenSearch vector backend support'
  'python-pgvector: pgvector backend support'
  'python-playwright: Playwright-backed web loader'
  'python-spacy: Playwright web loader support'
  'python-en_core_web_sm: Playwright web loader suupport'
  'python-pyxlsb: XLSB document ingestion'
  'python-qdrant-client: Qdrant backend support'
  'python-weaviate-client: Weaviate backend support'
  'tika-server: document parsing'
)

conflicts=('open-webui' 'open-webui-git')
provides=('open-webui')

source=(
  "https://github.com/open-webui/open-webui/archive/refs/tags/v$pkgver.tar.gz"
  "open-webui.service"
  "open-webui.conf"
)

sha256sums=('385975c2da333fede8827e3cae04ae154b2fb4d850fdc44470c9f6d25636ebfd' 'SKIP' 'SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm644 "$srcdir/$_pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  install -Dm644 "$srcdir/$_pkgname.conf" \
    "$pkgdir/etc/conf.d/$_pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
