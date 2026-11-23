# Maintainer: Lukas Lipinsky <6032558+Mr-Tao@users.noreply.github.com>

pkgname=androidtvremote2-gtk
pkgver=0.1.0
pkgrel=3
pkgdesc='Native GTK remote control for Android and Google TV devices'
arch=('any')
url='https://github.com/Mr-Tao/androidtvremote2-gtk'
license=('Apache-2.0')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-androidtvremote2'
  'python-gobject'
  'python-zeroconf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
_distname=androidtvremote2_gtk
_dns_sd_fix=f01e55a78ca7c7e6bb3bf881e9a2290e8c104191
source=(
  "$url/releases/download/v$pkgver/$_distname-$pkgver.tar.gz"
  "dns-sd-reconnect-$_dns_sd_fix.patch::$url/commit/$_dns_sd_fix.patch"
)
sha256sums=(
  'b2ca51280459042ae4d707681ca8dcc9030c1dc7c9b27d55263af8133c938761'
  '24ad9c6c4b32abadafc7bfce58d52c91d5ae114f9a5da7f0a028fe0267a686a7'
)

prepare() {
  cd "$_distname-$pkgver"
  patch --forward --fuzz=0 -p1 < "$srcdir/dns-sd-reconnect-$_dns_sd_fix.patch"
}

build() {
  cd "$_distname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_distname-$pkgver"
  pytest -q
}

package() {
  cd "$_distname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
