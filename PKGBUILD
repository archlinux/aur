# Maintainer:
# Contributor: Don Harper < duck at duckland dot org>

_pkgname="sigal"
pkgname="$_pkgname-git"
pkgver=2.4.r18.g9eead93
pkgrel=1
pkgdesc="Simple Static Gallery Generator"
url="https://github.com/saimn/sigal"
license=('MIT')
arch=("any")

depends=(
  'python'
  'python-blinker'
  'python-click'
  'python-jinja'
  'python-markdown'
  'python-markupsafe'
  'python-natsort'
  'python-pilkit'
  'python-pillow'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-sphinx'
  'python-wheel'
)
optdepends=(
  'python-boto: upload to S3 plugin'
  'python-brotli: compress assets plugin'
  'python-cryptography: encrypt plugin'
  'python-feedgenerator: feed plugin'
  'python-zopfli: compress assets plugin'
)

provides=("$_pkgname=${pkgver%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel

  # man page
  PYTHONPATH="$PWD/src" make -C docs man
}

package() {
  depends+=('ffmpeg')

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # man page
  install -Dm644 "docs/_build/man/sigal.1" -t "$pkgdir/usr/share/man/man1/"

  # license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
