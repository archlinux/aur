# Maintainer:

_gitname="nmap"
_pkgname="zenmap"
pkgname="$_pkgname-git"
pkgver=7.94.r89.g8d0a4d9b
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer"
url='https://github.com/nmap/nmap'
license=('LicenseRef-Nmap-Public-Source-License-Version-0.95')
arch=('any')

depends=(
  'gtk3'
  'nmap'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'python-setuptools'
)
optdepends=(
  'gksu: start zenmap as root'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url")
sha256sums=('SKIP')

prepare() {
  sed '204,205d' -i "$_pkgsrc/zenmap/setup.py"
}

pkgver() {
  cd "$_pkgsrc"

  local _regex='\s*Merge ([0-9]+\.[0-9]+(\.[0-9]+)?) release branch$'
  local _file='zenmap/zenmapCore/Version.py'

  local _line=$(
    git log -E --grep="^$_regex" -1 --pretty=oneline --no-color -- "$_file"
  )
  local _version=$(
    echo "$_line" | sed -E "s@^[0-9a-f]*$_regex@\1@"
  )
  local _commit=$(
    echo "$_line" | sed -E 's@ .*$@@'
  )
  local _revision=$(
    git rev-list --count --cherry-pick $_commit...HEAD
  )
  local _hash=$(
    git rev-parse --short=8 HEAD
  )

  echo "$_version.r$_revision.g$_hash"
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm755 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd zenmap
  python3 setup.py install --prefix "/usr" --root="$pkgdir" --optimize=1

  rm "$pkgdir/usr/bin/uninstall_zenmap"
  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"
}
