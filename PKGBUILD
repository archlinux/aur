# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

_pkgname=python-croniter
pkgname="$_pkgname-git"
_name="${_pkgname#python-}"
pkgdesc='Parses cron schedules to iterate over datetime objects (development version)'
pkgver=6.2.4.r3.g70564f2
pkgrel=2
changelog="$_pkgname.changelog"
url='https://github.com/pallets-eco/croniter'
arch=('any')
license=('MIT')
checkdepends=(
  'python-pytest-cov'
  'python-setuptools'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-packaging'
  'python-pathspec'
  'python-pluggy'
  'python-trove-classifiers'
  'python-wheel'
)
depends=(
  'python'
  'python-dateutil'
  'python-pytz'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_name"

  # Relax requirements
  sed -i 's/==/>=/g' pyproject.toml
  sed -i 's/hatchling>=1.31.0/hatchling>=1.30.1/g' pyproject.toml
}

pkgver() {
  cd "$_name"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  sed -i 's/hatchling>=1.31.0/hatchling>=1.30.1/g' pyproject.toml
  export PYTHONWARNINGS=ignore
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

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.rst
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" >/dev/null 2>&1 \
      && ln -sr $pkgname "$_pkgname"
  done
}

# eof
