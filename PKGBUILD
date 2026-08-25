# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-masky-git"
pkgver=0.2.1.r39.d0e16e9
pkgrel=1
pkgdesc="Python library with CLI allowing to remotely dump domain user credentials via an ADCS without dumping the LSASS process memory"
arch=('any')
url="https://github.com/Z4kSec/masky"
license=('MIT')
provides=("python-masky=$pkgver")
conflicts=("python-masky")
depends=(
  'python>=3.9'
  'python-colorama'
  'impacket'
  'python-cryptography>=3.5'
  'python-pyasn1'
  'python-asn1crypto'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'git'
)
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C masky clean -dfx
}

pkgver() {
  cd masky
  local _tag="$(grep '^\s*version' setup.py | awk -F\" '{print $2}')"
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd masky
  python -m build -wnx
}

package() {
  cd masky
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
