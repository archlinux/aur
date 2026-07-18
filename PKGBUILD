pkgname=puny-manager
pkgver=2.3.0
pkgrel=1
pkgdesc="Minimal local CLI password manager with optional Howdy facial unlock"
arch=('any')
url="https://github.com/Vaspyyy/puny-manager"
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=(
  'howdy: facial recognition unlock'
  'python-pam: PAM bridge for facial recognition unlock'
)
backup=('etc/pam.d/puny-manager-howdy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaspyyy/puny-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e81452346f80c281363ee20938874027dbdc9c4172e3b1bef844535a9e924de7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  local test_root
  test_root="$(mktemp -d)"
  XDG_DATA_HOME="$test_root/data" XDG_CONFIG_HOME="$test_root/config" python -m pytest -q
  rm -rf "$test_root"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 packaging/arch/puny-manager-howdy.socket \
    "$pkgdir/usr/lib/systemd/system/puny-manager-howdy.socket"
  install -Dm644 packaging/arch/puny-manager-howdy@.service \
    "$pkgdir/usr/lib/systemd/system/puny-manager-howdy@.service"
  install -Dm644 packaging/arch/puny-manager-howdy.pam \
    "$pkgdir/etc/pam.d/puny-manager-howdy"
  install -Dm644 packaging/arch/puny-manager.tmpfiles \
    "$pkgdir/usr/lib/tmpfiles.d/puny-manager.conf"
}
