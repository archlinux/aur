# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

_pkgname=python-croniter
pkgname="$_pkgname-git"
_name="${_pkgname#python-}"
pkgver=6.0.0.r83.gb2ab627
pkgrel=1
pkgdesc='Parses cron schedules to iterate over datetime objects (development version)'
arch=('any')
url='https://github.com/pallets-eco/croniter'
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-pytz'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest-cov'
  'python-setuptools'
)
source=("git+$url.git")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

prepare() {
  cd "$_name"

  git clean -dfx
}

pkgver() {
  cd "$_name"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"

  pytest src
}

package() {
  cd "$_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages='<VOID>'
  _site_packages=$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )
  rm -rf "$pkgdir/$_site_packages/$_name/tests"

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname"      ./*.rst
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
