# Maintainer:
# Contributor: leuko <aur202307_et_aydos_de>

_pkgname="xpra-html5"
pkgname="$_pkgname-git"
pkgver=16.2.r37.ged0b9fc
pkgrel=1
pkgdesc="HTML5 client for Xpra"
url="https://github.com/Xpra-org/xpra-html5"
license=('MPL-2.0')
arch=('x86_64')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

makedepends=(
  'git'
  'python'
  'brotli'    # compression for served files (.br)
  'gzip'      # compression for served files (.gz)
  'uglify-js' # for compressing Javascript
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag _pkgver _version _revision _hash
  _tag=$(git tag | sort -rV | head -1)
  _pkgver=$(sed -E 's&^[^0-9]*&&' <<< "${_tag:?}")
  _version="${_tag#v}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

package() {
  cd "$_pkgsrc"

  # custom script, *not* based on python-setuptools
  python setup.py install "$pkgdir" # `args[2]` is `root_dir`
}
