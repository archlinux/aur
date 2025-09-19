# Maintainer:
# Contributor: Lari Tikkanen <lartza@outlook.com>

_pkgname="youtube-dl"
pkgname="$_pkgname-git"
pkgver=2021.12.17.r440.ga084c80
pkgrel=2
pkgdesc="A command-line program to download videos from YouTube.com and a few more sites"
url="https://github.com/ytdl-org/youtube-dl"
license=('Unlicense')
arch=('any')

depends=('python')
makedepends=(
  'git'
  'pandoc'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'atomicparsley: for embedding thumbnails into m4a files'
  'ffmpeg: for video post-processing'
  'phantomjs: for some less common extractors to work'
  'python-pycryptodome: for hlsnative downloader'
  'rtmpdump: for rtmp streams support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make pypi-files zsh-completion
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 $_pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  cd "$pkgdir/usr/share/bash-completion/completions/"
  mv $_pkgname.bash-completion $_pkgname
}
