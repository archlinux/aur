# Maintainer:

_pkgname="intel-xed"
pkgname="$_pkgname"
pkgver=2025.11.23
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

_pkgsrc="$_pkgname"
_pkgsrc_mbuild="intelxed.mbuild"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v$pkgver"
  "$_pkgsrc_mbuild"::"git+https://github.com/intelxed/mbuild"
)
sha256sums=(
  '6ad20029439a9c8c8f0badd7481613a2a715ffc16e72bca41c5d98e7df7542d9'
  'SKIP'
)

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
