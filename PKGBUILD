# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='cmsend-git'
_pkgname="${pkgname/-git/}"
pkgver=0.4.2.r1.g76fc618
pkgrel=1
pkgdesc='CLI for sending end-to-end encrypted chatmail messages between systems (development version)'
arch=('any')
url='https://github.com/chatmail/cmsend'
license=('MPL-2.0')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'deltachat-rpc-server'
  'python'
  'python-deltachat-rpc-client'
  'python-xdg-base-dirs'
)
source=("$_pkgname::git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  sed -i 's/"setuptools-git-versioning >=2.0,<3"/"setuptools-git-versioning >=2.0,<=3.1"/g' pyproject.toml
}

build() {
  cd "$_pkgname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  cd "$pkgdir/usr/share/doc" && ln -srf "$pkgname" "$_pkgname"
}

# eof
