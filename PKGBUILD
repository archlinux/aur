# Maintainer:

_gitname="nmap"
_pkgname="zenmap"
pkgname="$_pkgname-git"
pkgver=7.95.r94.g667527c
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _regex='^Nmap ([0-9\.]+) .*$'
  local _file='CHANGELOG'

  local _line=$(grep -Esm1 "$_regex" "$_file")
  local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

  local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')

  local _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
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
