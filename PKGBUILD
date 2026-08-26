# Maintainer: mlue <phanithlim2002@gmail.com>
pkgname=mluevpn
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK4 VPN manager for OpenConnect and OpenVPN 3 with encrypted credential storage"
arch=('any')
url="https://github.com/phanithlim/mluevpn"
license=('MIT')

# python-gobject/gtk4/libadwaita are the GUI; the rest is the credential store
# and the pexpect prompt driver. openconnect is a hard dependency because the
# OpenConnect backend is half the app; openvpn3 lives in the AUR so it can only
# be optional.
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-pexpect'
  'python-cryptography'
  'python-keyring'
  'openconnect'
  'sudo'
)
optdepends=(
  'openvpn3: connect to OpenVPN .ovpn profiles'
  'gnome-keyring: store the encryption key in the login keyring instead of a file'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1b96bea4dc6f9379878d58f5ed2e20e30926b6f0c56ec539f2f095c3b4555de')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Always the system interpreter, never whatever `python` happens to be on the
  # builder's PATH. python-installer derives its install paths from the running
  # interpreter's sysconfig, so building with an active virtualenv would lay the
  # package out under that venv's prefix instead of /usr.
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 packaging/mluevpn.desktop \
    "$pkgdir/usr/share/applications/mluevpn.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/design.md "$pkgdir/usr/share/doc/$pkgname/design.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
