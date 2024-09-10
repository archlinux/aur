# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gjay"
pkgname="${_pkgname}-git"
pkgver=0.4.r7.9df0279
_commit="bbce54f744f81c782bb7db9606993e06858f94b3"
pkgrel=1
pkgdesc="DJ-friendly GUI for generating playlists across large music collections"
arch=('x86_64')
url="https://${_pkgname}.sourceforge.net"
_url="https://github.com/csmall/${_pkgname}"
license=('GPL-2.0-or-later')
makedepends=('git' 'libvorbis')
depends=('audacious' 'dbus-glib' 'flac' 'gdk-pixbuf2' 'glib2' 'glibc' 'gsl'
         'gtk2' 'libaudclient' 'libmpdclient' 'mpg321' 'vorbis-tools')
optdepends=('libvorbis: support .ogg files')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/AC_INIT(\[[^]]*\],\[\([^]]*\)\].*/\1/p' configure.ac)
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
