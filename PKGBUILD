# Maintainer:

_gitname="nmap"
_pkgname="zenmap"
pkgname="$_pkgname-git"
pkgver=7.94.r4.g6a567c7c0
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer"
url='https://github.com/nmap/nmap'
arch=('any')
license=('custom')

depends=(
  'gtk3'
  'nmap'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
)
optdepends=(
  'gksu: start zenmap as root'
)

provides=(
  "$_pkgname"
  "zenmap-python3-git"
)
conflicts=(${provides[@]})

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "$srcdir/$_gitname"
  sed -Ei 's@SVN@@' "zenmap/zenmapCore/Version.py"
}

pkgver() {
  cd "$srcdir/$_gitname"

  _regex='^VERSION = "([0-9]+\.[0-9]+(\.[0-9]+)?)(SVN)?"$'
  _file='zenmap/zenmapCore/Version.py'

  _line=$(
    grep -E "$_regex" "$_file" | head -1 | sed 's@SVN"$@@'
  )
  _version=$(
    echo "$_line" | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -S "${_line::-1}" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "$_version.r$_revision.g$_hash"
}

package() {
  cd "$srcdir/$_gitname"
  cd "zenmap"

  python3 setup.py install --prefix "/usr" --root="$pkgdir" --optimize=1

  rm "$pkgdir/usr/bin/uninstall_zenmap"
  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"

  install -vDm644 "../docs/zenmap.1" -t "$pkgdir/usr/share/man/man1"
  install -vDm755 "../LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
