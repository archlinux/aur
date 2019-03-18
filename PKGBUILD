# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>

pkgname=hol-git
pkgver=20190312
pkgrel=1
pkgdesc='HOL4 theorem-proving system'
url='https://hol-theorem-prover.org/'
arch=('x86_64')
license=('BSD')
install="$pkgname.install"
source=("${pkgname}::git://github.com/HOL-Theorem-Prover/HOL.git")
md5sums=('SKIP')
depends=('polyml' 'graphviz')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/${pkgname}"

  poly < tools/smart-configure.sml
  bin/build

  bin/build cleanForReloc
}

package() {
  _oldtop="${srcdir}/${pkgname}"
  _newtop="/opt/hol"

  cd $_oldtop

  # install everything under /opt/hol
  install -m755 -d "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"

  # make symlinks to /usr/bin
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/hol/bin/hol ${pkgdir}/usr/bin/hol
  ln -s /opt/hol/bin/hol.noquote ${pkgdir}/usr/bin/hol.noquote
  ln -s /opt/hol/bin/Holmake ${pkgdir}/usr/bin/Holmake
}
