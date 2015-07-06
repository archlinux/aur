# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
pkgname=hol
pkgver=kananaskis.10
pkgrel=2
pkgdesc="Interactive proof assistant for higher order logic"
url='http://hol.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
source=("http://sourceforge.net/projects/hol/files/hol/${pkgver//./-}/hol-${pkgver//./-}.tar.gz"
        '0001-fix-holdir.patch'
        '0002-fix-emit.patch'
    )
depends=('polyml')
#optdepends=('graphviz')
conflicts=('mesa-demos' 'hol-git')
md5sums=('aaf565484d62f1b43423897a2e8517ac'
         'd613c3d825d6f382a24533c0136c5b1e'
         '4a01da11b5bfb917a3e5a08ee8bde856')

prepare() {
   cd "${srcdir}/${pkgname}-${pkgver//./-}"
   patch -p1 -i "${srcdir}/0001-fix-holdir.patch"
   patch -p1 -i "${srcdir}/0002-fix-emit.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver//./-}"
  #echo "val mosmldir = \"/usr/bin\";" > config-override
  echo "val holdir = \"/opt/hol\"" > tools-poly/poly-includes.ML
  poly < tools/smart-configure.sml 
  bin/build -nograph
}

package() {
  _oldtop="${srcdir}/${pkgname}-${pkgver//./-}"
  _newtop="/opt/hol"

  cd $_oldtop

  # fix broken symlinks
  for _link in $(find ${_oldtop}/sigobj/ -type l)
  do
    _oldsrc=$(readlink -v $_link)
    ln -sfn ${_oldsrc/$_oldtop/$_newtop} $_link
  done

  # fix references inside text files
  sed -i -e 's,'"$_oldtop"','"$_newtop"',g' bin/hol bin/hol.bare bin/hol.bare.noquote bin/hol.noquote sigobj/SRCFILES

  # install hol programs and libraries under /opt/hol
  install -m755 -d "${pkgdir}/opt/${pkgname}"
  install -m644 std.prelude "${pkgdir}/opt/${pkgname}"
  cp -r src "${pkgdir}/opt/${pkgname}"
  cp -r sigobj "${pkgdir}/opt/${pkgname}"
  cp -r bin "${pkgdir}/opt/${pkgname}"
  cp -r tools "${pkgdir}/opt/${pkgname}"
  cp -r tools-poly "${pkgdir}/opt/${pkgname}"
  cp -r help "${pkgdir}/opt/${pkgname}"

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"

  # make symlinks to /usr/bin
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/hol/bin/hol ${pkgdir}/usr/bin/hol
  ln -s /opt/hol/bin/hol.noquote ${pkgdir}/usr/bin/hol.noquote
  ln -s /opt/hol/bin/Holmake ${pkgdir}/usr/bin/Holmake

}
