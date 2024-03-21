# Maintainer:
# Contributor: Anakojm <https://anakojm.net/a-propos/#contact>

_pkgname="mov-cli"
pkgname="$_pkgname-git"
pkgver=4.1.0.r0.gadf61ce
pkgrel=1
pkgdesc="CLI tool to browse and stream videos"
url="https://github.com/mov-cli/mov-cli"
license=('MIT')
arch=('any')

depends=(
  'fzf'
  'python'
  'python-beautifulsoup4'
  'python-httpx'
  'python-lxml'
  'python-pycryptodome'
  'python-toml'
  'python-typer'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-setuptools-scm'
  'python-wheel'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  python -m build --wheel --no-isolation "$_pkgsrc"
}

package() {
  depends=(
    'ffmpeg'
    'mpv'

    #AUR
    'python-devgoldyutils'
    'python-inquirer'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" "$(ls -1 -- dist/*.whl | sort -rV | head -1)"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

}
