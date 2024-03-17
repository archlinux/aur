# Maintainer: 
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: YaYPIXXO <viggo@lekdorf.com>
pkgname=evillimiter-git
pkgver=1.5.0.r0.g46d2033
pkgrel=2
pkgdesc="Tool that monitors, analyzes and limits the bandwidth of devices on the local network without administrative access."
arch=('any')
url="https://github.com/bitbrute/evillimiter"
license=('MIT')
depends=(
  'glibc'
  'python-colorama'
  'python-netaddr'
  'python-netifaces'
  'python-tqdm'
  'python-scapy'
  'python-setuptools'
  'python-terminaltables'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bitbrute/evillimiter.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix LIBC issue
  ln -sf /usr/lib/libc.a "$pkgdir/usr/lib/liblibc.a"
}
