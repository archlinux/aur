# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=certihound
pkgname="python-$_name-git"
pkgver=0.3.2.r20.1bdc36c
pkgrel=1
pkgdesc="Linux-native AD CS collector library for BloodHound CE"
arch=(any)
url="https://github.com/0x0Trace/$_name"
license=('MIT')
provides=("python-$_name")
conflicts=("python-$_name")
depends=(
  'python>=3.10'
  'python-ldap3>=2.9.1'
  'impacket'
  'python-cryptography>=41.0.0'
  'python-pydantic>=2.0'
  'python-click>=8.1.0'
  'python-rich>=13.0.0'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=61.0'
  'git'
)
checkdepends=(
  'python-pytest>=7.0.0'
  'python-pytest-cov>=4.0.0'
)
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C "$_name" clean -dfx
}

pkgver() {
  cd "$_name"
  _tag="$(grep '^version' pyproject.toml | awk -F\" '{print $2}')" # Repo has no tags
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_name"
  python -m build -wnx
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
