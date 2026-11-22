# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: rapiertg <rapiertg@gmail.com>

_get_major_base() {
  local given_ver="$1"
  echo "${given_ver%%.*}".0
}

_name=virtualmoon
pkgname="${_name}atlas"
pkgver=9.1
pkgrel=1
pkgdesc="Software for Moon observation and survey"
arch=('x86_64')
url="https://www.ap-i.net/avl/en/start"
license=('GPL-2.0-only')
depends=('gtk2' 'libpasastro' 'xdg-utils' 'libglvnd' 'libxxf86vm' 'glu')
provides=("$pkgname")
conflicts=("${pkgname}-git")

_resroot="https://sourceforge.net/projects/${_name}/files/1-%20${_name}/Version%20$(_get_major_base $pkgver)"
_mainver="$pkgver"
_dataver=$(_get_major_base $pkgver)

source=(
  "${_name}_${pkgver}_amd64.deb::${_resroot}/${_name}_${_mainver}_amd64.deb/download"
  "${_name}-basedata_${pkgver}_all.deb::${_resroot}/${_name}-basedata_${_dataver}_all.deb/download"
)
sha256sums=('adee70a7e8995831b1618ae8afe581714a5e4372dbc3881e09fe34a1f2891d86'
            '449cbd7c9759cfa70ac57ac4d99bf33d62a275cb6efc48f7efffc1d35252ef15')

extract_deb() {
  local tmpdir="$(basename "${1%.deb}")"
  local ext="$2"

  rm -Rf "$tmpdir"
  mkdir "$tmpdir"
  cd "$tmpdir"
  ar x "$1"
  tar -C "${pkgdir}" -xf data.tar."$ext"
}

package() {
  extract_deb "${srcdir}/${_name}_${pkgver}_amd64.deb" "xz"
  extract_deb "${srcdir}/${_name}-basedata_${pkgver}_all.deb" "zst"

  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
}

