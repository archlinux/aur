#Maintainer: SimPilotAdamT <adam_tazul@outlook.com>

_pkgbase='img3tool'
pkgbase='img3tool-git'
pkgname=('img3tool-git')
pkgver=0
pkgrel=1
pkgdesc='A tool for manipulating IMG3 files'
arch=('x86_64')
url="https://github.com/Elcomsoft/img3tool"
license=('LGPL-3.0')
makedepends=('git' 'libgeneral-git' 'libplist-git' 'openssl')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgbase}
  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    printf '%s.r%s.g%s' \
      "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
      "$(git rev-list --count ${GITTAG}..)" \
      "$(git log -1 --format='%h')"
  else
    printf '0.r%s.g%s' \
      "$(git rev-list --count master)" \
      "$(git log -1 --format='%h')"
  fi
}

build() {
  cd ${srcdir}/${_pkgbase}
  ./autogen.sh
  make
}

package() {
  cd ${srcdir}/${_pkgbase}
  make prefix="/usr" DESTDIR="${pkgdir}" install
}
