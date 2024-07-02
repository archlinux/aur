# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>

# FIXME: holyhammer fails to build with ocaml-num
pkgname=hol
pkgver=trindemossen.1
pkgrel=1
pkgdesc='HOL4 theorem-proving system'
url='https://hol-theorem-prover.org/'
arch=('x86_64')
license=('BSD')
install="$pkgname.install"
source=("https://github.com/HOL-Theorem-Prover/HOL/archive/${pkgver//./-}.tar.gz"
        #
       )
md5sums=('ca715375797791c035ebf67fdcd6d093')
depends=('polyml' 'graphviz')
provides=('hol')
conflicts=('hol-git')

build() {
  cd "${srcdir}/HOL-${pkgver//./-}"

  poly < tools/smart-configure.sml
  bin/build

  bin/build cleanForReloc
}

package() {
  _oldtop="${srcdir}/HOL-${pkgver//./-}"
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
