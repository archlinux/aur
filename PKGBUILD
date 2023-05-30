# Maintainer:
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="python-tiktoken"
pkgname="$_pkgname-git"
pkgver=0.4.0.r0.g095924e
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/openai/tiktoken"
license=('MIT')

depends=(
  'python'
  'python-regex'
  'python-requests'

  # AUR
  'python-blobfile'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-rust'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

provides=(
  "$_pkgname"
)
conflicts=(
  ${provides[@]}
)

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"

  python -m build --wheel --no-isolation
}

# check() {
#   cd "$srcdir/$_pkgname"
#   python -m pytest
# }

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  for _docfile in CHANGELOG.md README.md; do
    install -vDm0644 "$_docfile" -t "$pkgdir/usr/share/doc/$_pkgname"
  done

  ln -svf "/usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
}
