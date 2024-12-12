# Maintainer: Dominik Kummer <devel@arkades.org>

pkgbase=kwalletcli-git
pkgname=kwalletcli-git
pkgver=kwalletcli.3_03.r6.ge63d053
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
provides=("kwalletcli")
depends=('kwallet' 'mksh')
conflicts=('kwalletcli')
makedepends=('git' 'gcc' 'make')
source=("${pkgname}::git+https://github.com/MirBSD/kwalletcli.git")
sha512sums=('SKIP')
 
pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/^kwalletcli.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  sed -i -e 's/CPPFLAGS+=	${KDE_INCS} -D_GNU_SOURCE/CPPFLAGS+=	${KDE_INCS} -fPIC -D_GNU_SOURCE/' GNUmakefile
  make KDE_VER=5
}

package() {
  cd "$pkgname"
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  for F in kwalletaskpass kwalletcli kwalletcli_getpin pinentry-kwallet; do
    install ${F} "${pkgdir}"/usr/bin/${F}
    install -m644 ${F}.1 "${pkgdir}"/usr/share/man/man1/${F}.1
  done
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
