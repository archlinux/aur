# Shellcheck: shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-libipld-git'
_pkgname="${pkgname/-git/}"
pkgdesc='Fast Python library to work with IPLD: CAR, CID, DAG-CBOR, DAG-JSON, DAG-PB, multibase (development version)'
pkgver=3.4.1.r4.g88fe80f
pkgrel=1
url='https://github.com/MarshalX/python-libipld'
arch=('aarch64' 'x86_64')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
depends=(
  'glibc'
  'libgcc'
  'python'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -fsr "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
