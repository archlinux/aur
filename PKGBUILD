# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=${pkgname#python-}
pkgver=0.10.4
pkgrel=2
epoch=1
pkgdesc="Asynchronous mainloop implementation for tkinter."
arch=('any')
url="https://insolor.github.io/async-tkinter-loop"
license=('MIT')
depends=(
  'python'
  'tk'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'dbus'
  'python-customtkinter'
  'python-pytest'
  'python-pytest-timeout'
  'xorg-server-xvfb'
)
optdepends=(
  'python-customtkinter'
  'python-httpx'
  'python-pillow'
)
source=("$_name-$pkgver.tar.gz::https://github.com/insolor/async-tkinter-loop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e58ece5ad9b61aeca937bcbd643efd7e1af7ba7dabf57a84de1b387848a2793')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH=. dbus-run-session xvfb-run test-env/bin/python -P -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
