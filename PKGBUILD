# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: anekos <anekos@snca.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lfe-git
pkgver=r1171.9a75089
pkgrel=1
epoch=1
pkgdesc="Lisp Flavoured Erlang"
url='http://lfe.io/'
arch=('x86_64')
license=('Apache_v2')
depends=('erlang-nox' 'rebar')
makedepends=('pandoc')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/lfe/lfe.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "r%s.%s"                  \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  make
}

package () {
  cd "${pkgname%-git}"

  make PREFIX="${pkgdir}/usr" install

  cd "${pkgdir}"/usr/bin

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
