# Maintainer:

_pkgname="intel-xed"
pkgname="$_pkgname-git"
pkgver=2025.11.23.r0.g722cd23
pkgrel=2
pkgdesc="A library for encoding and decoding x86 instructions"
url="https://github.com/intelxed/xed"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'doxygen'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
_pkgsrc_mbuild="intelxed.mbuild"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_mbuild"::"git+https://github.com/intelxed/mbuild"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  echo "Building mbuild..."
  cd "$_pkgsrc_mbuild"
  python -m build --wheel --no-isolation --skip-dependency-check

  python -m venv --system-site-packages mbuild-env
  source mbuild-env/bin/activate
  python -m installer dist/*.whl

  echo "Building Intel XED..."
  cd "../$_pkgsrc"
  ./mfile.py --shared doc doc-build examples install $MAKEFLAGS
)

package() {
  cd "$_pkgsrc"/kits/xed-install-base-*-lin-x86-64/

  # headers
  mkdir -pm755 "$pkgdir/usr/include"
  cp -r include/* "$pkgdir/usr/include/"

  # libs
  install -Dm644 lib/* -t "$pkgdir/usr/lib/"

  # binaries and symlink
  install -Dm755 bin/* -t "$pkgdir/usr/lib/$_pkgname/"
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/xed" "$pkgdir/usr/bin/intel-xed"

  # reference
  mkdir -pm755 "$pkgdir/usr/share/doc/$_pkgname"
  cp -r doc/ref-manual/html "$pkgdir/usr/share/doc/$_pkgname/ref-manual"

  # examples
  cp -r examples "$pkgdir/usr/share/doc/$_pkgname/examples"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
