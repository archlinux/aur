# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-atproto-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.0.59.r1.g16a02f4
pkgrel=1
pkgdesc='The AT Protocol (Bluesky) SDK for Python (latest commit)'
arch=('any')
url='https://github.com/MarshalX/atproto'
license=('MIT')  # SPDX-License-Identifier: MIT
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
source=("git+$url.git")
provides=("$_pkgname"{,_{cli,clint,codegen,core,crypto,firehose,identity,lexicon,server}})
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGES,README,SECURITY}.md
}

# eof
