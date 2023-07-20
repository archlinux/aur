# Maintainer:

_pkgname="spleeter"
pkgname="$_pkgname-git"
pkgver=2.4.0.r36.g13c771b
pkgrel=1
pkgdesc="Deezer music source separation library and tool using pretrained models"
# https://research.deezer.com/projects/spleeter.html
url="https://github.com/deezer/spleeter"
arch=('any')
license=('MIT')

depends=(
  'python-h2' # (optdep python-httpx)
  'python-httpx'
  'python-numpy'
  'python-pandas'
  'python-tensorflow'
  'python-typer'
  'python-pyxdg'

  # AUR
  'python-ffmpeg-python'
  'python-norbert'
  'python-musdb'
      # python-soundfile
      # python-stempeg
  'python-museval'
      # python-musdb
      # python-soundfile
      # python-stempeg
          # python-soundfile
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
#checkdepends=(
#  'python-py'
#  'python-pytest'
#  'python-pytest-forked'
#)
optdepends=(
  'spleeter-data: pretrained model'
)

provides=(
  "$_pkgname"
)
conflicts=(${provides[@]})

options=("!strip")

source=(
  "$_pkgname"::"git+$url"
  'github-pr-808-rebased-2.3.0.patch'
  'xdg_config_home.patch'
)
sha256sums=(
  'SKIP'
  '50472de0822614939fe0fabd36439cc38f5ff35828c06121884f5e125e1845b6'
  '24a40f5fd3cbf87e2e78236159fefe60be6a02e895c50d8f7e17546f27e322e0'
)

prepare() {
  cd "$srcdir/$_pkgname"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

pkgver() {
  cd "$srcdir/$_pkgname"

  _regex='^version = "([0-9]+\.[0-9]+(\.[0-9]+)?)"$'
  _file="pyproject.toml"

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    printf '%s' "$_line" | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -S "$_line" -1 --pretty=oneline --no-color -- "$_file" \
      | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$srcdir/$_pkgname"
#  rm -rf pretrained_models
#  python -m pytest
#}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install LICENSE
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # remove incorrectly installed LICENSE file
  _pyver=$(python --version | sed -E 's@^Python\ ([0-9]+\\.[0-9]+)(\\.[0-9]+)?$@\1@')
  rm -f "$pkgdir/usr/lib/python$_pyver/site-packages/LICENSE"
} 
