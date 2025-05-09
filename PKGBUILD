# Maintainer:

_pkgname="intel-xed"
pkgname="$_pkgname-git"
pkgver=2025.03.02.r0.g1bdc793
pkgrel=1
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
  install -dm755 "$pkgdir/usr/include"
  cp --reflink=auto -a include/* "$pkgdir/usr/include/"

  # libs
  install -Dm644 lib/* -t "$pkgdir/usr/lib/"

  # binaries and symlink
  install -Dm755 bin/* -t "$pkgdir/usr/lib/$_pkgname/bin/"
  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/usr/lib/$_pkgname/bin/xed" "$pkgdir/usr/bin/intel-xed"

  # reference
  install -dm755 "$pkgdir/usr/lib/$_pkgname/ref-manual"
  cp --reflink=auto -a doc/ref-manual/html/* "$pkgdir/usr/lib/$_pkgname/ref-manual/"

  # examples
  install -Dm644 examples/* -t "$pkgdir/usr/lib/$_pkgname/examples/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
