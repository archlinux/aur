# Maintainer: Emily <info@emy.sh>

_pkgname=nfuspire
pkgname=${_pkgname}-git
pkgdesc="Nspire FUSE filesystem"
pkgver=0.r1.g9d5b53e
pkgrel=1
arch=('any')
license=('GPL-3.0')
url="https://github.com/EmilyCSh/${_pkgname}"
depends=('libnspire')
makedepends=('git' 'pkgconfig' 'libnspire')
source=("$pkgname::git+https://github.com/EmilyCSh/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

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
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
