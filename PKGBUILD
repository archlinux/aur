# Maintainer: Daniel de Souza <aur at posix dot dev dot br>
_pkgname="eudaemon"
_gitauthor="danisztls"
_gitbranch="main"

pkgname="${_pkgname}-git"
pkgver=r48.9142a17
pkgrel=1
pkgdesc="Monitor and log activity, improve awareness and empower user to improve it's habits."
arch=('any')
url="https://github.com/danisztls/eudaemon"
license=('GPLv3')
depends=('python' 'dbus-python')
makedepends=('git')
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

package() {
  cd "$srcdir/$_pkgname"
  install -Dm  755 "${_pkgname}/__init__.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm 644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -vDm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm 644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
