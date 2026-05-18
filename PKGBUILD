# Maintainer: Blake Morrison <blake@truealter.com>
# Contributor: ALTER Meridian Pty Ltd <hello@truealter.com>
#
# This PKGBUILD wraps the upstream `truealter` PyPI distribution as the
# Arch package `alter-runtime`. After PKGBUILD edits, regenerate
#   makepkg --printsrcinfo > .SRCINFO
# then — and only then, with Blake's explicit go — push to
#   ssh://aur@aur.archlinux.org/alter-runtime.git

pkgname=alter-runtime
_pypiname=truealter
pkgver=0.1.0
pkgrel=1
pkgdesc="~Alter Identity Runtime — L3 local sovereign daemon"
arch=('any')
url="https://github.com/true-alter/alter-runtime"
license=('Apache-2.0')
depends=(
  'python'
  'python-httpx'
  'python-pydantic'
  'python-yaml'
  'python-watchdog'
)
optdepends=(
  'python-dbus-next: D-Bus session bus integration'
  'systemd: systemd user unit integration'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
source=("https://files.pythonhosted.org/packages/source/t/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('b1c9a3ffd29581b629c154399e86e599b7a2f962af82e4c86e83bfeb9c93dabb')  # pragma: allowlist secret

build() {
  cd "$srcdir/${_pypiname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pypiname}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/lib/systemd/user"
  sed \
    -e 's|@ALTER_RUNTIME_BIN@|/usr/bin/alter-runtime|g' \
    -e 's|@ALTER_RUNTIME_HOME@|%h|g' \
    "alter_runtime/services/systemd/alter-runtime.service.in" \
    > "$pkgdir/usr/lib/systemd/user/alter-runtime.service"

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
