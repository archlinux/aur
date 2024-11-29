# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=breads-git
_pkgname="${pkgname%-git}"
pkgver=131.2d97bcc
pkgrel=1
pkgdesc="BREADS - BREaking Active Directory Security; focused on enumerating and attacking Active Directory environments through LDAP and SMB protocols."
arch=('any')
url="https://github.com/oppsec/breads"
license=(MIT)
depends=('python'
         'impacket'
         'python-ldap3'
         'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
}

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

