# Maintainer: Margret Riegert <margret at eowyn net>
# Contributor: Deepjyoti <deep.barman30@gmail.com>
_pkgname="ytmdl"
pkgname="$_pkgname-git"
pkgver=2023.02.28.r0.ga9251c8
pkgrel=1
pkgdesc="Download songs from YouTube with metadata from sources like iTunes and Gaana"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')

depends=(
  'python-beautifulsoup4'
  'python-musicbrainzngs'
  'python-mutagen'
  'python-pyxdg'
  'python-rich'
  'python-unidecode'
  'python-urllib3'
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
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel --skip-dependency-check

  python "utils/completion.py"
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm664 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 "ytmdl.zsh" "$pkgdir/usr/share/zsh/site-functions/_ytmdl"
  install -Dm644 "ytmdl.bash" "$pkgdir/usr/share/bash-completion/completions/ytmdl"
}
