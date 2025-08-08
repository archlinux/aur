# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=webscout
pkgname=python-${_name}
pkgver=8.3.5
pkgrel=2
pkgdesc="Your All-in-One Python Toolkit for Web Search, AI Interaction, Digital Utilities, and More"
arch=(any)
url="https://github.com/OEvortex/Webscout"
license=('Webscout License')
depends=('python'
    'python-nodriver'
    'python-mistune'
    'python-curl-cffi'
    'python-nest-asyncio'
    'python-colorama'
    'python-rich'
    'python-markdownify'
    'python-requests'
    'python-google-generativeai'
    'python-lxml'
    'python-orjson'
    'python-pyyaml'
    'python-pillow'
    'python-bson'
    'python-cloudscraper'
    'python-html5lib'
    'python-aiofiles'
    'python-openai'
    'python-gradio-client'
    'python-psutil'
    'python-aiohttp'
    'python-zstandard'
    'python-brotli'
    'python-litproxy'
  )
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=(
  "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/9d/c3/78f3b8e0bdc4d233b3567156f5a8feaa997a4120aa7059b92f31a18dfd75/webscout-8.3.5.tar.gz"
  # Patch to fix trio dependency issue from https://github.com/OEvortex/Webscout/pull/82
  "trio.patch"
)
sha256sums=(
  69547972737409ab75fadfd47092f9570fb2f401cb90249f0cecb1cb27c3dc86
  d507186f805711286645a20f455378b255d7a02418cd6bce9b0710956d64fd33
)

build() {
  cd "${_name}-${pkgver}"
  for file in webscout/Bard.py webscout/DWEBS.py webscout/Provider/cerebras.py webscout/Provider/copilot.py webscout/webscout_search.py webscout/webscout_search_async.py webscout/yep_search.py; do
    dos2unix "$file"
  done
  patch -lp1 < ../trio.patch
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
