# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgbase=python-spotifyscraper
pkgname=(
  'python-spotifyscraper'
  'python-spotifyscraper-docs'
)
_pkgname=spotifyscraper
pkgver=v3.8.0
pkgrel=1
pkgdesc="Extract public Spotify data — tracks, albums, artists, playlists, podcasts & lyrics — without the official API. Sync + async, typed models, one dependency."
arch=('any')
url="https://spotifyscraper.readthedocs.io"
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'mkdocs'
  'mkdocstrings'
  'mkdocs-material'
  'mkdocstrings-python'
)
checkdepends=(
  'python-pytest'
  'python-respx'
  'python-pytest-asyncio'
  'python-mutagen'
  'python-playwright'
  'python-typer'
  'python-pytest-timeout'
)

source=("git+https://github.com/AliAkhtari78/${_pkgname}#tag=${pkgver}")
license=('MIT')
sha256sums=('fd16363ed13cdeecf308bbeaff94c183b25ccaee2317bf21bfcc5d8883714b4c')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
  #Note: mkdocs looks for modules in predefined paths, this a work-around for modules not installed yet (i.e. not in sys.path, also PYTHONPATH is last, and local for our use).
  PYTHONPATH="$PWD/src" mkdocs build --quiet --strict --site-dir ./html
}

check(){
  cd "$_pkgname"
  pytest
}

package_python-spotifyscraper() {
  cd "$_pkgname"
  depends=(
    'python>=3.10'
    'python-httpx>=0.27'
  )
  optdepends=(
  'python-mutagen: for spotifyscraper media'
  'python-playwright: for spotifyscraper browser'
  'python-typer: for spotifyscraper cli'
  'python-keyring: for spotifyscraper keyring'
  'python-mcp: for spotifyscraper mcp'
  'uvicorn: for spotifyscraper mcp'
)

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
package_python-spotifyscraper-docs(){
  cd "$_pkgname"
  pkgdesc+=' (documentation)'

  install -d "$pkgdir/usr/share/doc/${pkgname}" 
  cp -r ./html/* "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
