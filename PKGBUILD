# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=1.13.0
_pkgver="$pkgver-deb_for_stores"
pkgrel=1
pkgdesc="System performance and usage monitoring tool"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('bash' 'dmidecode' 'gtk3' 'iproute2' 'polkit' 'python-cairo' 'python-gobject'
         'systemd' 'util-linux')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz"
        "org.freedesktop.$pkgname.policy")
sha256sums=('4d235b861225ce3c40de6107a7d14c6f8e5e8bbfa9d642065f4deb3f82b6f3a7'
            '468d309c8c2520ee09d68fbac8161f1034f6ea04b7b30b5127d3a83066415bd1')

build() {
  cd "$pkgname-$_pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$_pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}"/usr/{bin,share} "$pkgdir/usr/"
  rm -rf "${pkgdir}${site_packages}/usr"

  install -Dm644 "$srcdir/org.freedesktop.$pkgname.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"
}
