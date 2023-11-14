# Maintainer:
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

if [ -z "$CARGO_HOME" ] ; then
  export CARGO_HOME="${SRCDEST:-${startdir:?}}/cargo"
fi

_pkgname="python-tiktoken"
pkgname="$_pkgname-git"
pkgver=0.5.1.r0.g39f29ce
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models"
url="https://github.com/openai/tiktoken"
license=('MIT')
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)

depends=(
  'python'
  'python-regex'
  'python-requests'
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
  'python-hypothesis'
  'python-pytest'
)
optdepends=(
  # AUR
  'python-blobfile: for reading blobfiles'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgsrc"

  rm -r tiktoken tiktoken.egg-info tiktoken_ext
  local python_version
  python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version" python -m pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
