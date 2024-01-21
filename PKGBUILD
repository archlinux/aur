# Maintainer: Daniel Souza <aur at posix dot dev dot br>
_pkgname="reminders"
_gitauthor="danisztls"
_gitbranch="main"

pkgname=${_pkgname}-git
pkgver=latest
pkgrel=1
pkgdesc="Reminds about events stored in YAML."
arch=('any')
url="https://github.com/danisztls/reminders"
license=('GPLv3')
depends=('python' 'python-yaml' 'python-dateutil')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/danisztls/reminders")
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
  install -Dm755 reminders.py "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm 644 reminders.service "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -vDm 644 reminders.target "${pkgdir}/usr/lib/systemd/user/${_pkgname}.target"
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
