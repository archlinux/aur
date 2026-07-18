# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-atproto-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='The AT Protocol (Bluesky) SDK for Python (development version)'
pkgver=0.0.69.r4.g15b9499
pkgrel=1
url='https://github.com/MarshalX/atproto'
arch=('any')
license=(
  'MIT'
  'CC0-1.0'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-dynamic-versioning'
  'python-wheel'
)
depends=(
  'python'
  'python-click'
  'python-cryptography'
  'python-dnspython'
  'python-httpx'
  'python-libipld'
  'python-pydantic'
  'python-typing_extensions'
  'python-websockets'
)
provides=("$_pkgname"{,_{cli,client,codegen,core,crypto,firehose,identity,lexicon,server}})
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  export PYTHNOWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGES,README,SECURITY}.md
  cp -fa examples "$pkgdir/usr/share/doc/$pkgname/"

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -fsr "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
