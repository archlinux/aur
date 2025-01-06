# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=xandikos-git
_name=${pkgname%-git}
pkgver=0.2.12.r44.g7a7e4df
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=(any)
url=https://www.xandikos.org
license=(GPL-3.0-or-later)
depends=(
  python-aiohttp
  python-defusedxml
  python-dulwich
  python-icalendar
  python-jinja
  python-multidict
  python-pytz
  python-vobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-aiohttp-openmetrics: for metrics with the standalone server'
  'python-systemd: for systemd socket activation'
  'uwsgi-plugin-python: for the WSGI interface'
)
provides=("$_name")
conflicts=("$_name")
source=(
  "git+https://github.com/jelmer/$_name.git"
  "$_name.sysusers.conf"
  "$_name.tmpfiles.conf"
)
b2sums=('SKIP'
        '086423882a085cb7fbecad3f53ad60aa6c322a545c180fe8b4c9f2bba5331fa52d6fc3e96ec068c589d3ab3e0b8f215e1a94473c511560188bd873b7ff5780d6'
        'be8df371a3cdd55e2efd4549251b44cbb5699762f14aa3dcb0e85cdbb3710d75fae8e38b615057f6da37fe744019aabc2c366136ca577a152cd03d380db189c2')
#validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

pkgver() {
  cd "$_name"
  git describe --long --tags --match v\* | sed 's/v//;s/-/.r/;s/-/./'
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  make check
}

package() {
  install -Dm644 "$_name".sysusers.conf \
    "$pkgdir"/usr/lib/sysusers.d/"$_name".conf
  install -Dm644 "$_name".tmpfiles.conf \
    "$pkgdir"/usr/lib/tmpfiles.d/"$_name".conf

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/doc/"$_name" README.rst
  install -Dm644 -t "$pkgdir"/usr/share/doc/"$_name"/examples examples/*
  install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/"$_name".8
}
