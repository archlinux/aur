# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Felix Bühler <account at buehler dot rocks>
# Contirbutor: Nils Czernia <nils[at]czserver.de>

: ${_sync_nmap:=false}

_gitname="nmap"
_pkgname="zenmap"
pkgname="$_pkgname"
pkgver=7.95
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer"
url='https://github.com/nmap/nmap'
license=('LicenseRef-Nmap-Public-Source-License-Version-0.95')
arch=('any')

depends=(
  'gtk3'
  'nmap'
  'python'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'gksu: start zenmap as root'
)

_source_main() {
  local _pkgver=$(pkgver)

  _pkgsrc="$_gitname-$_pkgver"
  _pkgext="tar.bz2"
  source=("$_pkgsrc.$_pkgext"::"https://nmap.org/dist/$_pkgsrc.$_pkgext")
  sha256sums=('SKIP')
}

pkgver() {
  if [[ "${_sync_nmap::1}" == "t" ]]; then
    LANG=C LC_ALL=C pacman -Si nmap | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])'
  else
    echo "${pkgver:?}"
  fi
}

build() {
  cd "$_pkgsrc/zenmap"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm755 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd zenmap
  python -m installer --destdir="$pkgdir" dist/*.whl

  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"
}

_source_main
