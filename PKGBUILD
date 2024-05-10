# Maintainer: Daniel de Souza <aur at posix dot dev dot br>
_pkgname="eudaemon"
_gitauthor="danisztls"
_gitbranch="main"

pkgname="${_pkgname}-git"
pkgver=r56.93186f6
pkgrel=2
pkgdesc="Monitor and log activity, improve awareness and empower user to improve it's habits."
arch=('any')
url="https://github.com/danisztls/eudaemon"
license=('GPLv3')
depends=('python' 'python-dbus-fast')
makedepends=('git' 'python-poetry' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git+https://github.com/danisztls/eudaemon")
sha512sums=('SKIP') 

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use tags but fallback to revision
  ( set -o pipefail
    git describe --tags --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
