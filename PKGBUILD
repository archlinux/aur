# Maintainer: Deepjyoti <deep.barman30@gmail.com>

: ${_commit=d8f288c6a0e9258d073100283c65a2e03a761777}

_pkgname="ytmdl"
pkgname="$_pkgname"
pkgver=2024.08.15.1
pkgrel=1
pkgdesc="Download songs from YouTube with metadata from iTunes, Spotify, LastFM, etc"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=("SKIP")

prepare() {
  sed -E -e '/ytmdl\.(bash|zsh)/d' -i "$_pkgsrc/setup.py"
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check

  python "utils/completion.py"
}

package() {
  depends+=(
    'python-beautifulsoup4'
    'python-musicbrainzngs'
    'python-mutagen'
    'python-pyxdg'
    'python-rich'
    'python-unidecode'
    'python-ytmusicapi'
    'yt-dlp'

    # AUR
    'downloader-cli'
    'python-ffmpeg-python'
    'python-itunespy'
    'python-pydes'
    'python-simber'
    'python-spotipy'
    'youtube-search-python'

    ## implicit
    #'python-urllib3'
    #'python-colorama'
    #'python-requests'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm664 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 "ytmdl.zsh" "$pkgdir/usr/share/zsh/site-functions/_ytmdl"
  install -Dm644 "ytmdl.bash" "$pkgdir/usr/share/bash-completion/completions/ytmdl"
}
