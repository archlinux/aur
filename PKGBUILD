# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: anekos <anekos@snca.net>

pkgname='lfe-git'
_pkgname='lfe'
pkgver=r963.2880c8a
pkgrel=1
pkgdesc="Lisp Flavoured Erlang"
url='http://lfe.io/'
arch=('x86_64')
license=('Apache_v2')
depends=('erlang-nox')
conflicts=("${_pkgname}")
source=('git+https://github.com/rvirding/lfe.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s"                  \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  make
}

package () {
  cd "${_pkgname}"

  make PREFIX="${pkgdir}/usr" install

  cd "${pkgdir}/usr/bin"

  # Properly symlink lfe binaries:
  for link in *; do
    ln -sfv "../lib/lfe/bin/${link}" "${link}"
  done

  # Remove useless files / folders:
  rm -rv "${pkgdir}/usr/share/man/cat1"
  rm -rv "${pkgdir}/usr/share/man/cat3"
  rm -rv "${pkgdir}/usr/share/man/cat7"
  rm -v "${pkgdir}/usr/share/man/index.db"
}

# vim:set ts=2 sw=2 et:
