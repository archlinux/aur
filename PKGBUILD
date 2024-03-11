# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-liblarch
pkgver=3.2.0
pkgrel=2
pkgdesc="Python library to easily handle data structure"
arch=(any)
url=https://wiki.gnome.org/action/show/Projects/liblarch
license=(LGPL3)
depends=(gtk3 python python-gobject)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-nose)
provides=(python-liblarch_gtk)
conflicts=(python-liblarch_gtk)
source=("liblarch-${pkgver}.tar.gz::https://github.com/liblarch/liblarch/archive/v${pkgver}.tar.gz")
b2sums=('92bf0c51b2f16e84633c75f51ccf321c8756b154bfa76412db5ff7b1879e27f0a24f69e2be94db10c9409b0b326d5ac4477c88eaf8f1be80ef9f3390ea26f879')

check() {
  cd "$srcdir/liblarch-${pkgver}"

  # In order to allow GTK to work it needs a display server. To avoid running
  # an X server (like Xephyr) or a Wayland compositor, we can instead use the
  # built-in Broadway backend, listening on a random socket.
  local broadway_display=":$RANDOM"
  local broadway_pid

  broadwayd --unixsocket "$(pwd)/broadway.socket" "${broadway_display}" &
  broadway_pid=$!

  # Now run the tests, pointing GTK to the Broadway server started above.
  GDK_BACKEND=broadway BROADWAY_DISPLAY="${broadway_display}" python run-tests

  # Once done, kill the Broadway server.
  kill "${broadway_pid}"
}

build () {
  cd "$srcdir/liblarch-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/liblarch-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
