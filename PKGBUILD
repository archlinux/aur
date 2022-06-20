# Maintainer: silentnoodle <silentnoodle at cock dot li>

pkgname=most-git
_pkgname=most
pkgver=5.2.0.pre9
pkgrel=1
pkgdesc='pager'
arch=(x86_64)
url='https://github.com/jedsoft/most'
license=(GPL2)
depends=(slang)
makedepends=(git)
provides=(most)
conflicts=(most)
source=(
"git+$url"
)
md5sums=('SKIP')


prepare() {
  cd "$srcdir/$_pkgname"
  _log=$(git log --pretty=format:%H§%s | grep -m1 "pre")
  git checkout "${_log%§*}" >/dev/null 2>&1
}

pkgver() {
  _log_msg=${_log#*§}
  _ver_str="${_log_msg%%:*}" # what we have: pre5.2.0-9, what we want: 5.2.0.pre9
  _ver=${_ver_str%%-*}
  _ver=${_ver#pre}
  _rel=${_ver_str##*-}
  echo "$_ver.pre$_rel"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
