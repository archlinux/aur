# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

_pkgname=nwchem
pkgname="${_pkgname}-git"
pkgver=r28217.efdd7b6c36
pkgrel=1
pkgdesc="Ab initio computational chemistry software package (SVN trunk via Git)"
arch=('i686' 'x86_64')
url="http://www.nwchem-sw.org/index.php/Main_Page"
license=('custom:ECL')
depends=('openmpi' 'python')
makedepends=('git' 'gcc' 'gcc-fortran' 'bash' 'lapack' 'subversion')
conflicts=("${_pkgname}" "${_pkgname}-data")
provides=("${_pkgname}")
install=nwchem.install
source=("${_pkgname}::git://github.com/NWChem/svn-trunk-import.git"
        "config.sh"
        "nwchemrc"
        "get-tools.diff")
sha256sums=('SKIP'
            '200ccb7c39c55cb3fa04b17063b31138d3f434b424f712983892ddce046bb1bc'
            'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f'
            '0f7e349c204f9775e2fcf232969d7a922d51433bf65bf4c92647e02d3bb7d70f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # For now, there is no Global Arrays package, so we allow checking
  # out an SVN copy.
  patch -p1 < "${srcdir}"/get-tools.diff
}

build() {
  cd "${srcdir}/${_pkgname}"

  source "${srcdir}"/config.sh

  if test "$CARCH" == x86_64; then
    export TARGET=LINUX64
    export NWCHEM_TARGET=LINUX64
  else
    export TARGET=LINUX
    export NWCHEM_TARGET=LINUX
  fi

  cd src
  make nwchem_config
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  if test "$CARCH" == x86_64; then
    export TARGET=LINUX64
  else
    export TARGET=LINUX
  fi

  install -d -m 755 "${pkgdir}"/usr/bin
  install -m 755 "${srcdir}/${_pkgname}"/bin/${TARGET}/nwchem "${pkgdir}"/usr/bin/

  install -d -m 755 "${pkgdir}"/usr/share/nwchem/
  cp -r "${srcdir}/${_pkgname}"/src/basis/libraries "${pkgdir}"/usr/share/nwchem/
  cp -r "${srcdir}/${_pkgname}"/src/data "${pkgdir}"/usr/share/nwchem/

  install -d -m 755 "${pkgdir}"/usr/share/nwchem/libraryps
  cp -r "${srcdir}/${_pkgname}"/src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} "${pkgdir}"/usr/share/nwchem/libraryps
  # ugh...
  chmod -R go=rX "${pkgdir}"/usr/share/nwchem/
  chmod -R u=wrX "${pkgdir}"/usr/share/nwchem/

  install -d -m 755 "${pkgdir}"/etc/skel/
  install -m 644 $srcdir/nwchemrc "${pkgdir}"/etc/skel/.nwchemrc

  install -d -m 755 "${pkgdir}"/usr/share/licenses/nwchem
  install -m 0644 "${srcdir}/${_pkgname}"/LICENSE.TXT "${pkgdir}"/usr/share/licenses/nwchem/
}

check() {
  cd "${srcdir}/${_pkgname}"

  source "${srcdir}"/config.sh

  if test "$CARCH" == x86_64; then
    export TARGET=LINUX64
    export NWCHEM_TARGET=LINUX64
  else
    export TARGET=LINUX
    export NWCHEM_TARGET=LINUX
  fi

  cd QA
  bash doqmtests_bash
}
