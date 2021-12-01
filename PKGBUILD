# Maintainer: Dominik Kummer <devel@arkades.org>

pkgname=kwalletcli-git
pkgver=r104.9b1f130
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
depends=('kwallet' 'mksh')
conflicts=('kwallet-cli')
makedepends=('gcc' 'make')
source=("${pkgname}::git://github.com/MirBSD/kwalletcli")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's/CPPFLAGS+=	${KDE_INCS} -D_GNU_SOURCE/CPPFLAGS+=	${KDE_INCS} -fPIC -D_GNU_SOURCE/' GNUmakefile
  make KDE_VER=5
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  for F in kwalletaskpass kwalletcli kwalletcli_getpin pinentry-kwallet; do
    install ${F} "${pkgdir}"/usr/bin/${F}
    install -m644 ${F}.1 "${pkgdir}"/usr/share/man/man1/${F}.1
  done
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
