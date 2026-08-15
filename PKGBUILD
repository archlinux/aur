# Maintainer: Pete Jackson <pete@peteonrails.com>
pkgname=omadex
pkgver=1.0.2
pkgrel=1
pkgdesc='Contact aggregator for Omarchy: one address layer over many address books'
arch=('any')
url='https://github.com/peteonrails/omadex'
license=('MIT')
depends=(
  'python'
  'wl-clipboard'
  'xdg-utils'
)
optdepends=(
  'abook: plain-text address book source'
  'blueferry-backend: iPhone phonebook source (needs the fork with ListContacts)'
  'evolution-data-server: Evolution source, and any account attached to it'
  'neomutt: mail alias source, and composing to a contact'
  'notmuch: correspondent source, once a maildir is indexed'
  'omarchy: the Quickshell overlay and its launch helpers'
  'python-dbus: required by the iPhone source'
  'vdirsyncer: CardDAV contacts synced to a local vdir'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'ruff'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('093aab9df20e4b26e6c9bc7952c0e7c319d3406ccd6a24841b60cc4cdc1b5a9a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  ruff check .
  # The suite passes with none of the optional sources installed.
  PYTHONPATH="$PWD/src" python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Omarchy reads third-party plugins from ~/.config/omarchy/plugins, which is
  # not the package's to write. `omadex plugin install` copies it there.
  install -Dm644 manifest.json "$pkgdir/usr/share/$pkgname/plugin/manifest.json"
  install -Dm644 OmaDex.qml "$pkgdir/usr/share/$pkgname/plugin/OmaDex.qml"

  # Shipped but not enabled: the overlay talks to the CLI, and the daemon
  # exists for other D-Bus clients.
  install -Dm644 systemd/omadex.service \
    "$pkgdir/usr/lib/systemd/user/omadex.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
