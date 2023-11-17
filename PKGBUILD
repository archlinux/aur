# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=btop-git
pkgver=1.2.13.r772.0267eba
pkgrel=1
pkgdesc="A monitor of resources"
arch=(any)
url="https://github.com/aristocratos/btop"
license=('Apache-2.0')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}::git+https://github.com/aristocratos/btop.git"
        "git+https://github.com/fmtlib/fmt.git")
sha512sums=('SKIP'
            'SKIP')
provides=('btop')
conflicts=('btop')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(cat CHANGELOG.md | grep '^##' | sed 's/## v//g' | head -1)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule."lib/fmt".url "${srcdir}/fmt"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}"

  make STATIC=true
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" make PREFIX=/usr install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
